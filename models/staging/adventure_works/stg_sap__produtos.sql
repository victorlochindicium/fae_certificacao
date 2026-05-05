with source_data as (
    select *
    from {{ source('adventure_works', 'production_product') }}
)

, renamed as (
    select
        cast(productid as int) as id_produto
        , cast(name as string) as nome_produto
    from source_data
)

select * from renamed