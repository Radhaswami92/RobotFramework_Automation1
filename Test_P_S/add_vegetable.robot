*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library     String
Library    ../Custom_Library/Add_Vegetables.py


*** Variables ***
${browser}  chrome
${url}      https://rahulshettyacademy.com/seleniumPractise/#/
@{Required_Veggies}     Beans   Carrot  Cucumber    Potato     Mushroom

*** Test Cases ***

Add Desired product in the cart
    User Navigates to the shopping cart website
    maximize browser window
    set browser implicit wait    10
    user selects the product    @{Required_Veggies}
    sleep    10
    add veggies
    close browser


*** Keywords ***

User Navigates to the shopping cart website
    open browser    ${url}      ${browser}
User selects the product
    [Arguments]     @{veggies_name}
    ${Web_elements_product_name}    get webelements    xpath://div[@class='products']/div/h4

    FOR    ${element}   IN  @{Web_elements_product_name}
        ${text}=    get text    ${element}
        ${split_string}=     split string   ${text}     -
        ${stripped}=    strip string   ${split_string[0]}
        ${index}=   get index from list     ${Web_elements_product_name}    ${element}
        ${element}  set variable    xpath:(//div[@class='product-action']/button)[${index}+1]
        FOR     ${sub-ele}  IN  @{Veggies_Name}
            IF  '${stripped}' == '${sub-ele}'
            click element    ${element}
            END
        END
    END





