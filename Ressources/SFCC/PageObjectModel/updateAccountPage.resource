
*** Settings ***
Documentation       all the keywords needed to navigate on Create Account Page

Resource            ..${/}Common${/}a_import_all_common_SFCC.resource

*** Keywords ***
Complete Update Form

    ${salutation}=          Set Variable    ${canonical_form_contact_link_files.get('\${salutation}')}
    ${firstName}=           Set Variable    ${canonical_form_contact_link_files.get('\${firstName}')}
    ${lastName}=            Set Variable    ${canonical_form_contact_link_files.get('\${lastName}')}
    ${password}=            Set Variable    ${canonical_form_contact_link_files.get('\${email}')}
    ${phoneNumber}=         Set Variable    ${canonical_form_contact_link_files.get('\${phoneNumber}')}
    ${birthDate}=           Set Variable    ${canonical_form_contact_link_files.get('\${birthDate}')}
    ${emailOptin}=          Set Variable    ${canonical_form_contact_link_files.get('\${emailOptin}')}
    ${SMSOptin}=            Set Variable    ${canonical_form_contact_link_files.get('\${SMSOptin}')}
    ${isLoyaltyMember}=     Set Variable    ${canonical_form_contact_link_files.get('\${isLoyaltyMember}')}
    ${country}=             Set Variable    ${canonical_form_contact_link_files.get('\${country}')}

    # FILL SALUTATION
    IF   '${country}' not in @{no_salutation_countries}
        IF    '${salutation}' != '${EMPTY}'
            Click    ${updateAccountPage_salutation_option.replace('$SALUTATION$', '${translated_salutations.${salutation}}')}
        END
    END
    # FILL FIRST NAME
    IF    '${firstName}' != '${EMPTY}'
        Fill Text    ${updateAccountPage_first_name_input}    ${firstName}
    END

    # FILL LAST NAME
    IF    '${lastName}' != '${EMPTY}'
        Fill Text    ${updateAccountPage_last_name_input}    ${lastName}
    END

    # FILL PHONE NUMBER
    IF    '${phoneNumber}' != '${EMPTY}'
        Click    ${updateAccountPage_phone_number_country_code_select}
        Click    ${updateAccountPage_phone_number_country_code_option.replace('$COUNTRY_ALPHA2$', '${translated_countries_to_alpha2.${country}}')}
        Fill Text    ${updateAccountPage_phone_number_input}    ${phoneNumber}
    END

    # FILL BIRTHDATE
    IF    '${birthDate}' != '${EMPTY}'
        Fill Text    ${updateAccountPage_birthday_input}    ${birthDate}
        Wait For Elements State    ${updateAccountPage_birthday_date_invalid_message}    hidden
    END

    # CLICK ALL THE BUTTONS (LOYALTY, OPTIN ....)
    IF    '${emailOptin}' != '${EMPTY}'         Click    ${updateAccountPage_email_optin_option.replace('$EMAIL_OPTIN_VALUE$', '${emailOptin.lower()}')}
    IF    '${SMSOptin}' != '${EMPTY}'           Click    ${updateAccountPage_sms_optin_option.replace('$SMS_OPTIN_VALUE$', '${SMSOptin.lower()}')}
    IF    '${isLoyaltyMember}' != '${EMPTY}'    Click    ${updateAccountPage_is_loyalty_member_option.replace('$IS_LOYALTY_MEMBER_VALUE$', '${isLoyaltyMember.lower()}')}

    # SUBMIT
    Click    ${updateAccountPage_submit_button}

Verify Account Update
    ${country}=    Set Variable    ${canonical_form_contact_link_files.get('\${country}')}

    ${return_status}=   Check If Element Is Visible And Warn If Not    ${myDashboardPage_dashboard_title}
    WHILE    $return_status == 'FAIL'    limit=${number_of_retry_to_wait_an_element}    on_limit=pass
        Log    Waiting dashboard title to appear
        ${return_status}=   Check If Element Is Visible And Warn If Not    ${myDashboardPage_dashboard_title}
    END

    IF    $return_status == 'PASS'
        ${text}=    Get Text    ${myDashboardPage_dashboard_title}
        Should Be Equal    ${account_dashboard_profile_text.${country}}    ${text}
        Log      Account updated
    END
