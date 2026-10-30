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

A modelagem foi desenvolvida seguindo os princípios de Kimball (Star Schema), em três camadas: **staging → intermediate → marts**. A lógica de negócio fica na camada intermediate; os marts apenas expõem o modelo dimensional.

* **Camada Staging (`stg_*`, 14 modelos):** Limpeza, padronização de tipos de dados e renomeação de colunas da base transacional. Inclui `stg_productcategory` e `stg_productsubcategory`.
* **Camada Intermediate (`int_*`, 5 modelos):** Joins e regras de negócio.
  * `int_produtos_enriquecidos`: produto + subcategoria + categoria (fallback "Sem subcategoria" / "Sem categoria").
  * `int_clientes_unificados`: clientes B2C (Pessoas Físicas) e B2B (Lojas Corporativas) com fallback via `COALESCE`.
  * `int_locais_hierarquia`: endereço + estado + país (Cidade, Estado e País).
  * `int_motivos_venda_pedido`: motivos de venda agregados por pedido.
  * `int_vendas_itens`: cabeçalho + itens do pedido, com `valor_bruto`, `valor_desconto` e `valor_liquido`.
* **Camada Marts (7 modelos):**
  * `dim_produtos`: cadastro de produtos com **categoria e subcategoria**, permitindo segmentar a análise por produto.
  * `dim_clientes`: clientes B2C e B2B unificados.
  * `dim_locais`: mapeamento geográfico hierárquico (Cidade, Estado e País).
  * `dim_datas`: inteligência temporal diária (Ano, Mês, Dia, Trimestre).
  * `dim_cartoes_credito`: meios de pagamento, com o membro `0 / "Não informado"` para pedidos sem cartão.
  * `dim_motivos_venda`: razões de compra por pedido (ex: *Promotion*).
  * `fct_vendas`: granularidade no nível do item de pedido (`id_pedido_item`), com Foreign Keys, métricas financeiras e `nome_motivo_venda`.

---

## 🔍 Qualidade de Dados & Regras de Negócio

* **Auditoria Contábil (CEO Audit):** Validação estrita do faturamento bruto do ano de 2011 fixado em exatamente **$12.646.112,16**.
* **Garantia de Qualidade:** **103 testes automatizados** (unicidade, campos obrigatórios, valores aceitos, integridade referencial e 4 testes singulares na pasta `/tests`), cobrindo sources, staging, intermediate e marts. O `dbt build` executa 26 modelos + 103 testes (129 itens).
* **Tratamento de Integridade:** Mapeamento de FKs ausentes para chaves genéricas de segurança (`0`), com o membro correspondente na dimensão, e eliminação de valores nulos em relatórios visuais.

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
git clone https://github.com/FilipeDuarte-Indicium/desafio-AE-adventureworks.git

# 2. Executar modelos e testes na ordem do DAG
dbt build
```
