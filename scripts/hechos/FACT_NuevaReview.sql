INSERT INTO adw_dwh.FACT_NuevaReview (Rewiev_id, Estrellas, Producto_Key, Fecha_Key)
SELECT
    pr.ProductReviewID AS Rewiev_id,
    pr.Rating AS Estrellas,
    dp.Producto_Key AS Producto_Key,
    f.Fecha_Key as Fecha_Key
FROM
    adw.Production_ProductReview AS pr
JOIN
    adw_dwh.DIM_Producto AS dp ON pr.ProductID = dp.producto_id
JOIN 
     adw_dwh.DIM_Fecha_Review  as f ON f.Fecha =  DATE(pr.ModifiedDate)
 limit 10000;
