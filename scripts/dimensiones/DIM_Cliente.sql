INSERT INTO adw_dwh.DIM_Cliente (cliente_id, Demografia, Suffix, Title, PersonType)
SELECT
    CONCAT('CLI_', c.CustomerID),
    p.Demographics AS Demografia,
    p.Suffix,
    p.Title,
    p.PersonType
FROM
    adw.Sales_Customer AS c
JOIN
    adw.Person_Person AS p
ON
    p.BusinessEntityID = c.PersonID;