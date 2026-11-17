{{ config(materialized='view', alias= 'stg_customers') }}


SELECT
    CUSTOMER_ID,
    TRIM(FIRST_NAME) AS FIRST_NAME,
    TRIM(LAST_NAME) AS LAST_NAME,
    LOWER(TRIM(EMAIL)) AS EMAIL
FROM {{ source('jaffle_shop', 'customers') }}
WHERE CUSTOMER_ID IS NOT NULL

