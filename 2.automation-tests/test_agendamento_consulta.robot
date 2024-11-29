*** Settings ***
Library    SeleniumLibrary

Suite Setup    Open Browser    https://clinicaluz.com/agendamento    Chrome
Suite Teardown    Close Browser

*** Variables ***
${URL}    https://clinicaluz.com/agendamento
${AGENDAR_BUTTON}    //button[text()='Agendar']
${CANCELAR_BUTTON}    //button[text()='Cancelar']
${HORARIO_LIST}    //select[@id='horarios']    # Localização da lista suspensa
${HORARIO_DISPONIVEL}    //option[text()='14:30']    # Exemplo de horário disponível
${CONSULTA_CONFIRMADA}    //div[@id='consulta-lista']    # Localização do painel que mostra consultas agendadas

*** Test Cases ***
Agendar Consulta Com Sucesso
    [Documentation]    Testa o agendamento de uma consulta em um horário disponível.
    [Tags]    agendamento
    Selecionar Horário Disponível
    Clicar Em Agendar
    Verificar Consulta Agendada

Cancelar Consulta Agendada
    [Documentation]    Testa o cancelamento de uma consulta agendada.
    [Tags]    cancelamento
    Clicar Em Cancelar
    Verificar Consulta Cancelada

*** Keywords ***
Selecionar Horário Disponível
    [Documentation]    Seleciona um horário disponível da lista suspensa.
    Select From List By Label    ${HORARIO_LIST}    14:30

Clicar Em Agendar
    [Documentation]    Clica no botão de agendar para confirmar a consulta.
    Click Element    ${AGENDAR_BUTTON}

Verificar Consulta Agendada
    [Documentation]    Verifica se a consulta foi agendada corretamente.
    Element Should Contain    ${CONSULTA_CONFIRMADA}    14:30

Clicar Em Cancelar
    [Documentation]    Clica no botão de cancelar para remover a consulta agendada.
    Click Element    ${CANCELAR_BUTTON}

Verificar Consulta Cancelada
    [Documentation]    Verifica se a consulta foi cancelada e não aparece mais na lista.
    Element Should Not Contain    ${CONSULTA_CONFIRMADA}    14:30
