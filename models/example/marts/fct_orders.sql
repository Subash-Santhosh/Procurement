{{ config(materialized='table') }}

SELECT
    ORDER_ID,
    CUSTOMER_ID,
    ORDER_DATE,
    STATUS,
    TOTAL_PAYMENT_AMOUNT

FROM {{ ref('int_order_payments') }}