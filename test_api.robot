*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary

*** Variables ***
${base_url}    http://localhost:3000

*** Test Cases ***
PlusInputTest
    [Documentation]    Test the API with valid input
    Create Session    api_session    ${BASE_URL}
    ${response}    GET On Session    api_session    /plus/4/3
    Should Be Equal     ${response.status_code}    ${200}
    Should Be Equal As Numbers    ${response.text}    ${7}
    Delete All Sessions

PlusInputTest
    [Documentation]    Test the API with invalid input
    Create Session    api_session    ${BASE_URL}
    ${response}    GET On Session    api_session    /plus/3/-4 
    Should Be Equal     ${response.status_code}    ${200}
    Should Be Equal As Numbers    ${response.text}    ${-1}
    Delete All Sessions

PlusInputTest
    [Documentation]    Test the API with unexpected error
    Create Session    api_session    ${BASE_URL}
    ${response}    GET On Session    api_session    /plus/2.5/1.4
    Should Be Equal     ${response.status_code}    ${200}
    Should Be Equal As Numbers    ${response.text}    ${3.9}
    Delete All Sessions