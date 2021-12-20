*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${base_url}     https://www.outsystems.com
${Relative_url}     /community

*** Test Cases ***

Validate Header
    create session    mysession    ${base_url}
    ${response}=    get request    mysession   ${Relative_url}
    ${Content_type_value}    get from dictionary    ${response.headers}    Content-Type
    log to console    ${Content_type_value}
    should be equal    ${Content_type_value}    text/html; charset=utf-8
    ${Content_value}    get from dictionary    ${response.headers}    Connection
    log to console    ${Content_value}
    should be equal    ${Content_value}     keep-alive

Validate Cookies
    create session    mysession    ${base_url}
    ${response}=    get request    mysession   ${Relative_url}
    log to console    ${response.cookies}
    ${Cookie_value}=    get from dictionary    ${response.cookies}      ASP.NET_SessionId
    log to console    ${Cookie_value}




*** Keywords ***
