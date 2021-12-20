*** Settings ***
Library    SeleniumLibrary


*** Variables ***

${browser}      chrome
${url}      https://www.google.com/
${expected_value}   autonomy meaning



*** Test Cases ***
Auto_Suggestive Dropdown Test case
    open browser   ${url}   ${browser}
    set browser implicit wait    10
    maximize browser window
    input text    xpath://input[@name='q']      auto
    sleep    3
    @{List_webelements}     get webelements    xpath://ul/li/div/div[2]/div[1]/span

    FOR     ${element}  IN  @{List_webelements}
            ${Text}=    get text   ${element}
            scroll element into view    ${element}
            run keyword if    '${Text}' == '${expected_value}'    click element   ${element}
            exit for loop if    '${Text}' == '${expected_value}'
    END
    close browser



*** Keywords ***

