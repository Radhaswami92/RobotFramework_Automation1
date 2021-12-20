*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}  https://www.bluesky.as/
${browser}  chrome
#${BusinessMenu}     xpath://ul[@id='menu-top-header-menu']/li[2]/a
${HeaderMenus}      xpath://ul[@id='menu-top-header-menu']/li/a
${BusinessMenu}     Business



*** Test Cases ***
Validate the Header menu
    open browser   ${url}   ${browser}
    maximize browser window
    @{ListWebElements}  get webelements    xpath://ul[@id='menu-top-header-menu']/li/a
    FOR     ${element}    IN    @{ListWebElements}
            ${Text}=   Get Text    ${element}
            #Run Keyword If    '${Text}' == '${BusinessMenu}'    exit for loop
            Run Keyword If    '${Text}' == '${BusinessMenu}'    log to console      Business Menu is successfully validated
                               #log to console      Business Menu is successfully validated
    ...                        ELSE       log to console    Business Menu is not present
    END
    close browser

*** Keywords ***


