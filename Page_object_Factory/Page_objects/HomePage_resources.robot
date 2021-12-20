*** Settings ***
Documentation    Reusable Page objects or webelements of Home Page
Library    SeleniumLibrary
Resource    Data.robot
Library    String

*** Variables ***
${url}      https://www.phptravels.net/flights
${browser}      chrome
${Header_phone_Number}      xpath:(//ul[@class='list-items']/li/a)[1]
${header_email}             xpath:(//ul[@class='list-items']/li/a)[2]
${visibility_locator}   //img[@alt='no results']
${Destination_From}     xpath:(//input[@placeholder='Flying From'])[1]
${Element_ToDestination}    xpath:(//input[@placeholder='To Destination'])[1]
${DateElement}      id:departure
${Month Text}   February 2022
${NextButton}       xpath://div[2]/div[1]/table/thead/tr[1]/th[3]/i
${monthElement}     (//div[@class='datepicker dropdown-menu']/div[1][@class='datepicker-days']/table[1]/thead[1]/tr[1]/th[2])[1]
${accept_cookie_element}    xpath://*[contains(text(),'Got It')]
${round_trip_element}      xpath://label[@for='one-way']
${click_next_button}       xpath:(//*[contains(@class, 'icon mdi mdi-long-arrow-right')])[1]
${From_dropdown_locator}    xpath://div/div/div[1]/strong
${To_dropdown_locator}      xpath://div/div/div[1]/strong
${Date_List_of_chosen_month}    xpath://div[1]/table/tbody/tr/td[@class='day ']
${Locator_Passenger_info}       xpath://*[@data-toggle='dropdown']
${Locator_add_adult}    xpath://div[contains(@class,'dropdown')]/div[1]/div/div/div[2]
${Locator_add_child}    xpath://div[contains(@class,'dropdown')]/div[2]/div/div/div[2]
${Search_button}    id:flights-search
${Locator_already_selected_language}    xpath://*[@id='languages']
${Locators_Language_list}   xpath://*[@class='dropdown-menu show']/li/a
${Locator_language_dpdwn}   id:languages


*** Keywords ***
User Navigates to the Home Page
    Open Browser session with the Required URL     ${url}        ${browser}
    maximize browser window
    set browser implicit wait    10
User checks and validates the phone number
    ${Actual_Text}      get text        ${Header_phone_Number}
    ${Actual_Phone_no}     strip string    ${Actual_Text}
    should be equal    ${expected_phone_no}     ${expected_phone_no}
User Validates the HomePage title
    Title Should Be     Search Hotels - PHPTRAVELS

Validate that user is able to select the language of the landing page as
    [Arguments]     ${language}
    click element    ${Locator_language_dpdwn}
    @{webelements}  get webelements    ${Locators_Language_list}
    FOR     ${element}  IN      @{webelements}
        ${Language_text}    get text    ${element}
        IF  "${Language_text}" == "${language}"
        click element    ${element}
        END
        exit for loop if    "${Language_text}" == "${language}"
    END
    sleep    5
Wait until the page content changes into selected language
    wait until element contains    ${Locator_already_selected_language}     ${Language_to_choose.upper()}     timeout=10      error=${Language_to_choose} Language is not selected

Wait until the expected element is in visible state
    wait until the page is loaded with the specific element    ${visibility_locator}

Navigate to the Flight Booking Homepage
    open browser    ${url}    ${browser}
    set browser implicit wait    10s
    maximize browser window
    Accept Cookies
    sleep    3
Select Round Trip
    click element     ${round_trip_element}
    scroll page

Type keyword and choose the actual From-Destination
    [Arguments]     ${keyword}      ${actual_from_destination}
    input text      ${Destination_From}     ${keyword}
    @{ListAutosearchelemenst}   get webelements    ${From_dropdown_locator}
    FOR     ${element}  IN      @{ListAutosearchelemenst}
            ${Text}=    get text    ${element}
            scroll element into view    ${element}
            run keyword if    '${Text}' == '${actual_from_destination}'      click element    ${element}
            exit for loop if    '${Text}' == '${actual_from_destination}'
    END

Type keyword and choose the actual To-Destination
    [Arguments]     ${keyword}      ${actual_to_destination}
    input text      ${Element_ToDestination}    ${keyword}
    @{ListWebElements}      get webelements     ${To_dropdown_locator}
    FOR     ${element}  IN      @{ListWebElements}
            ${GrabTxt}  get text    ${element}
            run keyword if    '${GrabTxt}' == '${actual_to_destination}'      click element    ${element}
            exit for loop if       '${GrabTxt}' == '${actual_to_destination}'
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
    @{Date_elementList}     get webelements    ${Date_List_of_chosen_month}
    FOR     ${element}  IN  @{Date_elementList}
        ${Date_text}    get text    ${element}
        IF  "${Date_text}" == "${Date_value}"
        click element    ${element}
        END
        exit for loop if    "${Date_text}" == "${Date_value}"

    END

Select number of passenger-ADULT
    [Arguments]     ${count}
    click element    ${Locator_Passenger_info}
    #${i}    set variable    1
    FOR  ${i}   IN RANGE    1   ${count}
        click element    ${Locator_add_adult}
        ${i}    evaluate    ${i}+1
    END

Select number of passenger-child
    [Arguments]     ${count}
    #click element    xpath://*[@data-toggle='dropdown']
    FOR  ${i}   IN RANGE    ${count}
        click element    ${Locator_add_child}
        ${i}    evaluate    ${i}+1
    END
Hit search button
    click button    ${Search_button}

Validation of gif with status when no result found
    #Page Should Contain Image       src="https://www.phptravels.net/app/themes/default/assets/img/no_results.gif"      #message=The image is displayed


