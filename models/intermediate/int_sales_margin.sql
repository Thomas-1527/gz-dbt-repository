SELECT 
    products_id, 
    orders_id,
    date_date, 
    revenue, 
    quantity, 
    CAST(purchase_price AS FLOAT64) AS purchase_price, 
    ROUND(s.quantity*CAST(p.purchase_price AS FLOAT64),2) AS purchase_cost,
    ROUND(s.revenue - ROUND(s.quantity*CAST(p.purchase_price AS FLOAT64),2),2) AS margin
FROM {{ref("stg_raw__sales")}} s
LEFT JOIN {{ref("stg_raw__product")}} p 
    USING (products_id)