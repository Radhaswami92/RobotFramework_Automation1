*** Settings ***
Documentation    How to perform operations on radio buttons
Library    SeleniumLibrary



*** Variables ***

${url}  https://www.phptravels.net/flights
${browser}  chrome
${Destination_From}     xpath:(//input[@placeholder='Flying From'])[1]
${Element_ToDestination}    xpath:(//input[@placeholder='To Destination'])[1]
${DestinationLocation}       Banak
${ToDestination}         Goa

*** Test Cases ***

Select Radio Button

    open browser    ${url}    ${browser}
    set browser implicit wait    10s
    maximize browser window
    Accept Cookies
    Select Round Trip
    Select From Destination
    Select To Destination



*** Keywords ***

Select Round Trip
    click element     xpath://label[@for='round-trip']

Select From Destination
    input text      ${Destination_From}     banga
    @{ListAutosearchelemenst}   get webelements    xpath://div/div/div[1]/strong
    FOR     ${element}  IN      @{ListAutosearchelemenst}
            ${Text}=    get text    ${element}
            run keyword if    '${Text}' == '${DestinationLocation}'      click element    ${element}
            exit for loop if    '${Text}' == '${DestinationLocation}'


    END

Select To Destination
    input text      ${Element_ToDestination}  Goa
    @{ListWebElements}      get webelements     xpath://div/div/div[1]/strong
    FOR     ${element}  IN      @{ListWebElements}
            ${GrabTxt}  get text    ${element}
            run keyword if    '${GrabTxt}' == '${ToDestination}'      click element    ${element}
            exit for loop if       '${GrabTxt}' == '${ToDestination}'
    END

Accept Cookies
    click button    xpath://*[contains(text(),'Got It')]

Select Date










