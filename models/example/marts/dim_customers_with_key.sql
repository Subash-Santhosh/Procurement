{{ config(materialized = 'table')}}

select {{dbt_utils.generate_surrogate_key(['CUSTOMER_ID']) }} as CUSTOMER_KEY,
    FIRST_NAME,
    LAST_NAME,
    EMAIL
    from {{ ref('stg_customers')}}