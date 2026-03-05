//Listado completo de mascotas registradas
db.MASCOTA.aggregate([
{
$project: {
nombre: 1,
especie: 1,
fecha_nacimiento: {
$dateToString: { format: "%Y-%m-%d %H:%M:%S", date: "$fecha_nacimiento", timezone: "America/Lima" }
},
alergias: 1,
reacciones_medicamentos: 1,
rasgos_particulares: 1,
observaciones_clinicas: 1,
estado_actual: 1,
ultima_consulta_resumen: {
fecha: {
$dateToString: { format: "%Y-%m-%d %H:%M:%S", date: "$ultima_consulta_resumen.fecha", timezone: "America/Lima" }
},
motivo: "$ultima_consulta_resumen.motivo"
}
}
},
{ $sort: { nombre: 1 } }
])

//Consultas realizadas en un mes específico
db.CONSULTA.aggregate([
{
$match: {
// Filtra consultas en el rango de fechas: ej. febrero 2026
fecha_consulta: {
$gte: ISODate("2026-02-01T00:00:00Z"),
$lte: ISODate("2026-02-28T23:59:59Z")
}
}
},
{
$project: {
mascota: "$mascota_snapshot.nombre",
fecha: {
$dateToString: { format: "%Y-%m-%d %H:%M:%S", date: "$fecha_consulta", timezone: "America/Lima" }
},
motivo: 1
}
},
{ $sort: { fecha: 1 } }
])

//Mascotas agrupados por especie con su cantidad y última consulta registrada
db.MASCOTA.aggregate([
  {
    $lookup: {
      from: "CONSULTA",
      localField: "_id",
      foreignField: "mascota_id",
      as: "consultas"
    }
  },
  {
    $group: {
      _id: "$especie",
      total_mascotas: { $sum: 1 },
      ultima_consulta_general: {
        $max: {
          $max: "$consultas.fecha_consulta"
        }
      }
    }
  },
  {
    $project: {
      especie: "$_id",
      total_mascotas: 1,
      ultima_consulta_general: 1,
      _id: 0
    }
  },
  { $sort: { total_mascotas: -1 } }
])

//veterinarios con mayor cantidad de consultas atendidas
db.CONSULTA.aggregate([
  {
    $group: {
      _id: {
        veterinario_nombre: "$veterinario_snapshot.nombre",
        especialidad: "$veterinario_snapshot.especialidad"
      },
      total_consultas: { $sum: 1 },
      ultima_consulta: { $max: "$fecha_consulta" },
      mascotas_atendidas: { $addToSet: "$mascota_id" }
    }
  },
  {
    $project: {
      veterinario: "$_id.veterinario_nombre",
      especialidad: "$_id.especialidad",
      total_consultas: 1,
      ultima_consulta: 1,
      mascotas_distintas: { $size: "$mascotas_atendidas" },
      _id: 0
    }
  },
  { $sort: { total_consultas: -1 } }
])

//Mascotas registradas según estado de salud
db.MASCOTA.aggregate([
{
$group: {
_id: "$estado_actual",
total_mascotas: { $sum: 1 }
}
},
{
$project: {
estado_salud: "$_id",
total_mascotas: 1,
_id: 0
}
},
{
$sort: { total_mascotas: -1 }
}
])

//Consultas agrupadas por motivo
db.CONSULTA.aggregate([
{
$group: {
_id: "$motivo",
total_consultas: { $sum: 1 }
}
},
{
$project: {
motivo: "$_id",
total_consultas: 1,
_id: 0
}
},
{
$sort: { total_consultas: -1 }
}
])

//Reporte de mascotas con sensibilidad médica y alertas activas
db.MASCOTA.aggregate([
  {
    $match: {
      $or: [
        { "alergias": { $exists: true, $ne: [] } },
        { "reacciones_medicamentos": { $exists: true, $ne: [] } }
      ]
    }
  },
  {
    $project: {
      _id: 0,
      nombre_paciente: "$nombre",
      especie: 1,
      riesgos_medicos: {
        alergias: "$alergias",
        reacciones: "$reacciones_medicamentos"
      },
      alerta_actual: "$estado_actual.alerta",
      peso_registrado: "$estado_actual.peso",
      ultima_visita_por: "$ultima_consulta_resumen.motivo"
    }
  },
  {
    $sort: { especie: 1, nombre_paciente: 1 }
  }
])

//Análisis de consultas con alertas por signos vitales críticos en pacientes
db.CONSULTA.aggregate([
  {
    $match: {
      "signos_vitales.temperatura": { $gt: 39.5 }
    }
  },
  {
    $group: {
      _id: "$motivo",
      cantidad_casos_fiebre: { $sum: 1 },
      diagnosticos_observados: { $push: "$diagnosticos" }
    }
  },
  {
    $project: {
      _id: 0,
      motivo_consulta: "$_id",
      total_alertas: "$cantidad_casos_fiebre",
      lista_diagnosticos: "$diagnosticos_observados"
    }
  },
  {
    $sort: { total_alertas: -1 }
  }
])

//Mascotas con más de una consulta registrada
db.CONSULTA.aggregate([
{
$group: {
_id: "$mascota_id",
total_consultas: { $sum: 1 },
nombre: { $first: "$mascota_snapshot.nombre" },
especie: { $first: "$mascota_snapshot.especie" }
}
},
{
$match: {
total_consultas: { $gt: 1 }
}
},
{
$sort: { total_consultas: -1 }
}
])

//Total de consultas por las especialidades de los veterinarios
db.CONSULTA.aggregate([
{
$group: {
_id: "$veterinario_snapshot.especialidad",
total_consultas: { $sum: 1 }
}
},
{
$sort: { total_consultas: -1 }
}
])