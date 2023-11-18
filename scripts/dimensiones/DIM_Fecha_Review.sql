INSERT INTO adw_dwh.DIM_Fecha_Review (Fecha, Dia, Mes, Anio)
SELECT
    fecha,
    DAY(fecha) as Dia,
    MONTH(fecha) as Mes,
    YEAR(fecha) as Anio
FROM (
    SELECT DISTINCT DATE(ModifiedDate) as fecha
    FROM adw.Production_ProductReview
) AS fechas;
