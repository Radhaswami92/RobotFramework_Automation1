*** Settings ***
Documentation    This file contains the instant Test Data for Home Page
Library    SeleniumLibrary
Library    Collections


*** Variables ***
${expected_phone_no}      +1-234-56789
${expected_emailid}     info@travelagency.com
${Language_to_choose}    Spanish



*** Keywords ***
Open Browser session with the Required URL
    [Arguments]    ${URL}   ${BROWSER}
    open browser   ${URL}   ${BROWSER}
Wait Until the Page is loaded with the specific element
    [Arguments]    ${locator}
    wait until element is visible    ${locator}
