*** Settings ***
Documentation    Validation of Header Elements in HomePage
Library    SeleniumLibrary
Library    Collections
Resource        ../Page_objects/HomePage_resources.robot
Resource        ../Page_objects/Data.robot
Test Setup    User Navigates to the Home Page
Test Teardown    close browser

*** Variables ***
${DestinationLocation}      Banak
${ToDestination}         Goa


*** Test Cases ***
TC 1: Validate Phone number and email in the Header section
    [Tags]    REGRESSION
    User checks and validates the phone number
    User Validates the HomePage title
    element text should be      ${header_email}     ${expected_emailid}
    Validate that user is able to select the language of the landing page as       ${Language_to_choose}
    Wait until the page content changes into selected language

TC 2: Search Flight with Invalid From and To location to validate the unavilability of flights
    [Tags]    SMOKE     REGRESSION
    Select Round Trip
    Type keyword and choose the actual From-Destination     banga       ${DestinationLocation}
    Type keyword and choose the actual To-Destination       Go          ${ToDestination}
    Select Departure Month
    Select Departure Date   15
    Select number of passenger-ADULT    2
    Select number of passenger-child    3
    Hit search button
    Wait until the expected element is in visible state

*** Keywords ***




