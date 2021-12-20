*** Settings ***

Library    SeleniumLibrary
Resource    Resources.robot
Library    Collections
Test Setup          Open Browser with Home Page url
Test Teardown       CLose Browwer Session


*** Variables ***


*** Test Cases ***

Validate Header Menus
    set browser implicit wait    10
    maximize browser window
    Navigate to Homepage
    Get all the Parent menus and and verify the list



*** Keywords ***

Navigate to Homepage
    click element       css:*[alt='BlueSky-Logo']

Get all the Parent menus and and verify the list

    @{ExpectedElementList} =     Create List     Personal        Business        About Us
    @{Actual_ELement_List}      get webelements         //ul[@id='menu-top-header-menu']/li/a
    @{CreateNewActualList} =     Create List

    FOR     ${element}      IN      @{Actual_ELement_List}
            ${ElementText}    get text    ${element}
            log to console    ${ElementText}
            append to list    ${CreateNewActualList}      ${ElementText}
    END

    log to console    ${CreateNewActualList}

    lists should be equal    ${ExpectedElementList}     ${CreateNewActualList}\





