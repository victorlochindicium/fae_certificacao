select
    id_endereco as id_local
    , nome_cidade as cidade
    , nome_estado as estado
    , nome_pais as pais
    , concat_ws(', ', nome_cidade, nome_estado, nome_pais) as endereco_completo
from {{ ref('stg_sap__localizacao') }}