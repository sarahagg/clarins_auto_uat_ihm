*** Settings ***
Documentation       all the keywords needed to close the popups

Resource            ..${/}Common${/}a_import_all_common_SFCC.resource

*** Keywords ***
Wait And Close All Popups
    [Arguments]    ${country}

    # Accept cookies
    ${return_status}=   Check If Element Is Visible And Warn If Not    ${popupElement_cookies_popup}
    WHILE    $return_status == 'FAIL'    limit=${number_of_retry_to_wait_an_element}    on_limit=pass
        Log    Waiting for cookie banner to appear
        ${return_status}=   Check If Element Is Visible And Warn If Not    ${popupElement_cookies_popup}
    END

    IF    $return_status == 'PASS'
        Click    ${popupElement_cookies_agree_button}
        Log    Cookie accepted
    END

    # If necessary > decline welcome offer
    IF    $country in ${welcome_offer_countries}
        ${return_status}=   Check If Element Is Visible And Warn If Not    ${popupElement_welcome_offer_popup}
        WHILE    $return_status == 'FAIL'    limit=${number_of_retry_to_wait_an_element}    on_limit=pass
            Log    Waiting for welcome offer to appear
            ${return_status}=   Check If Element Is Visible And Warn If Not    ${popupElement_welcome_offer_popup}
        END

        IF    $return_status == 'PASS'
            Click    ${popupElement_welcome_offer_decline_button}
            Log      Welcome offer refused
        END
     END

    # If necessary > decline push ad up banner
    IF    $country in ${push_ad_up_banner_countries}
        ${return_status}=   Check If Element Is Visible And Warn If Not    ${popupElement_push_ad_banner_popup}
        WHILE    $return_status == 'FAIL'    limit=${number_of_retry_to_wait_an_element}    on_limit=pass
            Log    Waiting for push ad up banner to appear
            ${return_status}=   Check If Element Is Visible And Warn If Not    ${popupElement_push_ad_banner_popup}
        END

        IF    $return_status == 'PASS'
            Click    ${popupElement_push_ad_banner_decline_button}
            Log      Push Ad refused
        END
    END