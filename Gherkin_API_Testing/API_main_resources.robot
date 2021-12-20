*** Settings ***
Documentation    The reusable API components
Library    RequestsLibrary


*** Variables ***
${BaseUrl}      https://reqres.in
${Relative_url_create_user}     /api/users
${newusername}      kevin williams
${newemail}     kevin@mailinator.com
${newpassword}      Password@1

*** Keywords ***

User creates a session with Base Url
    create session    mysession     ${BaseUrl}      verify=true

