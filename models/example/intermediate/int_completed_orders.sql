-- {{ config(materialized='table') }}

{% set status = 'completed' %}

select *

FROM {{ ref('stg_jaffle_shop__orders') }}

{% if status == 'completed'%}

where STATUS = 'completed'

{% else %}

where STATUS = 'returned'

{% endif %}