{{ config(materialized='view') }}

select
    country,
    count(*)        as customer_count
from {{ ref('stg_customers') }}
group by country
order by customer_count desc
