@echo off
echo [INFO] Iniciando atualizacao do pipeline de dados...

:: Avisa a nuvem que o pipeline começou
rem curl -fsS -m 10 --retry 5 https://cronitor.link/p/seu_token/seu_projeto?state=run

:: Se o duckdb.exe não estiver no PATH do Windows, baixe e jogue ele na raiz do projeto.
:: O comando abaixo abre o banco, roda os dois arquivos SQL em sequência e fecha sozinho.
duckdb.exe projeto_incidentes.db < sql/1_staging.sql
duckdb.exe projeto_incidentes.db < sql/2_intermediate.sql

echo [INFO] Pipeline atualizado com sucesso!

:: Avisa a nuvem que deu tudo certo e atualiza o painel visual
rem curl -fsS -m 10 --retry 5 https://cronitor.link/p/seu_token/seu_projeto?state=complete