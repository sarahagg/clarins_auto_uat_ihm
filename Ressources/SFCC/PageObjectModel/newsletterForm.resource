*** Settings ***
Documentation       all the keywords needed to use the Newsletter Form

Resource            ..${/}Common${/}a_import_all_common_SFCC.resource

*** Keywords ***
Access And Complete Newsletter Form

    ${email}=      Set Variable    ${canonical_form_contact_link_files.get('\${email}')}
    ${country}=    Set Variable    ${canonical_form_contact_link_files.get('\${country}')}

    Go To Newsletter Form

    IF    $country == 'BEL' or $country == 'LUX' or $country == 'NLD'
        Click    ${newsletterForm_region_select}
        Click    ${newsletterForm_region_option.replace('$COUNTRY_ALPHA2$', '${translated_countries_to_alpha2.${country}}')}
    END

    Fill Text    ${newsletterForm_email_input}    ${email}

    IF    $country == 'ITA'    Click    ${newsletterForm_ITA_privacy_policy_checkbox}

    Click    ${newsletterForm_subscribe_button}

Go To Newsletter Form
    Scroll By    ${none}    100%    0
    Sleep    2
    Scroll To Element    ${newsletterForm_email_input}

Verify Newsletter Subscription
    ${country}=    Set Variable    ${canonical_form_contact_link_files.get('\${country}')}

    Wait For Elements State    ${newsletterForm_confirm_message}    visible

    ${text}=    Get Text    ${newsletterForm_confirm_message}
    ${text} =   Convert To String    ${text}

    Should Contain    ${text}    ${newsletter_text.${country}}
