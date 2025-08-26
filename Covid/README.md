# Projeto COVID SQL

Este projeto usa consultas SQL para explorar dados de casos, mortes e vacinações da COVID‑19. Os scripts carregam os datasets em tabelas relacionais e geram consultas que calculam taxas de infecção, mortalidade e vacinação por país.

## Funcionalidades

- **Criação de esquemas**: a partir de `covid_deaths` e `covid_vaccinations` são criadas tabelas com colunas para datas, total de casos, novos casos, óbitos, população, doses de vacina, etc.:contentReference[oaicite:0]{index=0}.
- **Consultas analíticas**: os scripts utilizam agregações (`SUM`, `MAX`) e funções de janela (`OVER(PARTITION BY ...)`) para obter:
  - taxas de infecção (total de casos/população) por data e país:contentReference[oaicite:1]{index=1};
  - taxas de mortalidade (total de óbitos / total de casos) e países com maior número de mortes;
  - acompanhamento do progresso de vacinação através de somatórios acumulados de pessoas vacinadas:contentReference[oaicite:2]{index=2};
  - filtros para remover entradas que representam continentes ou agregados como “World”:contentReference[oaicite:3]{index=3}.
- **Preparação para visualização**: consultas específicas (`QueryTableau.sql`) formatam os resultados para serem importados em ferramentas como Tableau, incluindo colunas adicionais de total de casos e vacinação por continente:contentReference[oaicite:4]{index=4}.

