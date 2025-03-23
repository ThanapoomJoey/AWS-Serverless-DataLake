CREATE VIEW supermarket_serving_zone.vw_dim_branches AS
SELECT
    b.branch_id,
    b.branch_name,
    b.open_date,
    b.manager_name,
    l.city,
    l.region
FROM supermarket_raw_zone.supermarket_branches b
LEFT JOIN supermarket_raw_zone.supermarket_locations l
    ON b.location_id = l.location_id