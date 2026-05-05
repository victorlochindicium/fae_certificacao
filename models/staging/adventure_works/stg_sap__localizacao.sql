with source_address as (
    select * from {{ source('adventure_works', 'person_address') }}
)
, source_state as (
    select * from {{ source('adventure_works', 'person_stateprovince') }}
)
, source_country as (
    select * from {{ source('adventure_works', 'person_countryregion') }}
)

, renamed as (
    select
        cast(a.addressid as int) as id_endereco
        , cast(a.city as string) as nome_cidade
        , cast(s.name as string) as nome_estado
        , cast(c.name as string) as nome_pais
    from source_address a
    left join source_state s on a.stateprovinceid = s.stateprovinceid
    left join source_country c on s.countryregioncode = c.countryregioncode
)

select * from renamed