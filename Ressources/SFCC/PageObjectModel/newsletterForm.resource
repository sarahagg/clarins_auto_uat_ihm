*** Settings ***
Documentation       all the keywords needed to use the Newsletter Form

Resource            ..${/}Common${/}a_import_all_common_SFCC.resource

*** Keywords ***
Access And Complete Newsletter Form
    [Arguments]    ${email}    ${country}

    Go To Newsletter Form

    IF    $country == 'BEL' or $country == 'LUX' or $country == 'NLD'
        Select Newsletter BNL Region    ${country}
    END

    ${email}=    Generate Email    ${email}
    Fill Text    ${newsletterForm_email_input}    ${email}

    IF    $country == 'ITA'    Click    ${newsletterForm_ITA_privacy_policy_checkbox}

    Click    ${newsletterForm_subscribe_button}

    RETURN    ${email}    ${country}

Go To Newsletter Form
    Scroll By    ${none}    100%    0
    Sleep    2
    Scroll To Element    ${newsletterForm_email_input}

Select Newsletter BNL Region
    [Arguments]    ${country}
    Click    ${newsletterForm_region_select}
    IF    $country == 'BEL'
        Click    ${newsletterForm_belgium_option}
    ELSE IF    $country == 'LUX'
        Click    ${newsletterForm_luxembourg_option}
    ELSE IF    $country == 'NLD'
        Click    ${newsletterForm_netherlands_option}
    ELSE
        Log    BNL country not authorized
    END

Check Newsletter Subscription
    [Arguments]    ${country}
    Wait For Elements State    ${newsletterForm_confirm_message}    visible

    ${text}=    Get Text    ${newsletterForm_confirm_message}
    ${text} =   Convert To String    ${text}

    Should Contain    ${text}    ${newsletter_text.${country}}