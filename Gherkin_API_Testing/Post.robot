*** Settings ***

Library    RequestsLibrary
Library    Collections
Resource        API_main_resources.robot
Test Setup      User creates a session with Base Url


*** Variables ***

${Expected_Response_code}   201
${body}
${header}

*** Test Cases ***

Successful Registration
    Given User creates a session with Base Url
    And user creates body of the content
    And user defines header of the content
    When user post request with the relative url
    Then user validates the status code successfully



*** Keywords ***

user creates body of the content
    ${body}=    create dictionary    name=jeet  job=qa

user defines header of the content
    ${header}=  create dictionary    Content-Type=application/json
user post request with the relative url
    ${Actual_resposne}      post on session    mysession      ${Relative_url_create_user}     data=${body}        headers=${header}
    log to console    ${Actual_resposne.status_code}
user validates the status code successfully
    ${Actual_resposne}      post on session    mysession      ${Relative_url_create_user}     data=${body}        headers=${header}
    ${Actual_Status_code}   convert to string    ${Actual_resposne.status_code}
    should be equal     ${Actual_Status_code}    ${Expected_Response_code}
    ${Status_response_message}      convert to string    ${Actual_resposne.content}
    log to console    ${Status_response_message}
    #should contain    ${Status_response_message}        success
    #should contain    ${Status_response_message}        Successfully! Record has been added.


