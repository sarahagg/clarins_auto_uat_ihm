*** Settings ***
Documentation       all the keywords needed to navigate on Create Account Page

Resource            ..${/}Common${/}a_import_all_common_SFCC.resource

*** Keywords ***
Complete Registration Form
    [Arguments]
    ...    ${salutation}
    ...    ${firstName}
    ...    ${lastName}
    ...    ${password}
    ...    ${phoneNumber}
    ...    ${birthDate}
    ...    ${emailOptin}
    ...    ${SMSOptin}
    ...    ${isLoyaltyMember}
    ...    ${country}

    # GENERATE and FILL SALUTATION
    IF    $salutation != '${EMPTY}'
        ${generated_salutation}=    Generate Salutation    ${salutation}    ${country}
        Click    ${createAccountPage_salutation_option.replace('$SALUTATION$', '${translated_salutations.${generated_salutation}}')}
    END

    # GENERATE and FILL FIRST NAME
    IF    $firstName != '${EMPTY}'
        ${generated_firstName}=    Generate FirstName    ${firstName}
        Fill Text    ${createAccountPage_first_name_input}    ${generated_firstName}
    END

    # GENERATE and FILL LAST NAME
    IF    $lastName != '${EMPTY}'
        ${generated_lastName}=    Generate lastName    ${lastName}
        Fill Text    ${createAccountPage_last_name_input}    ${generated_lastName}
    END

    # GENERATE and FILL PASSWORD
    IF    $password != '${EMPTY}'
        ${generated_password}=    Generate Password    ${password}
        Fill Secret    ${createAccountPage_account_password_input}    $generated_password
    END

    # GENERATE and FILL PHONE NUMBER
    IF    $phoneNumber != '${EMPTY}'
        ${generated_phoneNumber}=    Generate phoneNumber    ${phoneNumber}
        Click    ${createAccountPage_phone_number_country_code_select}
        Click    ${createAccountPage_phone_number_country_code_option.replace('$COUNTRY_ALPHA2$', '${translated_countries_to_alpha2.${country}}')}
        Fill Text    ${createAccountPage_phone_number_input}    ${generated_phoneNumber[0:${phone_number_size_by_country.${country}}][::-1]}
    END

    # GENERATE and FILL BIRTHDATE
    IF    $birthDate != '${EMPTY}'
        ${generated_birthDate}=    Generate BirthDate    ${birthDate}
        Fill Text    ${createAccountPage_birthday_input}    ${generated_birthDate}
        Wait For Elements State    ${createAccountPage_birthday_date_invalid_message}    hidden
    END

    # CHOOSE THE COUNTRY IF THE USER IS FROM THE BNL
    IF    $country == 'BEL' or $country == 'LUX' or $country == 'NLD'
        Click    ${createAccountPage_region_select}
        Click    ${createAccountPage_region_option.replace('$COUNTRY_ALPHA2$', '${translated_countries_to_alpha2.${country}}')}
    END
#
    # CLICK ALL THE BUTTONS (LOYALTY, OPTIN ....)
    IF    $emailOptin != '${EMPTY}'         Click    ${createAccountPage_email_optin_option.replace('$EMAIL_OPTIN_VALUE$', '${emailOptin.lower()}')}
    IF    $SMSOptin != '${EMPTY}'           Click    ${createAccountPage_sms_optin_option.replace('$SMS_OPTIN_VALUE$', '${SMSOptin.lower()}')}
    IF    $isLoyaltyMember != '${EMPTY}'    Click    ${createAccountPage_is_loyalty_member_option.replace('$IS_LOYALTY_MEMBER_VALUE$', '${isLoyaltyMember.lower()}')}

    # SUBMIT
    Click Button agreeToTerms and privacyPolicy    ${country}
    Click    ${createAccountPage_submit_button}

    # CHECK IF ACCOUNT CREATION IS OK
    Verify Account Creation     ${country}


    RETURN    ${generated_salutation}    ${generated_firstName}    ${generated_lastName}     ${generated_password}    ${generated_birthDate}


Click Button agreeToTerms and privacyPolicy
    [Arguments]    ${country}
    # additional buttons for usa and italy
    IF    $country == 'USA'    Click    ${createAccountPage_USA_agree_to_terms_checkbox}
    IF    $country == 'ITA'    Click    ${createAccountPage_ITA_privacy_policy_checkbox}

Verify Account Creation
    [Arguments]    ${country}

    ${return_status}=   Check If Element Is Visible And Warn If Not    ${updateAccountPage_dashboard}
    WHILE    $return_status == 'FAIL'    limit=${number_of_retry_to_wait_an_element}    on_limit=pass
        Log    Waiting for welcome offer to appear
        ${return_status}=   Check If Element Is Visible And Warn If Not    ${updateAccountPage_dashboard}
    END

    IF    $return_status == 'PASS'
        ${text}=    Get Text    ${updateAccountPage_dashboard}
        Should Be Equal    ${account_dashboard_text.${country}}    ${text}
        Log      Account created
    END



