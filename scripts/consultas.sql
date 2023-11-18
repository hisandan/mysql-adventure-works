use adw_dwh;


-- Encontrar los productos más vendidos por categoría:
SELECT Categoria, Nombre AS Producto, COUNT(Producto_id) AS Cantidad_Vendida
FROM FACT_VentasTotales
JOIN DIM_Producto ON FACT_VentasTotales.Producto_Key = DIM_Producto.producto_key
GROUP BY Categoria, Nombre
ORDER BY Cantidad_Vendida DESC;


-- Calcular el costo total de envío y orden por año:
SELECT Anio, SUM(Costo_orden + Costo_envio) AS Costo_Total
FROM FACT_NuevoDomicilio
JOIN DIM_Fecha_OrderDate ON FACT_NuevoDomicilio.OrderDate_Key = DIM_Fecha_OrderDate.Fecha_key
GROUP BY Anio;

-- Clientes que más han gastado en cada categoría:
SELECT C.cliente_id, P.Categoria, SUM(V.Valor) AS Total_Gastado
FROM DIM_Cliente C
JOIN FACT_VentasTotales V ON C.cliente_key = V.Cliente_Key
JOIN DIM_Producto P ON V.Producto_Key = P.producto_key
GROUP BY C.cliente_id, P.Categoria
HAVING Total_Gastado = (
    SELECT MAX(Total_Gastado)
    FROM (
        SELECT SUM(V2.Valor) AS Total_Gastado
        FROM DIM_Cliente C2
        JOIN FACT_VentasTotales V2 ON C2.cliente_key = V2.Cliente_Key
        JOIN DIM_Producto P2 ON V2.Producto_Key = P2.producto_key
        WHERE C2.cliente_id = C.cliente_id
        GROUP BY P2.Categoria
    ) AS SubQuery
);



-- Top 3 de métodos de entrega más utilizados por año:
SELECT D.Metodo_de_entrega, F.Anio, COUNT(*) AS Total_Usos
FROM DIM_Entrega D
JOIN FACT_NuevoDomicilio ND ON D.entrega_key = ND.Entrega_Key
JOIN DIM_Fecha_OrderDate F ON ND.OrderDate_Key = F.Fecha_key
GROUP BY D.Metodo_de_entrega, F.Anio
ORDER BY F.Anio, Total_Usos DESC
LIMIT 3;


-- Clientes que han realizado compras en múltiples categorías:
SELECT C.cliente_id, COUNT(DISTINCT P.Categoria) AS Categorias_Diferentes
FROM DIM_Cliente C
JOIN FACT_VentasTotales V ON C.cliente_key = V.Cliente_Key
JOIN DIM_Producto P ON V.Producto_Key = P.producto_key
GROUP BY C.cliente_id
HAVING Categorias_Diferentes > 1;
