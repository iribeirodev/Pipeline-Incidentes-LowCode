-- Extensão de leitura para a planilha
INSTALL spatial;
LOAD spatial;

-- Lê a planilha da pasta landing e grava em Parquet na staging
COPY (
    SELECT * FROM read_excel('dados/landing/fake_incidents.xlsx', sheets='Sheet1')
) TO 'dados/staging/incidentes.parquet' (FORMAT 'PARQUET');