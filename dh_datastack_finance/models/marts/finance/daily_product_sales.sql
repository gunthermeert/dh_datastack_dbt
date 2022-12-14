with
cte_product_sales_per_day as
(
    select order_date, product, sum(quantity) as quantity, sum(price) as revenue
    from {{ ref('int_finance__product_sales') }}
    group by order_date, product
), cte_final as
(
    select /*date_day as */order_date, product, quantity, revenue, current_timestamp() as loaded_at
    /*from cte_dates cd
    left join cte_product_sales_per_day cpspd
    on cd.date_day = cpspd.order_date*/
    from cte_product_sales_per_day cpspd
) select * from cte_final