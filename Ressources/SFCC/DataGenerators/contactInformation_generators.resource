*** Settings ***
Documentation       All the keywords to generate contact informations
Resource    ..${/}Common${/}a_import_all_common_SFCC.resource

*** Keywords ***
Generate Email
    [Arguments]      ${email}

    IF    $email == 'default'    RETURN    ${default_values.email}

    IF    $email == 'auto'
        ${email_uuid}=    Generate Random String    7    [LOWER]
        ${email_id}=      Generate Random String    2    [NUMBERS]
        ${email_firstName}=      Run Keyword    Faker_${TEST_NAME}.First Name
        ${longueur}=    Get Length    ${email_firstName}
        Run Keyword If    ${longueur} > 6    Set Variable    ${email_firstName}=${email_firstName}[0:6]

        # Remove special characters
        ${email_firstName}=    Convert To ASCII    ${email_firstName}
        ${randomEmail}=    Set Variable    ${email_firstName}_${email_uuid}_${email_id}@qq.com
        ${randomEmail}=    Evaluate    "${randomEmail}".capitalize()
        RETURN    ${randomEmail}
    END

    RETURN    ${email}

Generate Salutation
    [Arguments]    ${salutation}

    IF    $salutation == 'default'    RETURN    ${default_values.salutation}

    IF    $salutation == 'auto'

        IF    $country in ${simplified_salutations_countries}
            ${randomSalutation}=    Evaluate    random.choice($simplified_salutations)
        ELSE
            ${randomSalutation}=    Evaluate    random.choice($salutations)
        END

        RETURN    ${randomSalutation}
    END

    RETURN    ${salutation}

Generate FirstName
    [Arguments]    ${FirstName}

    IF    $firstName == 'default'    RETURN    ${default_values.firstName}

    IF    $firstName == 'auto'
        ${randomFirstName}=    Run Keyword    Faker_${TEST_NAME}.First Name
        RETURN    ${randomFirstName}
    END

    RETURN    ${firstName}

Generate LastName
    [Arguments]    ${lastName}

    IF    $lastName == 'default'   RETURN    ${default_values.lastName}

    IF    $lastName == 'auto'
        ${randomLastName}=    Run Keyword    Faker_${TEST_NAME}.Last Name
        RETURN    ${randomLastName}
    END

    RETURN    ${lastName}

Generate PhoneNumber
    [Arguments]    ${phoneNumber}

    IF    $phoneNumber == 'default'    RETURN    ${default_values.phoneNumber}

    IF    $phoneNumber == 'auto'
        ${randomPhoneNumber}=     Run Keyword    Faker_${TEST_NAME}.Phone Number
        ${randomPhoneNumber}=     Replace String Using Regexp    ${randomPhoneNumber[::-1]}    [^1-9]    ${EMPTY}
         ${length}=    Get Length    ${randomPhoneNumber}
        WHILE    ${length} < 10
            ${additionalDigits}=    Run Keyword    Faker_${TEST_NAME}.Phone Number
            ${additionalDigits}=    Replace String Using Regexp    ${additionalDigits[::-1]}    [^0-9]    ${EMPTY}
            ${randomPhoneNumber}=    Set Variable    ${randomPhoneNumber}${additionalDigits[:10 - ${length}]}
            ${length}=    Get Length    ${randomPhoneNumber}
        END
            IF    $country == 'TWN'
                   ${randomPhoneNumber}=   set variable  09${randomPhoneNumber[0:${phone_number_size_by_country.${country}}][::-1]}
            ELSE
                  ${randomPhoneNumber}=   set variable  ${randomPhoneNumber[0:${phone_number_size_by_country.${country}}][::-1]}
            END
        RETURN    ${randomPhoneNumber}
    END

    RETURN    ${phoneNumber}

Generate BirthDate
    [Arguments]    ${birthDate}

    IF    $birthDate == 'default'    RETURN    ${default_values.birthDate}

    IF    $birthDate == 'auto'
        ${min_date}=    Evaluate    datetime.date(1940, 1, 1)    datetime
        ${max_date}=    Evaluate    datetime.date(2006, 1, 1)    datetime
        ${randomBirthDate}=    Run Keyword    Faker_${TEST_NAME}.Date Between    ${min_date}    ${max_date}
        RETURN    ${randomBirthDate}
    END

    RETURN    ${birthDate}

Generate emailOptin
    [Arguments]    ${emailOptin}

     IF    $emailOptin == 'auto'
         ${randomEmailOptin}=    Evaluate    random.choice($lov_yes_or_no_optin)
         RETURN    ${randomEmailOptin}
     END

    RETURN    ${emailOptin}

Generate SMSOptin
    [Arguments]    ${SMSOptin}

    IF   $country in ${sms_optin_countries}
        IF    $SMSOptin == 'auto'
             ${randomSMSOptin}=    Evaluate    random.choice($lov_yes_or_no_optin)
             RETURN    ${randomSMSOptin}
        END
        RETURN    ${SMSOptin}
    ELSE
        RETURN    ${EMPTY}
    END
Generate isLoyaltyMember
    [Arguments]    ${isLoyaltyMember}
    IF    $isLoyaltyMember == 'auto'
         ${randomIsLoyaltyMember}=    Evaluate    random.choice($lov_yes_or_no_optin)
         RETURN    ${randomIsLoyaltyMember}
    END

    RETURN    ${isLoyaltyMember}
