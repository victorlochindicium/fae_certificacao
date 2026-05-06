with pedidos as (
    select * from {{ ref('stg_sap__vendas_pedidos') }}
)

, detalhes as (
    select * from {{ ref('stg_sap__vendas_detalhes') }}
)

, joined as (
    select
        detalhes.id_venda_item
        , pedidos.id_venda
        , pedidos.id_cliente
        , pedidos.id_vendedor
        , pedidos.id_cartao
        , pedidos.id_endereco_entrega as id_local
        , pedidos.id_status
        , detalhes.id_produto
        , cast(pedidos.data_venda as date) as data_venda
        , detalhes.quantidade
        , detalhes.preco_unitario
        , detalhes.desconto_unitario
        , cast(detalhes.quantidade * detalhes.preco_unitario as decimal(18,2)) as faturamento_bruto
        , cast(detalhes.quantidade * detalhes.preco_unitario * (1 - detalhes.desconto_unitario) as decimal(18,2)) as faturamento_liquido
    from detalhes
    left join pedidos on detalhes.id_venda = pedidos.id_venda
)

select * from joined