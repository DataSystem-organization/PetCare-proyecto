---Atenciones por veterinario
CREATE OR ALTER FUNCTION fn_detalle_atenciones_veterinario
(
    @id_veterinario INT
)
RETURNS TABLE
AS
RETURN
(
    SELECT 
        v.id_veterinario,
        v.nombres + ' ' + v.apellidos AS veterinario,
        s.nombre AS sede,
        m.nombre AS mascota,
        c.fecha_hora
    FROM CONSULTA c
    INNER JOIN VETERINARIO v
        ON v.id_veterinario = c.id_veterinario
    INNER JOIN SEDE s
        ON s.id_sede = v.id_sede
    INNER JOIN MASCOTA m
        ON m.id_mascota = c.id_mascota
    WHERE v.id_veterinario = @id_veterinario
);
GO
--- Ejemplo de uso:
SELECT * 
FROM dbo.fn_detalle_atenciones_veterinario(10);
