INSERT INTO adw.DIM_Producto (producto_id, Subcategoria, Categoria, Nombre)
SELECT 
    CONCAT('PROD_', p.ProductID), 
    ps.Name AS Subcategoria,
    pc.Name AS Categoria,
    p.Name
FROM 
    Production_Product AS p
JOIN 
    Production_ProductSubcategory AS ps 
ON 
    p.ProductSubcategoryID = ps.ProductSubcategoryID
JOIN 
    Production_ProductCategory AS pc 
ON 
    ps.ProductCategoryID = pc.ProductCategoryID;
