*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    OperatingSystem
Library    JSONLibrary
Resource    API_main_resources.robot



*** Variables ***

${Base_url_reg}     http://restapi.adequateshop.com
${Relative_Url_reg}     /api/authaccount/registration
${Bearer_token}
${Relative_Url_userlist}        /api/users?page=1



*** Test Cases ***

Test Case:1 User Registration
    #[Arguments]     ${newusername}      ${newemail}     ${newpassword}
    create session    mysession     ${Base_url_reg}
    ${body}=    create dictionary    name=${newusername}     email=${newemail}      password=${newpassword}
    ${header}=  create dictionary    Content-Type=application/json
    ${response}=    post request    mysession   ${Relative_Url_reg}     data=${body}    headers=${header}
    log to console    ${response.status_code}
    log to console    ${response.content}
    #${json_object}=     to json    ${response.content}
    #${Token_value}     get value from json    ${json_object}       $.data.Token
    #log to console    ${Token_value[0]}
    #set global variable    ${Bearer_token}      Bearer ${Token_value[0]}
    #log to console    ${Bearer_token}

Test Case 2: Login with valid user name and password and get the token
    #[Arguments]     ${newemail}     ${newpassword}
    create session    mysession     ${base_url_reg}
    ${body}=    create dictionary    email=${newemail}    password=${newpassword}
    ${header}=  create dictionary    Content-Type=application/json
    ${response}=    post request    mysession       /api/authaccount/login      data=${body}        headers=${header}
    ${json_object}      to json    ${response.content}
    ${token_value}=     get value from json    ${json_object}       $.data.Token
    set global variable    ${Bearer_token}      Bearer ${token_value[0]}


Test Case: 2 Bearer Token Authentication API
    create session    mysession     ${Base_url_reg}
    ${header}=      create dictionary    Authorization=${Bearer_token}
    ${response}     get request    mysession    ${Relative_Url_userlist}    headers=${header}
    log to console   ${response.status_code}
    log to console   ${response.content}





*** Keywords ***


