# 🚴 Modernização de Analytics & Data Warehouse — Adventure Works

[![dbt](https://img.shields.io/badge/dbt-Cloud-orange?logo=dbt)](https://www.getdbt.com/)
[![Databricks](https://img.shields.io/badge/Databricks-Lakehouse-red?logo=databricks)](https://databricks.com/)
[![SQL](https://img.shields.io/badge/Language-SQL-blue?logo=postgresql)](https://www.postgresql.org/)

**Autor:** Filipe Duarte  
**Cargo:** Analytics Engineer  
**Projeto:** Desafio Final Indicium — Analytics Engineering  

---

## 📌 Visão Geral do Projeto

Este repositório contém a solução completa de Analytics Engineering para a **Adventure Works**. O projeto contempla a construção de um **Data Warehouse multidimensional (Star Schema)** utilizando **dbt Cloud** e **Databricks**, transformando dados brutos relacionais em inteligência de negócios acionável.

---

## 🏗️ Arquitetura e Modelagem Dimensional

A modelagem foi desenvolvida seguindo os princípios de Kimball (Star Schema), dividida em camadas claras de transformação:

* **Camada Staging (`stg_*`):** Limpeza, padronização de tipos de dados e renomeação de colunas da base transacional.
* **Camada Dimensão (`dim_*`):**
  * `dim_produtos`: Cadastro central de produtos e seus atributos.
  * `dim_clientes`: Unificação de clientes B2C (Pessoas Físicas) e B2B (Lojas Corporativas) com tratamento de fallback via `COALESCE`.
  * `dim_locais`: Mapeamento geográfico hierárquico (Cidade, Estado e País).
  * `dim_datas`: Inteligência temporal diária (Ano, Mês, Dia, Trimestre).
  * `dim_cartoes_credito`: Mapeamento de meios de pagamento.
  * `dim_motivos_venda`: Categorização das razões de compra (ex: *Promotion*).
* **Camada Fato (`fct_vendas`):**
  * Granularidade no nível do item de pedido (`id_pedido_item`).
  * Mapeamento de Foreign Keys conectantes e pré-cálculo de métricas financeiras (`valor_bruto`, `valor_desconto`, `valor_liquido`).

---

## 🔍 Qualidade de Dados & Regras de Negócio

* **Auditoria Contábil (CEO Audit):** Validação estrita do faturamento bruto do ano de 2011 fixado em exatamente **$12.646.112,16**.
* **Garantia de Qualidade (`dbt test`):** Implementação de **27 testes automatizados** de integridade referencial (`relationships`), unicidade (`unique`) e campos obrigatórios (`not_null`).
* **Tratamento de Integridade:** Mapeamento de FKs ausentes para chaves genéricas de segurança (`0`) e eliminação de valores nulos em relatórios visuais.

---

## 📊 Aderência às Perguntas de Negócio (A a F)

O modelo dimensional exposto no Databricks AI/BI responde com precisão às 6 questões exigidas:

1. **Item A:** Agrupamento multidimensional de pedidos, quantidades e valores por todas as dimensões.
2. **Item B:** Cálculo do Ticket Médio por Pedido (AOV) por produto e localização.
3. **Item C:** Ranking dinâmico dos **Top 10 Clientes** em valor total negociado.
4. **Item D:** Identificação das **Top 5 Cidades** com maior faturamento.
5. **Item E:** Análise de Série Temporal (Ano e Mês) de faturamento e volume de pedidos.
6. **Item F:** Identificação do produto líder em unidades vendidas sob o motivo *"Promotion"*.

---

## 🚀 Como Executar o Projeto dbt

```bash
# 1. Clonar este repositório
git clone [https://github.com/FilipeDuarte-Indicium/desafio-AE-adventureworks.git](https://github.com/FilipeDuarte-Indicium/desafio-AE-adventureworks.git)

# 2. Executar as transformações de modelos
dbt run

# 3. Executar os testes de qualidade de dados
dbt test
