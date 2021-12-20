*** Settings ***
Documentation    To Learn the concept of Resource file

Library    SeleniumLibrary

Resource        Resources.robot     # It will import the implementation of reusable keywords from the mentioned resource file

Test Setup      Open Browser with Home Page url  # This keyword is taken from the resource file and also it will be executed before any test case
Test Teardown    close browser      # It will be executed after each and every test case


*** Variables ***



*** Test Cases ***

Validation of Hitting browser from Resource file
    set browser implicit wait   10

*** Keywords ***


