INSERT INTO adw.DIM_Entrega (entrega_id, Metodo_de_entrega, Zip_code)
SELECT
    CONCAT('AddressID_', po.ShipToAddressID) AS entrega_id,
    sm.Name AS Metodo_de_entrega,
    pa.PostalCode AS Zip_code
FROM
    Sales_SalesOrderHeader po 
LEFT JOIN
    Person_Address pa ON pa.AddressID = po.ShipToAddressID
-- LEFT JOIN
--     Purchasing_PurchaseOrderDetail pd ON po.PurchaseOrderID = pd.PurchaseOrderID
LEFT JOIN
    Purchasing_ShipMethod sm ON sm.ShipMethodID = po.ShipMethodID

