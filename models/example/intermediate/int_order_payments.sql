{{ config(materialized='table') }}

WITH orders AS (
    SELECT
        *
    FROM {{ ref('stg_jaffle_shop__orders') }}
),

payments AS (
    SELECT
        ORDER_ID,
        SUM(AMOUNT) AS TOTAL_PAYMENT_AMOUNT
    FROM {{ ref('stg_jaffle_shop__payments') }}
    GROUP BY ORDER_ID
)

SELECT
    o.ORDER_ID,
    o.CUSTOMER_ID,
    o.ORDER_DATE,
    o.STATUS,
    COALESCE(p.TOTAL_PAYMENT_AMOUNT, 0) AS TOTAL_PAYMENT_AMOUNT
FROM orders o
LEFT JOIN payments p
    ON o.ORDER_ID = p.ORDER_ID
