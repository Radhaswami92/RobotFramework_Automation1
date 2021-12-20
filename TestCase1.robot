*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${browser}  chrome
${url}  https://www.bluesky.as/my-account/
${EmailElement}     xpath:(//input[@name='xoo-el-username'])[1]
${PasswordElement}  xpath:(//input[@name='xoo-el-password'])[1]
${LoginButton}  xpath:(//button[@class='button btn xoo-el-action-btn xoo-el-login-btn'])[1]
${ExpectedLoginFailureText}   Incorrect Email or Username. Lost your password?
${response}

*** Test Cases ***

LoginTest
    open browser    ${url}  ${browser}
    maximize browser window
    element should be visible    ${EmailElement}
    element should be visible    ${PasswordElement}
    element should be enabled    ${EmailElement}
    Provide Email and Password
    sleep    5
    Submit Credentials
    sleep   4
    #clear element text    ${EmailElement}
    #sleep    3
    #input text    ${EmailElement}   harrypodar@gmail.com
    ${response}   get text    css:div.xoo-el-notice-error
    should be equal as strings    ${response}   ${ExpectedLoginFailureText}
    log   ${response}


*** Keywords ***

Provide Email and Password
    input text    ${EmailElement}    jeet.zaper@gmail.com
    input text    ${PasswordElement}   password@1
Submit Credentials
    click element  ${LoginButton}


