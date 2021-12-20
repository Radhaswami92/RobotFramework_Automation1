*** Settings ***
Library    RequestsLibrary
Library    Collections


*** Variables ***
${BaseUrl}      https://reqres.in/
${Relative_URL-List_users}   api/users?page
${Expected_Response_code}   200
${Expected_Body}        george.bluth@reqres.in
${Expected_Header}      application/json; charset=utf-8




*** Test Cases ***

Get List of Users
    Given User creates a session with Base Url
    When send request along with the relative URL
    Then user sucessfully validates the responsecode
    And successfully validates the content
    And successfully Validates the header




*** Keywords ***

User creates a session with Base Url
    create session    mysession     ${BaseUrl}
send request along with the relative URL
    get request    mysession     ${Relative_URL-List_users} #relative url
user sucessfully validates the responsecode
    ${Actual_response}      get request    mysession     ${Relative_URL-List_users}
    log to console    ${Actual_response.status_code}
    ${Actual_status_code}       convert to string    ${Actual_response.status_code}
    should be equal      ${Actual_status_code}      ${Expected_Response_code}


successfully validates the content
    ${Actual_response}      get request    mysession     ${Relative_URL-List_users}
    ${Actual_body}       convert to string     ${Actual_response.content}
    should contain       ${Actual_body}        ${Expected_Body}

successfully Validates the header
    ${Actual_response}      get request    mysession     ${Relative_URL-List_users}
    ${content_type_value}       get from dictionary         ${Actual_response.headers}       Content-Type
    should be equal             ${content_type_value}       ${Expected_Header}







