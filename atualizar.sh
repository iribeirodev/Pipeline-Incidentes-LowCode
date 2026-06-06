#!/bin/bash
# Navega até a pasta do projeto
cd "$(dirname "$0")"

source venv/bin/activate

echo "Iniciando execucao dbt (duckdb)..."

# O parâmetro --profiles-dir . força o dbt a usar a pasta atual!
dbt run --profiles-dir .

if [ $? -eq 0 ]; then
    echo "Pipeline executado com sucesso."
else
    echo "O pipeline dbt falhou !"
    exit 1
fi
