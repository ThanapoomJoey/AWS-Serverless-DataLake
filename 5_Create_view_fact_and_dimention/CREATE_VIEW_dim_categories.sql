CREATE VIEW supermarket_serving_zone.vw_dim_products AS
SELECT
    p.product_id,
    p.product_name,
    c.category_name,
    p.unit_cost,
    p.unit_price,
    p.stock_quantity,
    p.last_restock_date
FROM supermarket_raw_zone.supermarket_products p
LEFT JOIN supermarket_raw_zone.supermarket_categories c 
    on p.category_id = c.category_id