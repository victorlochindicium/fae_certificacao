select
    id_cliente
    , nome_cliente
from {{ ref('stg_sap__clientes') }}
where id_pessoa is not null