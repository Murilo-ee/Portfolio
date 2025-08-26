# Exercícios de SQL — Prática (MySQL)

Coleção de **exercícios soltos** para treinar comandos e funções do **MySQL**.  
**Não é um projeto único/coeso**: cada arquivo é um exemplo **independente**. Alguns usam um cenário simples (funcionários/salários/departamentos).

## Tópicos cobertos (por arquivo)
- `CreateDB.sql` — criação do banco e tabelas de exemplo + inserts iniciais.
- `Joins.sql` — `INNER/LEFT/RIGHT JOIN`, *self-join* e combinações entre tabelas.
- `CTE.sql` — *Common Table Expressions* (`WITH`) para organizar consultas.
- `Case.sql` — `CASE WHEN` para recodificação e categorização.
- `Groupby Order by.sql` — agregações com `GROUP BY` e ordenação com `ORDER BY`.
- `Having Where.sql` — filtros com `WHERE` e pós-agregação com `HAVING`.
- `Limit Offset.sql` — paginação e limitação de resultados (`LIMIT/OFFSET`).
- `Partition Functions.sql` — **funções de janela** (ex.: `ROW_NUMBER`, `RANK`, `SUM(...) OVER (PARTITION BY ...)`).
- `SubQueries.sql` — subconsultas simples e correlatas (`IN`, `EXISTS`).

> Observação: os arquivos podem ser executados **isoladamente**; quando um exemplo requer tabelas, o script `CreateDB.sql` fornece um esquema mínimo para testes.
