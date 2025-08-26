# Limpeza de Dados Imobiliários de Nashville (SQL)

Rotina de **data cleaning** e normalização de um dataset imobiliário via SQL.

---
- **Padroniza datas** (conversão para `DATE`).
- **Preenche endereços faltantes** de `PropertyAddress` por **auto-join** em `ParcelID` (propaga de registros completos).
- **Divide campos compostos**:
  - `PropertyAddress` → rua, cidade (funções de string).
  - `OwnerAddress` → rua, cidade, estado (`PARSENAME`/parsing).
- **Normaliza categóricos**: `SoldAsVacant` de `Y/N` → `Yes/No` (cláusula `CASE`).
- **Remove duplicidades** com `ROW_NUMBER() OVER (PARTITION BY ...)` e exclusão de linhas com índice > 1.
- **Enxuga esquema**: **drop** de colunas redundantes (ex.: `TaxDistrict`, campos originais de endereço) após a normalização.
- Garante **consistência tipada** e um conjunto pronto para análises/BI.
