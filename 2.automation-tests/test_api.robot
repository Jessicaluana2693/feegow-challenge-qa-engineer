*** Settings ***
Library    RequestsLibrary

*** Variables ***
${URL}=    http://localhost:8080/api/appointments
${currentID}=    0

*** Test Cases ***
TestarConexao
    [Documentation]    Requisição para verificar se funciona
    ${resp}=    GET    ${URL}/3
    Status Should Be    200
    Should Be Equal As Numbers    3    ${resp.json()}[id]

AgendarNovaConsulta
    ${data}=    Create Dictionary    doctor_id=1     patient_id=1     appointment_date=2024-11-29 14:30:00    status=pending
    ${resp}=    POST    ${URL}    json=${data}
    Set Global Variable    ${currentID}    ${resp.json()}[id]
    Log To Console    ID: ${resp.json()}[id]

ConfirmarNovaConsulta
    ${data}=    Create Dictionary   status=confirmed
    ${resp}=    PUT    ${URL}/${currentID}    json=${data}
    Should Be Equal As Strings    confirmed    ${resp.json()}[status]
    Log To Console    ${resp.json()}
    
CancelarConsulta
    ${data}=    Create Dictionary    status=cancelled
    ${resp}=    PUT    ${URL}/${currentID}    json=${data}
    Log To Console    ${resp.json()}

ConfirmarCancelamento
    ${resp}=    GET     ${URL}/${currentID}
    Should Be Equal As Strings    cancelled    ${resp.json()}[status]
