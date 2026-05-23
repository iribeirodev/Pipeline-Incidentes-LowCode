CREATE OR REPLACE TABLE int_incidentes AS
SELECT * FROM read_parquet('dados/staging/incidentes.parquet');