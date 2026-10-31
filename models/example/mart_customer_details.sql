{{ config(materialized='table') }}

select
    c.customer_id,
    c.full_name,
    c.email,
    c.signup_date,
    c.country,
    l.region,
    {{ signup_era('c.signup_date') }}  as signup_era
from {{ ref('stg_customers') }}        as c
left join {{ ref('country_lookup') }}  as l
    on initcap(l.country_name) = c.country
