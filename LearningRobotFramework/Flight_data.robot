*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${browser}      chrome
${url}      https://www.phptravels.net/flights
${Destination_From}     xpath:(//input[@placeholder='Flying From'])[1]
${Element_ToDestination}    xpath:(//input[@placeholder='To Destination'])[1]
${DestinationLocation}      Banak
${ToDestination}         Goa
${DateElement}      id:departure
${Month Text}   February 2022
${NextButton}       xpath://div[2]/div[1]/table/thead/tr[1]/th[3]/i
${monthElement}     (//div[@class='datepicker dropdown-menu']/div[1][@class='datepicker-days']/table[1]/thead[1]/tr[1]/th[2])[1]
${accept_cookie_element}    xpath://*[contains(text(),'Got It')]
${round_trip_element}      xpath://label[@for='one-way']
${click_next_button}       xpath:(//*[contains(@class, 'icon mdi mdi-long-arrow-right')])[1]


*** Keywords ***

Navigate to the Flight Booking Homepage
    open browser    ${url}    ${browser}
    set browser implicit wait    10s
    maximize browser window
    Accept Cookies
    sleep    3
Select Round Trip
    click element     ${round_trip_element}
    scroll page

Select From Destination
    input text      ${Destination_From}     banga
    @{ListAutosearchelemenst}   get webelements    xpath://div/div/div[1]/strong
    FOR     ${element}  IN      @{ListAutosearchelemenst}
            ${Text}=    get text    ${element}
            scroll element into view    ${element}
            run keyword if    '${Text}' == '${DestinationLocation}'      click element    ${element}
            exit for loop if    '${Text}' == '${DestinationLocation}'
    END

Select To Destination
    input text      ${Element_ToDestination}  Go
    @{ListWebElements}      get webelements     xpath://div/div/div[1]/strong
    FOR     ${element}  IN      @{ListWebElements}
            ${GrabTxt}  get text    ${element}
            run keyword if    '${GrabTxt}' == '${ToDestination}'      click element    ${element}
            exit for loop if       '${GrabTxt}' == '${ToDestination}'
    END

Accept Cookies
    click button    ${accept_cookie_element}

scroll page
    execute javascript    window.scrollTo(0,200)

Select Departure Month
    click element       ${DateElement}
    sleep    3
    FOR     ${i}    IN RANGE    12
        ${MonthDisplayed}   get text    ${monthElement}
        log to console   ${MonthDisplayed}
        IF  "${MonthDisplayed}" != "${Month Text}"
        click element    ${click_next_button}
        END
        ${i}=   evaluate    ${i}+1
        exit for loop if    "${MonthDisplayed}" == "${Month Text}"
    END

Select Departure Date
    [Arguments]     ${Date_value}
    @{Date_elementList}     get webelements    xpath://div[1]/table/tbody/tr/td[@class='day ']
    FOR     ${element}  IN  @{Date_elementList}
        ${Date_text}    get text    ${element}
        IF  "${Date_text}" == "${Date_value}"
        click element    ${element}
        END
        exit for loop if    "${Date_text}" == "${Date_value}"

    END

Select number of passenger-ADULT
    [Arguments]     ${count}
    click element    xpath://*[@data-toggle='dropdown']
    #${i}    set variable    1
    FOR  ${i}   IN RANGE    1   ${count}
        click element    xpath://div[contains(@class,'dropdown')]/div[1]/div/div/div[2]
        ${i}    evaluate    ${i}+1
    END

Select number of passenger-child
    [Arguments]     ${count}
    #click element    xpath://*[@data-toggle='dropdown']
    FOR  ${i}   IN RANGE    ${count}
        click element    xpath://div[contains(@class,'dropdown')]/div[2]/div/div/div[2]
        ${i}    evaluate    ${i}+1
    END
Hit search button
    click button    id:flights-search


