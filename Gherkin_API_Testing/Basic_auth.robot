*** Settings ***
Documentation    Basic Authetiction Test
Library    RequestsLibrary
Library    Collections
Library    JSONLibrary


*** Variables ***
${base_url1}     https://reqres.in
${Relative_url1}     /api/login
${token}

${base_url2}     https://www.outsystems.com
${Relative_url2}     /community



*** Test Cases ***

Basic Authentication Test 1
    create session    mysession   ${base_url1}      verify=true
    ${body}        create dictionary       email=eve.holt@reqres.in       password=cityslicka
    ${header}      create dictionary       Content-Type=application/json        #accept=application/json
    ${response}    post request    mysession       /api/login        data=${body}       headers=${header}
    ${json_object}      to json    ${response.content}
    ${token_value}      get value from json    ${json_object}   $.token
    log to console    ${token_value[0]}
    set global variable    ${token}     Bearer ${token_value[0]}


*** Keywords ***

