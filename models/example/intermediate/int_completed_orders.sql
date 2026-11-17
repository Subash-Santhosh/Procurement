-- {{ config(materialized='table') }}

{% set status = 'completed' %}

select *

FROM {{ ref('stg_orders') }}

{% if status == 'completed'%}

where STATUS = 'completed'

{% else %}

where STATUS = 'returned'

{% endif %}