with source_data as (
    select *
    from {{ source('adventure_works', 'sales_creditcard') }}
)

, renamed as (
    select
        cast(creditcardid as int) as id_cartao
        , cast(cardtype as string) as tipo_cartao
    from source_data
)

select * from renamed