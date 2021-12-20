*** Settings ***
Library    RequestsLibrary
Library    Collections


*** Variables ***
${BaseUrl}      https://reqres.in
#${Relative_url_create_user}     api/v1/create


*** Test Cases ***

Successful Creation
    create session    mysession     ${BaseUrl}
    ${body}=    create dictionary    name=jeet  job=qa
    ${header}=  create dictionary    Content-Type=application/json
    ${response}=    post request    mysession   /api/users     data=${body}    headers=${header}
    log to console    ${response.status_code}
    log to console    ${response.content}




*** Keywords ***
