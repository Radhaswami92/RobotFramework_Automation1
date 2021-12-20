*** Settings ***

Documentation       The reusable compponents
Library    SeleniumLibrary



*** Variables ***

${Invalid_TestUsername}     jeet@gmail.com
${Invalid_TestPassword}     Password@1
${Valid_username}           jitaditya.unified+01@gmail.com
${Valid_Password}           Password@1



*** Keywords ***
Open Browser with Home Page url
    create webdriver    Chrome  executable_path=D:/pycharm_ffx_edge/chromedriver
    go to    https://staging.uiplonline.com/bluesky-cms/my-account/

CLose Browwer Session
    close browser