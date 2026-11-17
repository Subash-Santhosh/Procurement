{{ config(materialized='view') }}


SELECT
    CUSTOMER_ID,
    {{ clean_string('FIRST_NAME') }} AS FIRST_NAME,
    TRIM(LAST_NAME) AS LAST_NAME,
    LOWER(TRIM(EMAIL)) AS EMAIL
FROM {{ source('jaffle_shop', 'customers') }}
WHERE CUSTOMER_ID IS NOT NULL

