with source as (
    select * from {{ source('dh_shop','orders') }}
),
orders as (
    select
    order_id,
    customer_id,
    order_date
    from source
)
select * from orders