*** Settings ***
Library    RequestsLibrary
Library    Collections


*** Variables ***
${BaseUrl}      http://dummy.restapiexample.com/api
${Relative_url_create_user}     /v1/create


*** Test Cases ***

Successful Creation
    create session    mysession     ${BaseUrl}      verify=true
    ${body}=    create dictionary   name=jeet   salary=123  age=23
    ${header}=  create dictionary    Content-Type=application/json  Vary=Accept-Encoding    accept=application/json
    ${response}=    post request    mysession   ${Relative_url_create_user}     data=${body}    headers=${header}
    log to console    ${response.status_code}
    log to console    ${response.content}


*** Keywords ***
