---Historial de citas con datos completos de veterinario
SELECT
  c.id_cita,
  c.fecha_hora,
  c.estado,
  m.nombre AS mascota,
  d.nombres + ' ' + d.apellidos AS dueno,
  v.nombres + ' ' + v.apellidos AS veterinario,
  s.nombre AS sede
FROM CITA c
JOIN MASCOTA m       ON m.id_mascota = c.id_mascota
JOIN DUENO d         ON d.id_dueno = m.id_dueno
JOIN VETERINARIO v   ON v.id_veterinario = c.id_veterinario
JOIN SEDE s          ON s.id_sede = v.id_sede
ORDER BY c.fecha_hora DESC;
GO

---Total de citas por veterinario 
USE PETCARE_DB;
GO

SELECT
  v.id_veterinario,
  v.nombres + ' ' + v.apellidos AS veterinario,
  COUNT(*) AS total_citas
FROM CITA c
JOIN VETERINARIO v ON v.id_veterinario = c.id_veterinario
GROUP BY v.id_veterinario, v.nombres, v.apellidos
ORDER BY total_citas DESC;
GO

---Mascotas con contacto de emergencia del dueño
USE PETCARE_DB;
GO

SELECT
    d.nombres + ' ' + d.apellidos AS dueno,
    m.nombre AS mascota,
    ce.nombre AS contacto_emergencia,
    ce.telefono,
    ce.relacion AS parentesco,
    COUNT(ce.id_mascota) OVER (PARTITION BY d.id_dueno) AS total_contactos_del_dueno
FROM MASCOTA m
INNER JOIN DUENO d
    ON d.id_dueno = m.id_dueno
LEFT JOIN CONTACTO_EMERGENCIA ce
    ON ce.id_mascota = m.id_mascota
ORDER BY dueno;
GO

---Veterinarios por sede
USE PETCARE_DB;
GO

SELECT 
    s.id_sede,
    s.nombre AS sede,
    s.direccion,
    v.id_veterinario,
    v.nombres + ' ' + v.apellidos AS veterinario,
    v.telefono,
    v.email,
    COUNT(v.id_veterinario) OVER(PARTITION BY s.id_sede) AS total_veterinarios_en_sede
FROM SEDE s
LEFT JOIN VETERINARIO v 
    ON v.id_sede = s.id_sede
ORDER BY s.nombre, veterinario;
GO

---Especialidades por veterinario
SELECT 
    v.id_veterinario,
    v.nombres + ' ' + v.apellidos AS veterinario,
    s.nombre AS sede,
    e.nombre AS especialidad
FROM VETERINARIO v
INNER JOIN SEDE s 
    ON s.id_sede = v.id_sede
INNER JOIN VETERINARIO_ESPECIALIDAD ve 
    ON ve.id_veterinario = v.id_veterinario
INNER JOIN ESPECIALIDAD e 
    ON e.id_especialidad = ve.id_especialidad
ORDER BY veterinario, especialidad;
GO

---Dueños con más de una mascota
SELECT 
    d.id_dueno,
    d.nombres + ' ' + d.apellidos AS dueno,
    d.telefono,
    d.email,
    COUNT(m.id_mascota) AS total_mascotas
FROM DUENO d
INNER JOIN MASCOTA m 
    ON m.id_dueno = d.id_dueno
GROUP BY 
    d.id_dueno,
    d.nombres,
    d.apellidos,
    d.telefono,
    d.email
HAVING COUNT(m.id_mascota) > 1
ORDER BY total_mascotas DESC;
GO

---Mascotas con más consultas en el último año
SELECT TOP 10
    m.id_mascota,
    m.nombre AS mascota,
    d.nombres + ' ' + d.apellidos AS dueno,
    COUNT(c.id_consulta) AS total_consultas,
    MAX(c.fecha_hora) AS ultima_consulta
FROM MASCOTA m
INNER JOIN DUENO d ON m.id_dueno = d.id_dueno
INNER JOIN CONSULTA c ON m.id_mascota = c.id_mascota
WHERE c.fecha_hora >= DATEADD(year, -1, GETDATE())
GROUP BY m.id_mascota, m.nombre, d.nombres, d.apellidos
ORDER BY total_consultas DESC;

---Medicamentos más recetados con total de prescripciones
SELECT
    me.nombre AS medicamento,
    me.descripcion,
    COUNT(rm.id_receta) AS veces_recetado,
    SUM(CAST(LEFT(rm.dosis, PATINDEX('%[^0-9]%', rm.dosis + ' ') - 1) AS INT)) AS unidades_aprox
FROM RECETA_MEDICAMENTO rm
INNER JOIN MEDICAMENTO me ON rm.id_medicamento = me.id_medicamento
GROUP BY me.id_medicamento, me.nombre, me.descripcion
ORDER BY veces_recetado DESC;

---Ocupación de áreas clínicas
SELECT
    a.nombre AS area_clinica,
    s.nombre AS sede,
    a.capacidad,
    COUNT(h.id_hospitalizacion) AS pacientes_actuales,
    a.capacidad - COUNT(h.id_hospitalizacion) AS plazas_disponibles,
    STRING_AGG(m.nombre, ', ') AS mascotas_internadas
FROM AREA_CLINICA a
INNER JOIN SEDE s ON a.id_sede = s.id_sede
LEFT JOIN HOSPITALIZACION h ON a.id_area_clinica = h.id_area_clinica
    AND h.fecha_salida IS NULL  -- hospitalizaciones activas
LEFT JOIN MASCOTA m ON h.id_mascota = m.id_mascota
GROUP BY a.id_area_clinica, a.nombre, a.capacidad, s.nombre
ORDER BY pacientes_actuales DESC;

---Listado de Mascotas y sus Contactos de Emergencia
SELECT
    M.nombre AS Mascota,
    D.nombres AS Dueno,
    CE.nombre AS Contacto_Emergencia,
    CE.telefono AS Telefono_Emergencia,
    CE.relacion AS Parentesco
FROM MASCOTA M
INNER JOIN DUENO D ON M.id_dueno = D.id_dueno
INNER JOIN CONTACTO_EMERGENCIA CE ON M.id_mascota = CE.id_mascota;

---Sedes con más Consultas Realizadas
SELECT
    S.nombre AS Nombre_Sede,
    COUNT(C.id_consulta) AS Total_Consultas
FROM CONSULTA C
INNER JOIN VETERINARIO V ON C.id_veterinario = V.id_veterinario
INNER JOIN SEDE S ON V.id_sede = S.id_sede
GROUP BY S.nombre
ORDER BY Total_Consultas DESC;

---Resumen de Ingresos por tipo de Servicio
SELECT
    nombre AS Tipo_Servicio,
    SUM(costo) AS Ingresos_Totales
FROM SERVICIO
GROUP BY nombre;

---