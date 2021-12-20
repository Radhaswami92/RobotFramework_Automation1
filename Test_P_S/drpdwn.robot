*** Settings ***
Library     SeleniumLibrary
Library     Collections


*** Variables ***
${browser}  chrome
${url}      https://rahulshettyacademy.com/AutomationPractice/


*** Test Cases ***
TC1: Select Dropdown
    open browser    ${url}      ${browser}
    maximize browser window
    set browser implicit wait   10
    #click element   dropdown-class-example
    select from list by label   id:dropdown-class-example   Option2
    ${element}  get selected list value    id:dropdown-class-example
    Log To Console  ${element}
    @{Webelements}  get webelements     xpath://div[4]/fieldset/label/input
    FOR     ${element_chk}  IN  @{Webelements}
        ${ele_chk_text}     get element attribute    ${element_chk}     value
        Run Keyword If      "${ele_chk_text.upper()}" == "${element.upper()}"       select checkbox     ${element_chk}
        Exit For Loop If    "${ele_chk_text.upper()}" == "${element.upper()}"
    END
    input text      name        ${element}
    click button    alertbtn

    Sleep   3
    alert should be present     Hello ${element}, share this practice page and share your knowledge
    close browser



*** Keywords ***



