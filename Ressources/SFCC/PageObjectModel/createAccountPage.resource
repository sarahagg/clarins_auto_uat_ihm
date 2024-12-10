*** Settings ***
Documentation       all the keywords needed to navigate on Create Account Page

Resource            ..${/}Common${/}a_import_all_common_SFCC.resource

*** Keywords ***
Complete Registration Form

    ${salutation}=          Set Variable    ${canonical_form_contact_link_files.get('\${salutation}')}
    ${firstName}=           Set Variable    ${canonical_form_contact_link_files.get('\${firstName}')}
    ${lastName}=            Set Variable    ${canonical_form_contact_link_files.get('\${lastName}')}
    ${password}=            Set Variable    ${canonical_form_contact_link_files.get('\${password}')}
    ${phoneNumber}=         Set Variable    ${canonical_form_contact_link_files.get('\${phoneNumber}')}
    ${birthDate}=           Set Variable    ${canonical_form_contact_link_files.get('\${birthDate}')}
    ${emailOptin}=          Set Variable    ${canonical_form_contact_link_files.get('\${emailOptin}')}
    ${SMSOptin}=            Set Variable    ${canonical_form_contact_link_files.get('\${SMSOptin}')}
    ${isLoyaltyMember}=     Set Variable    ${canonical_form_contact_link_files.get('\${isLoyaltyMember}')}
    ${country}=             Set Variable    ${canonical_form_contact_link_files.get('\${country}')}

    # FILL SALUTATION
    IF    '${salutation}' != '${EMPTY}'
        Click    ${createAccountPage_salutation_option.replace('$SALUTATION$', '${translated_salutations.${salutation}}')}
    END

    # FILL FIRST NAME
    IF    '${firstName}' != '${EMPTY}'
        Fill Text    ${createAccountPage_first_name_input}    ${firstName}
    END

    # FILL LAST NAME
    IF    '${lastName}' != '${EMPTY}'
        Fill Text    ${createAccountPage_last_name_input}    ${lastName}
    END

    # FILL PASSWORD
    IF    '${password}' != '${EMPTY}'
        Fill Secret    ${createAccountPage_account_password_input}    $password
    END

    # FILL PHONE NUMBER
    IF    '${phoneNumber}' != '${EMPTY}'
        Click    ${createAccountPage_phone_number_country_code_select}
        Click    ${createAccountPage_phone_number_country_code_option.replace('$COUNTRY_ALPHA2$', '${translated_countries_to_alpha2.${country}}')}
        Fill Text    ${createAccountPage_phone_number_input}    ${phoneNumber[0:${phone_number_size_by_country.${country}}][::-1]}
    END

    # FILL BIRTHDATE
    IF    '${birthDate}' != '${EMPTY}'
        Fill Text    ${createAccountPage_birthday_input}    ${birthDate}
        Wait For Elements State    ${createAccountPage_birthday_date_invalid_message}    hidden
    END

    # CHOOSE THE COUNTRY IF THE USER IS FROM THE BNL
    IF    $country == 'BEL' or $country == 'LUX' or $country == 'NLD'
        Click    ${createAccountPage_region_select}
        Click    ${createAccountPage_region_option.replace('$COUNTRY_ALPHA2$', '${translated_countries_to_alpha2.${country}}')}
    END
#
    # CLICK ALL THE BUTTONS (LOYALTY, OPTIN ....)
    IF    '${emailOptin}' != '${EMPTY}'         Click    ${createAccountPage_email_optin_option.replace('$EMAIL_OPTIN_VALUE$', '${emailOptin.lower()}')}
    IF    '${SMSOptin}' != '${EMPTY}'           Click    ${createAccountPage_sms_optin_option.replace('$SMS_OPTIN_VALUE$', '${SMSOptin.lower()}')}
    IF    '${isLoyaltyMember}' != '${EMPTY}'    Click    ${createAccountPage_is_loyalty_member_option.replace('$IS_LOYALTY_MEMBER_VALUE$', '${isLoyaltyMember.lower()}')}
    # SUBMIT
    Click Button agreeToTerms and privacyPolicy    ${country}
    Click    ${createAccountPage_submit_button}

Click Button agreeToTerms and privacyPolicy
    [Arguments]    ${country}
    # additional buttons for USA and ITA
    IF    $country == 'USA'    Click    ${createAccountPage_USA_agree_to_terms_checkbox}
    IF    $country == 'ITA'    Click    ${createAccountPage_ITA_privacy_policy_checkbox}

Verify Account Creation
    ${country}=    Set Variable    ${canonical_form_contact_link_files.get('\${country}')}

    ${return_status}=   Check If Element Is Visible And Warn If Not    ${updateAccountPage_dashboard}
    WHILE    $return_status == 'FAIL'    limit=${number_of_retry_to_wait_an_element}    on_limit=pass
        Log    Waiting dashboard title to appear
        ${return_status}=   Check If Element Is Visible And Warn If Not    ${updateAccountPage_dashboard}
    END

    IF    $return_status == 'PASS'
        ${text}=    Get Text    ${updateAccountPage_dashboard}
        Should Be Equal    ${account_dashboard_text.${country}}    ${text}
        Log      Account created
    END



