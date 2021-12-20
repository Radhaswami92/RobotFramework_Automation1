*** Settings ***
Documentation    Useful resource or webelements of product page
Library     SeleniumLibrary
Library     Collections
Library    String
Resource    GenericData.robot

*** Variables ***
${url}  https://rahulshettyacademy.com/angularpractice/shop
${browser}  chrome
${Locator_All_product_title}    css:.card-title a
${Locator_Add_button}       xpath:(//div[@class='card h-100']/div[2]/button)
${Locator_price}    css:h5
${Locator_checkout_to_cart}      css:.nav-link.btn.btn-primary
${browser_name}     Chrome


*** Keywords ***
User navigates to initiate the browser session
    #[Arguments]    ${browser_name}
    User navigates to the homepage in the browser   ${browser_name}    ${url}
    maximize browser window
    set browser implicit wait    10

User validates the list of all the products in the product list page as per the expectation
    [Arguments]     @{expectes_poduct_list_displayed}
    @{All_Products_elements}    get webelements    ${Locator_All_product_title}
    FOR     ${element}  IN  @{All_Products_elements}
        ${Product_name}     get text    ${element}
        list should contain value    ${expectes_poduct_list_displayed}    ${Product_name}
    END
User validates the price is displayed for all the products
    @{All_Products_prices}    get webelements    ${Locator_price}
    FOR     ${element}     IN      @{All_Products_prices}
        element should be visible    ${element}
        ${Price_value}  get text    ${element}
        log to console    ${Price_value}
        element should contain      ${element}      $
    END


User adds the required product in the cart
    [Arguments]     @{ProductList}
    ${All_Products_elements}    get webelements    ${Locator_All_product_title}

    FOR     ${Product_element}  IN  @{All_Products_elements}
        ${Product_index}=   get index from list    ${All_Products_elements}     ${Product_element}
        ${Product_name}    get text    ${Product_element}
        FOR     ${Required_product}     IN      @{ProductList}
            IF  '${Product_name}' == '${Required_product}'
            #scroll page
            click element     xpath:(//div[@class='card h-100']/div[2]/button)[${Product_index}+1]
            END
        END
    END


User validates that all the desired products has been successfully added into the cart
    [Arguments]     @{expectes_poduct_list_displayed}
    ${length_of_reuired_product_list}   get length    ${expectes_poduct_list_displayed}
    ${Button_text}     get text    css:a.nav-link.btn.btn-primary
    ${Actual_text_trimmed}  split string from right    ${Button_text}   (current)
    ${Actual_text}      strip string    ${Actual_text_trimmed[0]}
    should be equal    ${Actual_text}        Checkout ( ${length_of_reuired_product_list} )



