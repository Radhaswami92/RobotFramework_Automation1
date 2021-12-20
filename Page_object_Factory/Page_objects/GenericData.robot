*** Settings ***
Library    SeleniumLibrary
Library    Collections


*** Variables ***


*** Keywords ***
User navigates to the homepage in the browser
    [Arguments]    ${browser_name}      ${url}
    create webdriver    ${browser_name}     executable_path=Page_object_Factory/Page_objects/${browser_name}_driver
    go to   ${url}
CLose Browwer Session
    close browser
user validates the title of the page
    [Arguments]    ${expected_title}
    title should be    ${expected_title}
scroll page
    execute javascript    window.scrollTo(0,200)

Wait Until user's expected element is visible in the page to further proceed
    [Arguments]    ${locator}
    wait until element is visible       ${locator}

