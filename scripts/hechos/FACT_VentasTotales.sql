INSERT INTO adw_dwh.FACT_VentasTotales (
    Venta_id,
    Valor,
    Costo,
    Descuento,
    Profit,
    Fecha_Key,
    Vendedor_Key,
    Tienda_Key,
    Cliente_Key,
    Entrega_Key,
    Producto_Key
)
SELECT
    sod.SalesOrderDetailID AS Venta_id,
    (sod.UnitPrice * sod.OrderQty) AS Valor,
    (p.StandardCost * sod.OrderQty) AS Costo,
    (sod.UnitPriceDiscount * sod.OrderQty) AS Descuento,
    ((sod.UnitPrice * sod.OrderQty) - (p.StandardCost * sod.OrderQty) - (sod.UnitPriceDiscount * sod.OrderQty)) AS Profit,
    -- fecha_key
    -- fv.Fecha_Key as Fecha_Key,
    1 as Fecha_Key,
    sp.BusinessEntityID AS Vendedor_Key,
    dt.Tienda_key AS Tienda_Key,
    dc.cliente_key AS Cliente_Key,
    de.entrega_key AS Entrega_Key,
    dp.producto_key AS Producto_Key
FROM
    adw.Sales_SalesOrderDetail sod
JOIN adw.Sales_SalesOrderHeader soh ON sod.SalesOrderID = soh.SalesOrderID
JOIN adw.Production_Product p ON sod.ProductID = p.ProductID
JOIN adw.Sales_SalesPerson sp ON soh.SalesPersonID = sp.BusinessEntityID
JOIN adw.Sales_Customer c ON  c.CustomerID = soh.CustomerID
JOIN adw_dwh.DIM_Tienda dt ON  c.StoreID = dt.Tienda_id
JOIN adw_dwh.DIM_Cliente dc ON c.CustomerID = dc.cliente_id
JOIN adw_dwh.DIM_Entrega de ON soh.ShipToAddressID = de.entrega_id
JOIN adw_dwh.DIM_Producto dp ON sod.ProductID = dp.producto_id 

-- JOIN adw_dwh.DIM_Fecha_Venta fv ON fv.fecha = DATE(soh.OrderDate)
limit 10000;
-- se utilizo limit 100000 porque o si no habian muchos datos y no terminaba la consulta