*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${url}      https://google.com
${browser}      chrome


*** Test Cases ***

Login Test
    Given User hits the browser with correct URL



*** Keywords ***

User hits the browser with correct URL
    open browser    ${url}     ${browser}




