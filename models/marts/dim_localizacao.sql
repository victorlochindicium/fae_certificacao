select
    id_endereco as id_local
    , nome_cidade as cidade
    , nome_estado as estado
    , nome_pais as pais
from {{ ref('stg_sap__localizacao') }}