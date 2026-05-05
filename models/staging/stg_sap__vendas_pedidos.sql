with source_data as (
    select *
    from {{ source('adventure_works', 'sales_salesorderheader') }}
)

, renamed as (
    select
        cast(salesorderid as int) as id_venda
        , cast(customerid as int) as id_cliente
        , cast(creditcardid as int) as id_cartao
        , cast(shiptoaddressid as int) as id_endereco_entrega
        , cast(orderdate as timestamp) as data_venda
        , cast(status as int) as id_status
    from source_data
)

select * from renamed