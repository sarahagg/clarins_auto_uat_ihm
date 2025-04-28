*** Settings ***
Documentation       all the keywords needed to navigate on Create Account Page

Resource            ..${/}Common${/}a_import_all_common_SFCC.resource

*** Keywords ***
Complete Registration Form

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
    IF    '${salutation}' != '${EMPTY}' and '${country}' not in @{no_salutation_countries}
                Click    ${createAccountPage_salutation_option.replace('$SALUTATION$', '${translated_salutations.${salutation}}')}
                #Click    ${createAccountPage_salutation_option.replace('$SALUTATION$', '${salutation}')}

    END

    # FILL FIRST NAME
    IF    '${firstName}' != '${EMPTY}'
        Fill Text    ${createAccountPage_first_name_input}    ${firstName}
    END

    # FILL LAST NAME
    IF    '${lastName}' != '${EMPTY}'
        Fill Text    ${createAccountPage_last_name_input}    ${lastName}
    END

    # FILL LAST NAME (fugirana) and name (fugirana) for japan
    IF    $country == 'JPN'
        ${last_name_furigana}=    Run Keyword    Faker_${TEST_NAME}.First Name
        ${name_furigana}=    Run Keyword    Faker_${TEST_NAME}.Last Name
        Fill Text    ${createAccountPage_last_name_furigana_input}    ${last_name_furigana}
        Fill Text    ${createAccountPage_name_furigana_input}    ${name_furigana}
    END

    # FILL PASSWORD
    IF    '${password}' != '${EMPTY}'
        Fill Secret    ${createAccountPage_account_password_input}    $password
    END

    # FILL PHONE NUMBER
    IF    '${phoneNumber}' != '${EMPTY}'
        Click    ${createAccountPage_phone_number_country_code_select}
        Click    ${createAccountPage_phone_number_country_code_option.replace('$COUNTRY_ALPHA2$', '${translated_countries_to_alpha2.${country}}')}
        Fill Text    ${createAccountPage_phone_number_input}    ${phoneNumber}
        #Fill Text    ${createAccountPage_phone_number_input}    ${phoneNumber[0:${phone_number_size_by_country.${country}}][::-1]}
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

    # Email OPTIN
    IF    '${emailOptin}' != '${EMPTY}' and '${country}' != 'ITA'
        Click    ${createAccountPage_email_optin_option.replace('$EMAIL_OPTIN_VALUE$', '${emailOptin.lower()}')}
    END

    # SMS Optin
    IF   '${country}' in @{sms_optin_countries}
        IF      $SMSOptin == 'auto'
        ${SMSOptin}=    Evaluate    random.choice($lov_yes_or_no_optin)
        END
        Click    ${createAccountPage_sms_optin_option.replace('$SMS_OPTIN_VALUE$', '${SMSOptin.lower()}')}
    END

    # Whatsapp optin
    IF   '${country}' in @{whatsapp_optin_countries}
        #${whatsappOptin}=    Evaluate    random.choice($lov_yes_or_no_optin)
        ${whatsappOptin}=  set variable   no
        Click    ${createAccountPage_whatsapp_optin_option.replace('$WHATSAPP_OPTIN_VALUE$', '${whatsappOptin.lower()}')}
    END

    #Loyalty member
    IF    '${isLoyaltyMember}' != '${EMPTY}'    Click    ${createAccountPage_is_loyalty_member_option.replace('$IS_LOYALTY_MEMBER_VALUE$', '${isLoyaltyMember.lower()}')}

    # agree to privacy policy for Japan
    IF    $country == 'JPN'
          Click   ${createAccountPage_JPN_privacy_policy_checkbox}
    END

    # agree to terms and conditions
    Click Button agreeToTerms and privacyPolicy    ${country}

    # SUBMIT
    Click    ${createAccountPage_submit_button}

Click Button agreeToTerms and privacyPolicy
    [Arguments]    ${country}
    IF    $country in ${agree_to_terms_and_condition_countries}
        Click    ${createAccountPage_agree_to_terms_checkbox}
    END

    # additional buttons for ITA
    IF    $country == 'ITA'
        ${checkbox}=     Evaluate    random.choice($lov_yes_or_no_optin)
        IF  '${checkbox}' == 'yes'
            Click    ${createAccountPage_ITA_privacy_policy_checkbox_yes}
            ${emailOptin}=     Evaluate    random.choice($lov_yes_or_no_optin)
            Click    ${createAccountPage_email_optin_option.replace('$EMAIL_OPTIN_VALUE$', '${emailOptin.lower()}')}
        END
        IF  '${checkbox}' == 'no'
            Click    ${createAccountPage_ITA_privacy_policy_checkbox_no}
        END
    END

