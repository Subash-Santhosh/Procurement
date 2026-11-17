select * from {{ref("stg_orders")}}
where status = '{{ var('order_status') }}'