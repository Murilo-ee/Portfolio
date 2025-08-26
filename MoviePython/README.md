# Exploração de Dados de Filmes em Python

Este projeto explora um dataset de filmes (`movies.csv`) utilizando bibliotecas Python como pandas, NumPy, Seaborn e Matplotlib. O objetivo é investigar relações entre variáveis que podem influenciar o sucesso de um filme.

## Funcionalidades

- **Carregamento e tratamento do dataset**: o notebook `PythonCorrel.ipynb` lê o arquivo `movies.csv` e inspeciona colunas como título, ano, nota do IMDb, votos, orçamento, receita (gross) e duração.
- **Análises de correlação**:
  - Geração de matrizes de correlação para avaliar associações entre orçamento, receita bruta, nota e votos.
  - Uso de gráficos de dispersão e heatmaps para visualizar relacionamentos e identificar possíveis tendências.
- **Insights exploratórios**: o projeto examina se orçamentos elevados estão associados a maiores receitas e se há relação entre avaliações do IMDb e sucesso financeiro.

## TLimpeza e transformação de dados

- **Remoção de duplicidades** (`drop_duplicates`) para evitar contagem redundante de filmes.
- **Tratamento de valores faltantes** (`dropna` ou imputação) para garantir que operações numéricas não sejam afetadas por `NaN`.
- **Conversão de colunas** (por exemplo, orçamento e receita bruta) de string para `float`/`int`, possibilitando cálculos estatísticos.
- **Criação de uma matriz de correlação** com `pandas.corr()` para identificar relações entre variáveis numéricas.
