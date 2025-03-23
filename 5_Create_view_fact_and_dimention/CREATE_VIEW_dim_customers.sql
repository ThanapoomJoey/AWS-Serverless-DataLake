CREATE VIEW supermarket_serving_zone.vw_dim_customers AS
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    c.email,
    c.phone,
    l.city,
    l.region
FROM supermarket_raw_zone.supermarket_customers c
LEFT JOIN supermarket_raw_zone.supermarket_locations l
    ON c.location_id = l.location_id