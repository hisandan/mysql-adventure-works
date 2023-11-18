INSERT INTO adw_dwh.DIM_Tienda (Tienda_id, Cod_postal, Ciudad, Estado, Pais, Nombre)
SELECT 
    SS.BusinessEntityID AS Tienda_id,
    PA.PostalCode AS Cod_postal,
    PA.City AS Ciudad,
    SP.Name AS Estado,
    PCR.Name AS Pais,
    SS.Name AS Nombre
FROM 
    adw.Sales_Store SS
INNER JOIN 
    adw.Person_BusinessEntity PBE ON SS.BusinessEntityID = PBE.BusinessEntityID
INNER JOIN 
    adw.Person_BusinessEntityAddress PBEA ON PBE.BusinessEntityID = PBEA.BusinessEntityID
INNER JOIN 
    adw.Person_Address PA ON PBEA.AddressID = PA.AddressID
INNER JOIN 
    adw.Person_StateProvince SP ON PA.StateProvinceID = SP.StateProvinceID
INNER JOIN 
    adw.Person_CountryRegion PCR ON SP.CountryRegionCode = PCR.CountryRegionCode;
