# CarbonCurb - Gestão Eficiente de Emissões de Carbono

## Introdução
A gestão eficiente das emissões de carbono tornou-se uma prioridade global para empresas, impulsionada pela necessidade de mitigar os impactos das mudanças climáticas. O CarbonCurb é uma aplicação desenvolvida em Python, utilizando o Jupyter Notebook como ambiente de desenvolvimento, e PostgreSQL como banco de dados. A principal função do CarbonCurb é calcular e monitorar as emissões de carbono geradas pelos deslocamentos diários dos funcionários de uma empresa, permitindo uma gestão mais consciente e sustentável.

## Funcionalidades
### Registro de Funcionários e Dados de Deslocamento:
A aplicação permite o registro e armazenamento dos dados de cada funcionário, incluindo informações relacionadas aos seus deslocamentos diários.

### Cálculo de Emissões de Carbono:
Utilizando fatores relacionados, consumo de combustível e emissões associadas, o CarbonCurb realiza o cálculo preciso das emissões de carbono geradas durante o deslocamento de cada funcionário.

### Estimativa de Redução de Emissões:
Além do cálculo das emissões atuais, a aplicação determina o potencial de redução das emissões de carbono, caso os funcionários optem por utilizar transporte público ou bicicleta em alguns dias da semana.

### Armazenamento Eficiente no PostgreSQL:
O CarbonCurb utiliza o PostgreSQL como banco de dados para garantir um armazenamento seguro e eficiente dos dados dos funcionários e das emissões de carbono.

## Requisitos e Dependências
- Python 3.x
- Jupyter Notebook
- PostgreSQL

## Instalação e Configuração
1. Clone o repositório para a sua máquina local.
    ```bash
    git clone https://github.com/wladsonramos/carbon-curb.git
    ```
2. Configure o banco de dados PostgreSQL com as credenciais apropriadas.
3. Execute o Jupyter Notebook e abra o arquivo CarbonCurb.ipynb para começar a utilizar a aplicação.
