{{ config(materialized='view') }}


SELECT
    ORDER_ID,
    CUSTOMER_ID,
    CAST(ORDER_DATE AS DATE) AS ORDER_DATE,
    LOWER(TRIM(STATUS)) AS STATUS
FROM {{ source('jaffle_shop', 'orders') }}
WHERE ORDER_ID IS NOT NULL