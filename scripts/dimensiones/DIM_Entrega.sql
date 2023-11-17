INSERT INTO adw_dwh.DIM_Entrega (entrega_id, Metodo_de_entrega, Zip_code)
SELECT
    CONCAT('AddressID_', po.ShipToAddressID) AS entrega_id,
    sm.Name AS Metodo_de_entrega,
    pa.PostalCode AS Zip_code
FROM
    adw.Sales_SalesOrderHeader po 
LEFT JOIN
    adw.Person_Address pa ON pa.AddressID = po.ShipToAddressID
-- LEFT JOIN
--     Purchasing_PurchaseOrderDetail pd ON po.PurchaseOrderID = pd.PurchaseOrderID
LEFT JOIN
    adw.Purchasing_ShipMethod sm ON sm.ShipMethodID = po.ShipMethodID

