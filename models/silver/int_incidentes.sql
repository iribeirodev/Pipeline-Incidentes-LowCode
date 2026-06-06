{{ config(materialized='table') }}

SELECT
    TRIM(CAST("Number" AS VARCHAR))                                         AS incidente_id,
    UPPER(TRIM(CAST("State" AS VARCHAR)))                                   AS status,
    UPPER(TRIM(CAST("Priority" AS VARCHAR)))                                AS prioridade,
    COALESCE(TRIM(CAST("Assignment group" AS VARCHAR)), 'NAO ATRIBUIDO')    AS grupo_atribuido,
    COALESCE(TRIM(CAST("Assigned to" AS VARCHAR)), 'SEM ATRIBUICAO')        AS analista_atribuido,
    TRIM(CAST("Short description" AS VARCHAR))                              AS descricao_curta,
    CAST("Created" AS TIMESTAMP)                                            AS data_criacao,
    CAST("Updated" AS TIMESTAMP)                                            AS data_atualizacao,
    CAST("Resolved" AS TIMESTAMP)                                           AS data_resolucao,
    CASE
        WHEN "Resolved" IS NOT NULL THEN
            DATE_DIFF('day', CAST("Created" AS TIMESTAMP), CAST("Resolved" AS TIMESTAMP))
        ELSE
            NULL
    END                                                                     AS tempo_resolucao_dias
FROM {{ source('bronze_layer', 'raw_incidentes') }}