with source_data as (
    select *
    from {{ source('adventure_works', 'sales_salesorderdetail') }}
)

, renamed as (
    select
        cast(salesorderid as int) as id_venda
        , cast(salesorderdetailid as int) as id_venda_item
        , cast(productid as int) as id_produto
        , cast(orderqty as int) as quantidade
        , cast(unitprice as numeric(18,2)) as preco_unitario
        , cast(unitpricediscount as numeric(18,2)) as desconto_unitario
    from source_data
)

select * from renamed