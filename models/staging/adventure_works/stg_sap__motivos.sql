with source_data as (
    select *
    from {{ source('adventure_works', 'sales_salesreason') }}
)

, renamed as (
    select
        cast(salesreasonid as int) as id_motivo
        , cast(name as string) as nome_motivo
    from source_data
)

select * from renamed