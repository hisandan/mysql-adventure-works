INSERT INTO adw_dwh.FACT_NuevaReview (Rewiev_id, Estrellas, Producto_Key)
SELECT
    pr.ProductReviewID AS Rewiev_id,
    pr.Rating AS Estrellas,
    p.ProductID AS Producto_Key
FROM
    adw.Production_ProductReview AS pr
JOIN
    adw.Production_Product AS p ON pr.ProductID = p.ProductID limit 100000;
