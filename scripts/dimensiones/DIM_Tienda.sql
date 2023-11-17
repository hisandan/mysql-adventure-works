INSERT INTO adw.DIM_Tienda (Tienda_id, Cod_postal, Ciudad, Estado, Pais, Nombre)
SELECT 
    CONCAT('Store_', SS.BusinessEntityID) AS Tienda_id,
    PA.PostalCode AS Cod_postal,
    PA.City AS Ciudad,
    SP.Name AS Estado,
    PCR.Name AS Pais,
    SS.Name AS Nombre
FROM 
    Sales_Store SS
INNER JOIN 
    Person_BusinessEntity PBE ON SS.BusinessEntityID = PBE.BusinessEntityID
INNER JOIN 
    Person_BusinessEntityAddress PBEA ON PBE.BusinessEntityID = PBEA.BusinessEntityID
INNER JOIN 
    Person_Address PA ON PBEA.AddressID = PA.AddressID
INNER JOIN 
    Person_StateProvince SP ON PA.StateProvinceID = SP.StateProvinceID
INNER JOIN 
    Person_CountryRegion PCR ON SP.CountryRegionCode = PCR.CountryRegionCode;
