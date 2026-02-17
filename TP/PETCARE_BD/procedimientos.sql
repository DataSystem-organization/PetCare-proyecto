---Consultar Citas programadas por veterinario
CREATE OR ALTER PROCEDURE usp_agenda_veterinario_dia
    @id_vet INT,
    @fecha_busqueda DATE
AS
BEGIN
    SET NOCOUNT ON;


    SELECT
        C.fecha_hora AS Fecha_Hora,
        M.nombre AS Nombre_Mascota,
        M.especie AS Especie,
        D.nombres AS Nombre_Dueno,
        D.apellidos AS Apellido_Dueno,
        C.motivo AS Motivo_Cita,
        C.estado AS Estado_Cita
    FROM CITA C
    INNER JOIN MASCOTA M ON C.id_mascota = M.id_mascota
    INNER JOIN DUENO D ON M.id_dueno = D.id_dueno
    WHERE C.id_veterinario = @id_vet
      AND CAST(C.fecha_hora AS DATE) = @fecha_busqueda
    ORDER BY C.fecha_hora ASC;
END;
GO

EXEC usp_agenda_veterinario_dia @id_vet = 1, @fecha_busqueda = '2025-08-15';
GO

---Generar recordatorios de vacunas próximas
DROP PROCEDURE IF EXISTS sp_generator_recordatorios_vacunas;
GO

CREATE PROCEDURE sp_generator_recordatorios_vacunas
    @dias_anticipacion INT = 365
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        m.id_mascota,
        m.nombre AS mascota,
        d.nombres + ' ' + d.apellidos AS dueno,
        d.telefono,
        d.email,
        v.nombre AS vacuna,
        mv.proxima_dosis,
        DATEDIFF(day, GETDATE(), mv.proxima_dosis) AS dias_restantes,
        CASE
            WHEN DATEDIFF(day, GETDATE(), mv.proxima_dosis) <= 0 THEN 'VENCIDA'
            WHEN DATEDIFF(day, GETDATE(), mv.proxima_dosis) <= 3 THEN 'URGENTE'
            WHEN DATEDIFF(day, GETDATE(), mv.proxima_dosis) <= 7 THEN 'PRÓXIMA'
            ELSE 'PENDIENTE'
        END AS prioridad
    FROM MASCOTA_VACUNA mv
    INNER JOIN MASCOTA m ON mv.id_mascota = m.id_mascota
    INNER JOIN DUENO d ON m.id_dueno = d.id_dueno
    INNER JOIN VACUNA v ON mv.id_vacuna = v.id_vacuna
    WHERE mv.proxima_dosis BETWEEN GETDATE() AND DATEADD(day, @dias_anticipacion, GETDATE())
       OR mv.proxima_dosis < GETDATE()
    ORDER BY mv.proxima_dosis;
END;
GO

EXEC sp_generator_recordatorios_vacunas;
GO
