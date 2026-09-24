# Data Lake com Dados da B3

- Projeto desenvolvido com base no curso do [Henrique Branco](https://www.linkedin.com/in/henriqueajnb/).

## Arquitetura
- Data Lake com camadas *Raw* e *Trusted*, desenvolvido usando dados da B3.
- *Pipeline* com processamento com *Lambda*.
  - *Trigger* automático.
- Dados particionados em formato *Parquet*.
- Tabelas no *Athena* para consultas SQL.
- Automação RPA para baixar dados históricos da B3.

![Arquitetura](/assets/images/arquitetura.png)

## Resultados
- Infraestrutura escalável e de baixo custo.
- Dados organizados e fáceis de serem consultados a qualquer momento.
- Base para *dashboards* e análises.