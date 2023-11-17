INSERT INTO adw_dwh.DIM_Producto (producto_id, Subcategoria, Categoria, Nombre)
SELECT 
    CONCAT('PROD_', p.ProductID), 
    ps.Name AS Subcategoria,
    pc.Name AS Categoria,
    p.Name
FROM 
    adw.Production_Product AS p
JOIN 
    adw.Production_ProductSubcategory AS ps 
ON 
    p.ProductSubcategoryID = ps.ProductSubcategoryID
JOIN 
    adw.Production_ProductCategory AS pc 
ON 
    ps.ProductCategoryID = pc.ProductCategoryID;
