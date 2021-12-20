*** Settings ***
Documentation    How to book a  flight
Library    SeleniumLibrary
Resource    Flight_data.robot
Test Setup    Navigate to the Flight Booking Homepage
Test Teardown   close browser

*** Variables ***

*** Test Cases ***

TC 1: Search Flight Information with Invalid Data

    Select Round Trip
    Select From Destination
    Select To Destination
    Select Departure Month
    Select Departure Date   15
    Select number of passenger-ADULT    2
    Select number of passenger-child    3
    Hit search button


*** Keywords ***


