INSERT INTO adw_dwh.FACT_NuevoDomicilio (
    Domicilio_id,
    Ship_rate,
    Ship_base,
    Costo_orden,
    Costo_envio,
    Tamano,
    Peso,
    Entrega_Key,
    Producto_Key,
    ShipDate_Key,
    DueDate_Key,
    OrderDate_Key
)
SELECT
    so.SalesOrderID AS Domicilio_id,
    so.Freight AS Ship_rate,
    sm.ShipBase AS Ship_base,
    (so.SubTotal + so.TaxAmt) AS Costo_orden,
    so.Freight AS Costo_envio,
    p.Size AS Tamano,
    p.Weight AS Peso,
    e.Entrega_key AS Entrega_Key,
    pr.Producto_key AS Producto_Key,
    fs.Fecha_key as ShipDate_Key,
    fd.Fecha_key as DueDate_Key,
    fo.Fecha_key as OrderDate_Key
FROM
    adw.Sales_SalesOrderHeader so
JOIN
    adw.Purchasing_ShipMethod sm ON so.ShipMethodID = sm.ShipMethodID
JOIN
    adw.Person_Address pa ON so.ShipToAddressID = pa.AddressID
JOIN
    adw_dwh.DIM_Entrega e ON pa.AddressID = e.entrega_id
JOIN
    adw.Sales_SalesOrderDetail sod ON so.SalesOrderID = sod.SalesOrderID
JOIN
    adw.Production_Product p ON sod.ProductID = p.ProductID
JOIN
    adw_dwh.DIM_Producto pr ON p.ProductID = pr.producto_id 

JOIN adw_dwh.DIM_Fecha_Venta fo ON fo.fecha = DATE(so.OrderDate)
JOIN adw_dwh.DIM_Fecha_OrderShipDate fs ON fs.fecha = DATE(so.ShipDate)
JOIN adw_dwh.DIM_Fecha_OrderDueDate fd ON fd.fecha = DATE(so.DueDate)
    
    
    limit 10000;
