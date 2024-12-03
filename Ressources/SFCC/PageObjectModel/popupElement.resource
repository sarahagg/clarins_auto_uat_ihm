*** Settings ***
Documentation       all the keywords needed to navigate on the Home Page

Resource            ..${/}Common${/}a_import_all_common_SFCC.resource

*** Keywords ***
Wait And Close All Popups

    # Accept cookies
    ${return_status}=   Check If Element Is Visible And Warn If Not    ${popupElement_cookies_popup}
    WHILE    $return_status == 'FAIL'    limit=5    on_limit=pass
        Log    Waiting for cookie banner to appear
        ${return_status}=   Check If Element Is Visible And Warn If Not    ${popupElement_cookies_popup}
    END

    IF    $return_status == 'PASS'
        Click    ${popupElement_cookies_agree_button}
        Log    Cookie accepted
    END

    # Decline welcome offer
    ${return_status}=   Check If Element Is Visible And Warn If Not    ${popupElement_welcome_offer_popup}
    WHILE    $return_status == 'FAIL'    limit=5    on_limit=pass
        Log    Waiting for welcome offer to appear
        ${return_status}=   Check If Element Is Visible And Warn If Not    ${popupElement_welcome_offer_popup}
    END

    IF    $return_status == 'PASS'
        Click    ${popupElement_welcome_offer_decline_button}
        Log      Welcome offer refused
    END

    # Decline push ad
    ${return_status}=   Check If Element Is Visible And Warn If Not    ${popupElement_push_ad_banner_popup}
    WHILE    $return_status == 'FAIL'    limit=5    on_limit=pass
        Log    Waiting for push ad banner to appear
        ${return_status}=   Check If Element Is Visible And Warn If Not    ${popupElement_push_ad_banner_popup}
    END

    IF    $return_status == 'PASS'
        Click    ${popupElement_push_ad_banner_decline_button}
        Log      Push Ad refused
    END