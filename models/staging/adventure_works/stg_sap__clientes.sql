with source_customer as (
    select *
    from {{ source('adventure_works', 'sales_customer') }}
)

, source_person as (
    select *
    from {{ source('adventure_works', 'person_person') }}
)

, renamed as (
    select
        cast(c.customerid as int) as id_cliente
        , cast(c.personid as int) as id_pessoa
        , concat_ws(' ', p.firstname, p.middlename, p.lastname) as nome_cliente
    from source_customer c
    left join source_person p on c.personid = p.businessentityid
)

select * from renamed