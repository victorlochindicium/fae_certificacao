with motivos as (
    select * from {{ ref('stg_sap__motivos') }}
)

, vendas_motivos as (
    select * from {{ ref('stg_sap__vendas_motivos') }}
)

, joined as (
    select
        vendas_motivos.id_venda
        , motivos.id_motivo
        , motivos.nome_motivo
    from vendas_motivos
    left join motivos on vendas_motivos.id_motivo = motivos.id_motivo
)

select * from joined