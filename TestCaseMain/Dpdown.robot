*** Settings ***
Library    SeleniumLibrary



*** Variables ***

${url}  https://the-internet.herokuapp.com/nested_frames
${browser}  chrome
${Heading}      xpath://div[1]/div[@id='content']/p[1]


*** Test Cases ***

Choose Value from the dropdown
    open browser    ${url}      ${browser}


*** Keywords ***

