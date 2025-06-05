*** Settings ***
Documentation       all the keywords needed to use the Newsletter Form

Resource            ..${/}Common${/}a_import_all_common_SFCC.resource


*** Keywords ***
Access And Complete Newsletter Footer Form

    ${email}=      Set Variable    ${canonical_form_contact_link_files.get('\${email}')}

    Go To Newsletter Footer Form

    IF    $country == 'BEL' or $country == 'LUX' or $country == 'NLD'
        Click    ${newsletterForm_region_select}
        Click    ${newsletterForm_region_option.replace('$COUNTRY_ALPHA2$', '${translated_countries_to_alpha2.${country}}')}
    END

    Fill Text    ${newsletterForm_email_input}    ${email}

    IF    '${country}' in @{newsletterForm_privacy_policy_countries}
        Click    ${newsletterForm_privacy_policy_checkbox}
    END
    Click     ${newsletterForm_subscribe_button}
Access And Complete Newsletter Offer Page

    ${email}=        Set Variable    ${canonical_form_contact_link_files.get('\${email}')}
    ${firstName}=    Set Variable    ${canonical_form_contact_link_files.get('\${firstName}')}
    ${lastName}=     Set Variable    ${canonical_form_contact_link_files.get('\${lastName}')}
    ${birthDate}=    Set Variable    ${canonical_form_contact_link_files.get('\${birthDate}')}

    Go To Newsletter Offer Page Form
    Fill Text    ${newsletterForm_offer_page_email_input}        ${email}
    Fill Text    ${newsletterForm_offer_page_firstName_input}    ${firstName}
    Fill Text    ${newsletterForm_offer_page_lastName_input}     ${lastName}
    Fill Text    ${newsletterForm_offer_page_birthDate_input}     ${birthDate}

    IF    '${country}' in @{newsletterForm_privacy_policy_countries}
        Click    ${newsletterForm_offer_page_privacy_policy_checkbox}
    END
    Click     ${newsletterForm_offer_page_subscribe_button}

Go To Newsletter Offer Page Form
    click   ${newsletterForm_offer_page}
    sleep  5s
    Scroll By    ${none}    95%    0
    Scroll To  ${newsletterForm_newsletter_wrapper}
    Sleep   10s

Go To Newsletter Footer Form
    Scroll By    ${none}    100%    0
    Sleep    2s
    Scroll To Element    ${newsletterForm_email_input}

Verify Newsletter Subscription
    Wait For Elements State    ${newsletterForm_confirm_message}    visible

    ${text}=    Get Text    ${newsletterForm_confirm_message}
    ${text} =   Convert To String    ${text}

    Should Contain    ${text}    ${newsletter_text.${country}}
