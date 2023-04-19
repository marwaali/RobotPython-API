*** Settings ***
Library    RequestsLibrary
Library         JSONLibrary
Library         Collections
Library         String
Library         OperatingSystem



*** Variables ***
${baseUrl}		http://api.zippopotam.us


*** Test Cases ***
API Call
    ${response}=    GET  ${baseUrl}/us/90210
    Should Be Equal As Strings    US  ${response.json()}[country abbreviation]

API Call2
    ${response}=    GET  ${baseUrl}/us/90210
    log     ${response.json()}[places][0][state abbreviation]

API Call3
    ${response}=    GET  ${baseUrl}/us/90210
    ${value}=    Set variable      ${response.json()}[places]
    ${myValue}=  Get value from json    ${value}    $[?(@.state=='California')]
    ${state}=  Get value from json    ${myValue}    $..'state abbreviation'
    Log    ${state}

API Call4
    ${response}=    GET  ${baseUrl}/us/90210
    ${value}=    Set variable      ${response.json()}[places]
    ${myValue}=  Get value from json    ${value}    $[?(@.state=='California')].'state abbreviation'
    Log    ${myValue}



