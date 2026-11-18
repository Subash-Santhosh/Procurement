select * from {{ref("stg_jaffle_shop__orders")}}
where status = '{{ var('order_status') }}'