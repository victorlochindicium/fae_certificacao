with source_data as (
    select *
    from {{ source('adventure_works', 'sales_salesorderheadersalesreason') }}
)

, renamed as (
    select
        cast(salesorderid as int) as id_venda
        , cast(salesreasonid as int) as id_motivo
    from source_data
)

select * from renamed