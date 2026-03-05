// ============================
// CREACIÓN DE BASE DE DATOS
// ============================
use PETCARE_DB_NoSQL;

// =========================
// CREAR COLECCIÓN MASCOTA
// =========================
db.createCollection("MASCOTA", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      required: ["nombre", "especie", "fecha_nacimiento", "propietario_id"],
      properties: {

        nombre: {
          bsonType: "string",
          description: "Nombre de la mascota"
        },

        especie: {
          bsonType: "string",
          enum: ["PERRO", "GATO", "AVE", "ROEDOR", "OTRO"],
          description: "Tipo de mascota"
        },

        fecha_nacimiento: {
          bsonType: "date",
          description: "Fecha de nacimiento de la mascota"
        },

        propietario_id: {
          bsonType: "objectId",
          description: "Referencia al dueño de la mascota"
        },

        alergias: {
          bsonType: "array",
          items: { bsonType: "string" },
          description: "Lista de alergias conocidas"
        },

        reacciones_medicamentos: {
          bsonType: "array",
          items: { bsonType: "string" },
          description: "Reacciones adversas a medicamentos"
        },

        rasgos_particulares: {
          bsonType: "array",
          items: { bsonType: "string" },
          description: "Características físicas únicas"
        },

        observaciones_clinicas: {
          bsonType: "string",
          description: "Notas médicas relevantes"
        },

        estado_actual: {
          bsonType: "object",
          description: "Resumen del estado de salud actual"
        },

        ultima_consulta_resumen: {
          bsonType: "object",
          description: "Subconjunto con fecha y motivo de la última consulta"
        }

      }
    }
  },
  validationLevel: "strict",
  validationAction: "error"
});

// =========================
// CREAR COLECCIÓN CONSULTA
// =========================
db.createCollection("CONSULTA", {
  validator: {
  $jsonSchema: {
    bsonType: "object",
    required: ["mascota_id", "veterinario_id", "fecha_consulta", "motivo"],
    properties: {

      mascota_id: {
        bsonType: "objectId",
        description: "Referencia a la mascota atendida"
      },

      veterinario_id: {
        bsonType: "objectId",
        description: "Referencia al veterinario responsable"
      },

      fecha_consulta: {
        bsonType: "date",
        description: "Fecha y hora de la consulta"
      },

      motivo: {
        bsonType: "string",
        description: "Razón principal de la consulta"
      },

      diagnosticos: {
        bsonType: "array",
        items: { bsonType: "string" },
        description: "Lista de diagnósticos realizados"
      },

      examenes: {
        bsonType: "array",
        items: { bsonType: "object" },
        description: "Resultados de exámenes clínicos"
      },

      tratamientos_receta: {
        bsonType: "array",
        items: { bsonType: "object" },
        description: "Medicamentos o tratamientos prescritos"
      },

      signos_vitales: {
        bsonType: "object",
        description: "Valores clínicos como temperatura y frecuencia cardiaca"
      },

      observaciones: {
        bsonType: "string",
        description: "Notas adicionales del veterinario"
      },

      metadata_clinica: {
        bsonType: "object",
        description: "Campo flexible para atributos dinámicos según especialidad"
      },

      mascota_snapshot: {
        bsonType: "object",
        required: ["nombre", "especie"],
        properties: {
          nombre: {
            bsonType: "string",
            description: "Nombre de la mascota"
          },
          especie: {
            bsonType: "string",
            description: "Especie de la mascota"
          }
        },
        description: "Subconjunto con nombre y especie de la mascota"
      },

      veterinario_snapshot: {
        bsonType: "object",
        required: ["nombre", "especialidad"],
        properties: {
          nombre: {
            bsonType: "string",
            description: "Nombre del veterinario"
          },
          especialidad: {
            bsonType: "string",
            description: "Especialidad médica del veterinario"
          }
        },
        description: "Subconjunto con nombre y especialidad del veterinario"
      }

    }
  }
},
 validationLevel: "strict",
 validationAction: "error"
});

// ============================
// INSERTAR DATOS - MASCOTA
// ============================

db.MASCOTA.insertMany([
{
_id: ObjectId("65f000000000000000000001"),
nombre: "Luna",
especie: "PERRO",
fecha_nacimiento: ISODate("2021-05-10"),
propietario_id: ObjectId("66f000000000000000000001"),
alergias: ["Polen"],
reacciones_medicamentos: ["Penicilina"],
rasgos_particulares: ["Mancha blanca en el pecho"],
observaciones_clinicas: "Paciente sensible al frío",
estado_actual: { alerta: "Control anual pendiente", peso: 12 },
ultima_consulta_resumen: { fecha: ISODate("2026-02-10"), motivo: "Chequeo general" }
},
{
_id: ObjectId("65f000000000000000000002"),
nombre: "Milo",
especie: "GATO",
fecha_nacimiento: ISODate("2020-08-15"),
propietario_id: ObjectId("66f000000000000000000002"),
alergias: [],
reacciones_medicamentos: [],
rasgos_particulares: ["Ojos azules"],
observaciones_clinicas: "Sin antecedentes graves",
estado_actual: { alerta: "Vacunación pendiente", peso: 5 },
ultima_consulta_resumen: { fecha: ISODate("2026-01-20"), motivo: "Vacunación" }
},
{
_id: ObjectId("65f000000000000000000003"),
nombre: "Kiwi",
especie: "AVE",
fecha_nacimiento: ISODate("2022-03-01"),
propietario_id: ObjectId("66f000000000000000000003"),
alergias: ["Polvo de jaula"],
reacciones_medicamentos: [],
rasgos_particulares: ["Plumas verdes intensas"],
observaciones_clinicas: "Ave activa",
estado_actual: { alerta: "Control nutricional", peso: 0.25 },
ultima_consulta_resumen: { fecha: ISODate("2026-02-01"), motivo: "Chequeo general" }
},
{
_id: ObjectId("65f000000000000000000004"),
nombre: "Ratatouille",
especie: "ROEDOR",
fecha_nacimiento: ISODate("2022-05-05"),
propietario_id: ObjectId("66f000000000000000000004"),
alergias: [],
reacciones_medicamentos: [],
rasgos_particulares: ["Cola larga y peluda"],
observaciones_clinicas: "Muy activo y curioso",
estado_actual: { alerta: "Control general", peso: 0.6 },
ultima_consulta_resumen: { fecha: ISODate("2026-01-20"), motivo: "Chequeo general" }
},
{
_id: ObjectId("65f000000000000000000005"),
nombre: "Bola de Nieve",
especie: "GATO",
fecha_nacimiento: ISODate("2020-12-12"),
propietario_id: ObjectId("66f000000000000000000005"),
alergias: ["Pescado"],
reacciones_medicamentos: ["Antiinflamatorios"],
rasgos_particulares: ["Pelaje completamente blanco"],
observaciones_clinicas: "Algo perezoso",
estado_actual: { alerta: "Control digestivo", peso: 5.2 },
ultima_consulta_resumen: { fecha: ISODate("2026-01-25"), motivo: "Problemas digestivos" }
}
]);

// ============================
// INSERTAR DATOS - CONSULTA
// ============================

db.CONSULTA.insertMany([
{
mascota_id: ObjectId("65f000000000000000000001"),
veterinario_id: ObjectId("77f000000000000000000001"),
fecha_consulta: ISODate("2026-02-10T10:00:00Z"),
motivo: "Dermatología",
diagnosticos: ["Dermatitis leve"],
signos_vitales: { temperatura: 38.5, frecuencia_cardiaca: 90 },
mascota_snapshot: { nombre: "Luna", especie: "PERRO" },
veterinario_snapshot: { nombre: "Dra. Marisol", especialidad: "Dermatología" }
},
{
mascota_id: ObjectId("65f000000000000000000001"),
veterinario_id: ObjectId("77f000000000000000000002"),
fecha_consulta: ISODate("2026-03-01T09:00:00Z"),
motivo: "Chequeo general",
diagnosticos: ["Paciente estable"],
signos_vitales: { temperatura: 38.2, frecuencia_cardiaca: 88 },
mascota_snapshot: { nombre: "Luna", especie: "PERRO" },
veterinario_snapshot: { nombre: "Dr. Carlos", especialidad: "General" }
},
{
mascota_id: ObjectId("65f000000000000000000002"),
veterinario_id: ObjectId("77f000000000000000000002"),
fecha_consulta: ISODate("2026-01-20T11:00:00Z"),
motivo: "Vacunación",
diagnosticos: ["Vacuna aplicada correctamente"],
signos_vitales: { temperatura: 38.0, frecuencia_cardiaca: 85 },
mascota_snapshot: { nombre: "Milo", especie: "GATO" },
veterinario_snapshot: { nombre: "Dr. Carlos", especialidad: "General" }
},
{
mascota_id: ObjectId("65f000000000000000000002"),
veterinario_id: ObjectId("77f000000000000000000003"),
fecha_consulta: ISODate("2026-04-10T15:00:00Z"),
motivo: "Cardiología",
diagnosticos: ["Soplo leve"],
signos_vitales: { temperatura: 39.5, frecuencia_cardiaca: 120 },
mascota_snapshot: { nombre: "Milo", especie: "GATO" },
veterinario_snapshot: { nombre: "Dra. Elena", especialidad: "Cardiología" }
},
{
mascota_id: ObjectId("65f000000000000000000003"),
veterinario_id: ObjectId("77f000000000000000000002"),
fecha_consulta: ISODate("2026-02-01T08:00:00Z"),
motivo: "Chequeo general",
diagnosticos: ["Buen estado general"],
signos_vitales: { temperatura: 40.1, frecuencia_cardiaca: 150 },
mascota_snapshot: { nombre: "Kiwi", especie: "AVE" },
veterinario_snapshot: { nombre: "Dr. Carlos", especialidad: "General" }
},
{
mascota_id: ObjectId("65f000000000000000000003"),
veterinario_id: ObjectId("77f000000000000000000004"),
fecha_consulta: ISODate("2026-05-01T10:00:00Z"),
motivo: "Nutrición",
diagnosticos: ["Dieta ajustada"],
signos_vitales: { temperatura: 39.0, frecuencia_cardiaca: 140 },
mascota_snapshot: { nombre: "Kiwi", especie: "AVE" },
veterinario_snapshot: { nombre: "Dr. Luis", especialidad: "Nutrición" }
},
{
mascota_id: ObjectId("65f000000000000000000004"),
veterinario_id: ObjectId("77f000000000000000000003"),
fecha_consulta: ISODate("2026-06-15T14:00:00Z"),
motivo: "Chequeo general",
diagnosticos: ["Salud estable"],
signos_vitales: { temperatura: 38.7, frecuencia_cardiaca: 110 },
mascota_snapshot: { nombre: "Ratatouille", especie: "ROEDOR" },
veterinario_snapshot: { nombre: "Dra. Elena", especialidad: "Cardiología" }
},
{
mascota_id: ObjectId("65f000000000000000000005"),
veterinario_id: ObjectId("77f000000000000000000001"),
fecha_consulta: ISODate("2026-07-10T12:00:00Z"),
motivo: "Dermatología",
diagnosticos: ["Alergia alimentaria"],
signos_vitales: { temperatura: 39.2, frecuencia_cardiaca: 100 },
mascota_snapshot: { nombre: "Bola de Nieve", especie: "GATO" },
veterinario_snapshot: { nombre: "Dra. Marisol", especialidad: "Dermatología" }
},
{
mascota_id: ObjectId("65f000000000000000000001"),
veterinario_id: ObjectId("77f000000000000000000002"),
fecha_consulta: ISODate("2026-08-20T10:00:00Z"),
motivo: "Emergencia",
diagnosticos: ["Intoxicación leve"],
signos_vitales: { temperatura: 40.0, frecuencia_cardiaca: 140 },
mascota_snapshot: { nombre: "Luna", especie: "PERRO" },
veterinario_snapshot: { nombre: "Dr. Carlos", especialidad: "General" }
},
{
mascota_id: ObjectId("65f000000000000000000003"),
veterinario_id: ObjectId("77f000000000000000000004"),
fecha_consulta: ISODate("2026-09-01T09:00:00Z"),
motivo: "Control nutricional",
diagnosticos: ["Peso adecuado"],
signos_vitales: { temperatura: 39.3, frecuencia_cardiaca: 145 },
mascota_snapshot: { nombre: "Kiwi", especie: "AVE" },
veterinario_snapshot: { nombre: "Dr. Luis", especialidad: "Nutrición" }
}
]);