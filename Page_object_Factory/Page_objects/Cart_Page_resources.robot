*** Settings ***
Documentation    All the page objects or webelemnts of the Cart Page
Library    SeleniumLibrary
Library    Collections
Library    String
Resource    GenericData.robot
Resource    product_resource.robot


*** Variables ***
${Locator_Continue_shopping}    css:.btn.btn-default
${Locator_checkout_button}      css:.btn.btn-success
${Locator_Remove_product}       css:.btn.btn-danger
${Locator_quantity}     css:.form-control
${Locator_price_values_cloumn}   xpath://tbody/tr/td[3]
${Locator_Product_titles}   xpath://tbody/tr/td[1]/div/div/h4/a
${Locator_Indi_product_prices}      xpath://tbody/tr/td[4]/strong
${Locator_Cart_total_value}     xpath://tbody/tr[4]/td[5]/h3
${Locator_label_country}    xpath://label[@for='country']
${Locator_country_field}    id:country
${Locator_checkbox_country}     xpath://label[@for='checkbox2']
${Locator_purchase_button}      css:.btn.btn-success.btn-lg


*** Keywords ***

Wait Until expected element is found in the cart page
    click element    ${Locator_checkout_to_cart}
    Wait Until user's expected element is visible in the page to further proceed    ${Locator_checkout_button}

User validates the price value of individual item is equal to the Total value
    @{Individual_itm_prcs}  get webelements    ${Locator_Indi_product_prices}
    ${Total_calculated}     set variable    0
    FOR     ${element}  IN  @{Individual_itm_prcs}
        ${O_Price_values}=    get text    ${element}
        ${Splitted_List}=   split string    ${O_Price_values}   .
        ${Actual_price}=    strip string    ${Splitted_List[1]}
        ${Total_calculated}=   evaluate    ${Total_calculated}+${Actual_price}
    END
    log to console    ${Total_calculated}
    ${Total_cart_value_text}     get text    ${Locator_Cart_total_value}
    ${Splitted_List_tot}=   split string    ${Total_cart_value_text}   .
    ${Total_cart_value}=    strip string    ${Splitted_List_tot[1]}
    log to console    ${Total_cart_value}
    should be equal as integers    ${Total_calculated}     ${Total_cart_value}

User proceeds with the puchase with all the items present in the cart

    click element   ${Locator_checkout_button}
    Wait Until user's expected element is visible in the page to further proceed    ${Locator_label_country}

User chooses his country for purchase
    [Arguments]    ${autosuggest_keyword}
    input text    ${Locator_country_field}      ${autosuggest_keyword}
    Wait Until user's expected element is visible in the page to further proceed    xpath://*[contains(text(),'${autosuggest_keyword}')]
    click element    xpath://*[contains(text(),'${autosuggest_keyword}')]

User purchase the product successfully and validates the acknowledgement of the purchase
    click element    ${Locator_checkbox_country}
    click element    ${Locator_purchase_button}
    wait until page contains    Success!










