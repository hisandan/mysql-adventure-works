INSERT INTO adw_dwh.DIM_Vendedor (Vendedor_id, Antiguedad, Estado_Marital, Salario, Titulo)
SELECT
    E.BusinessEntityID AS Vendedor_id,
    DATEDIFF(CURRENT_TIMESTAMP, E.ModifiedDate) AS Antiguedad,
    E.MaritalStatus AS Estado_Marital,
    EPH.rate AS Salario,
    E.jobTitle AS Titulo
FROM
    adw.HumanResources_Employee as E
LEFT JOIN
    adw.HumanResources_EmployeePayHistory as EPH on E.BusinessEntityID = EPH.BusinessEntityID;