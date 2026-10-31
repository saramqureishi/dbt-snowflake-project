{{ config(materialized='table') }}

select
    customer_id,
    initcap(first_name) || ' ' || initcap(last_name)  as full_name,
    lower(email)                                       as email,
    cast(signup_date as date)                          as signup_date,
    initcap(country)                                   as country
from {{ source('bronze', 'raw_customers') }}
