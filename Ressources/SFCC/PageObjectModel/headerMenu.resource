*** Settings ***
Documentation       all the keywords needed to navigate on the Home Page

Resource            ..${/}Common${/}a_import_all_common_SFCC.resource

*** Keywords ***
Go To Login Page
    Click    ${headerMenu_login_button}

Search For A Product
    ${productList} =          Set Variable    ${canonical_form_transaction_link_files.get('\${productList}')}
    FOR    ${item}    IN    @{productList}
        ${item}=    Strip String    ${item}
        ${split_result} =    Evaluate    str("${item}").split(":") if ":" in str("${item}") else ["${item}", "1"]
        ${product}    ${quantity} =    Set Variable    ${split_result}[0]    ${split_result}[1]
        ${quantity} =    Convert To Integer    ${quantity}

        # Search for the product
        Wait For Elements State    ${headerMenu_search_bar_button}   visible
        Fill Text    ${headerMenu_search_bar_button}    ${product}
        Click    ${headerMenu_search_button}
        Sleep  1s

        # Wait for product and add it to cart
        Wait For Elements State    ${searchResult_doubleserum_div}    visible
        Hover    ${searchResult_doubleserum_div}
        Click    ${searchResult_doubleserum_div}
        Wait For Elements State    ${searchResult_add_to_bag_button}    visible

        IF    ${quantity} > 1
            FOR    ${i}    IN RANGE    ${quantity -1}
                Hover    ${headerMenu_plus_button}
                Click    ${headerMenu_plus_button}
                Sleep    0.5s
            END
        END
        Click    ${searchResult_add_to_bag_button}


    END

view Cart
    hover    ${headerMenu_minibag_button}
    Click    ${headerMenu_minibag_button}
