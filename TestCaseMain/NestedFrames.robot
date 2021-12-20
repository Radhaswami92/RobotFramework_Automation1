*** Settings ***

Library    SeleniumLibrary



*** Variables ***

${url}  https://the-internet.herokuapp.com/nested_frames
${browser}  chrome
${Heading}      xpath://div[1]/div[@id='content']/p[1]



*** Test Cases ***

Switch Between Nested Frames

    open browser    ${url}     ${browser}
    maximize browser window

    Select bottom Frame and print the text
    unselect frame

    Select Top Frame and Print Middle
    unselect frame

    Select Top Frame and Print Left
    unselect frame

    Select Top Frame and Print right
    close browser

*** Keywords ***

Select Top Frame and Print Middle
    select frame    frame-top
    select frame    frame-middle
    ${Text}     get text    xpath://body/div
    log to console   ${Text}

Select Top Frame and Print Left
    select frame    frame-top
    select frame    frame-left
    ${Text}     get text    xpath://html/body
    log to console   ${Text}

Select Top Frame and Print right
    select frame    frame-top
    select frame    frame-right
    ${Text}     get text    xpath://html/body
    log to console   ${Text}

Select bottom Frame and print the text
    select frame    frame-bottom
    ${Text}     get text    xpath://html/body
    log to console   ${Text}


