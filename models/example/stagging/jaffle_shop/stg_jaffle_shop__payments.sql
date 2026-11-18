{{ config(materialized='view') }}

SELECT
    PAYMENT_ID,
    ORDER_ID,
    LOWER(TRIM(PAYMENT_METHOD)) AS PAYMENT_METHOD,
    CAST(AMOUNT AS DECIMAL(10,2)) AS AMOUNT

FROM {{ source('jaffle_shop', 'payments') }}

WHERE PAYMENT_ID IS NOT NULL