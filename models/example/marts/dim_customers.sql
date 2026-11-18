{{ config(materialized='table') }}

WITH customer_orders AS (

    SELECT
        CUSTOMER_ID,
        COUNT(DISTINCT ORDER_ID) AS TOTAL_ORDERS,
        SUM(TOTAL_PAYMENT_AMOUNT) AS TOTAL_PAYMENT_AMOUNT

    FROM {{ ref('int_order_payments') }}

    GROUP BY CUSTOMER_ID

)

SELECT
    c.CUSTOMER_ID,
    c.FIRST_NAME,
    c.LAST_NAME,
    c.EMAIL,

    COALESCE(o.TOTAL_ORDERS, 0) AS TOTAL_ORDERS,

    COALESCE(o.TOTAL_PAYMENT_AMOUNT, 0)
        AS TOTAL_PAYMENT_AMOUNT

FROM {{ ref('stg_jaffle_shop__customers') }} c

LEFT JOIN customer_orders o
    ON c.CUSTOMER_ID = o.CUSTOMER_ID