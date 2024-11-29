# Testes Automatizados - Sistema de Agendamento de Consultas

Este diretório contém os testes automatizados para a funcionalidade de agendamento e cancelamento de consultas de um sistema fictício de clínicas e profissionais de saúde.

## Pré-requisitos:

Antes de rodar os testes, você precisa ter o Python instalado. Também são necessárias algumas bibliotecas adicionais.

1. Instalar o Python 3.x: [Link para download do Python](https://www.python.org/downloads/)

2. Instalar as dependências do projeto:
    Robot Framework
    SeleniumLibrary
    RequestsLibrary
    ChromeDriver (se não estiver instalado, pode ser necessário instalá-lo para rodar o Selenium com o Chrome)

## Orientações para uso da API de teste.

3. As orientações para API de teste encontram-se [neste documento](./api/README.md)

## Execute os testes:
```bash
   robot 2.automation-tests/agendamento_consulta.robot
```

```bash
   robot 2.automation-tests/test_api
```