*** Settings ***
Documentation    This is my first execution in robot framework
...
...              I want to learn Robot Framework using selenium

Library    SeleniumLibrary

Test Setup      Open Browser with Home Page url
Test Teardown       close browser
Resource            Resources.robot

*** Variables ***

${Expected_Error_Message}       Incorrect Email or Username. Lost your password?
${Expected_Login_SuccessMessage}         Login successful



*** Test Cases ***

Validate Unsuccessful login

    set browser implicit wait    10
    maximize browser window
    Fill The login form         ${Invalid_TestUsername}         ${Invalid_TestPassword}
    Wait Until it checks and throws error message
    Verify error message is correct

Validate Successful Login
    set browser implicit wait    10
    maximize browser window
    Fill The login form         ${Valid_username}       ${Valid_Password}
    Verify that user is looged in successfully and reaches the Dashboard Page




*** Keywords ***

Fill The login form
    [Arguments]         ${TestUsername}         ${TestPassword}
    input text        name:xoo-el-username      ${TestUsername}
    input password    name:xoo-el-password      ${TestPassword}
    click button      css:button.button.btn.xoo-el-action-btn.xoo-el-login-btn

Wait Until it checks and throws error message
    wait until element is visible       css:div.xoo-el-notice-error

Verify error message is correct
    #${error}        get text        css:div.xoo-el-notice-error
    #should be equal as strings      ${error}       Incorrect Email or Username. Lost your password?
    element text should be    css:div.xoo-el-notice-error       ${Expected_Error_Message}

Verify that login success message is displayed
    element text should be    css:div.xoo-el-notice-success          ${Expected_Login_SuccessMessage}


Verify that user is looged in successfully and reaches the Dashboard Page
    wait until element is visible           css:span.current









