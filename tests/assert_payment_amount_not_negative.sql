SELECT
    ORDER_ID,
    STATUS,
    TOTAL_PAYMENT_AMOUNT
FROM {{ ref('int_order_payments') }}
WHERE STATUS = 'completed'
  AND TOTAL_PAYMENT_AMOUNT <= 0