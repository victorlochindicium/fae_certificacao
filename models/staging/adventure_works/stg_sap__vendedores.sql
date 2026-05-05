with source_salesperson as (
    select *
    from {{ source('adventure_works', 'sales_salesperson') }}
)

, source_person as (
    select *
    from {{ source('adventure_works', 'person_person') }}
)

, renamed as (
    select
        cast(s.businessentityid as int) as id_vendedor
        , concat_ws(' ', p.firstname, p.middlename, p.lastname) as nome_vendedor
    from source_salesperson s
    left join source_person p on s.businessentityid = p.businessentityid
)

select * from renamed