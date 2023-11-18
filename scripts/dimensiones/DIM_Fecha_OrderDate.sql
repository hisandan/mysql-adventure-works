INSERT INTO adw_dwh.DIM_Fecha_OrderDate (Fecha, Dia, Mes, Anio)
SELECT
    fecha,
    DAY(fecha) as Dia,
    MONTH(fecha) as Mes,
    YEAR(fecha) as Anio
 
 
FROM (
    SELECT distinct DATE(OrderDate) as fecha
    FROM adw.Sales_SalesOrderHeader
) As fechas;


