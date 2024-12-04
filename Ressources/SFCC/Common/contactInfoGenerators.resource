*** Settings ***
Documentation       All the keywords to generate contact informations

Resource    a_import_all_common_SFCC.resource

*** Keywords ***
Generate Email
    [Arguments]    ${email}

    IF    $email == 'default'    RETURN    ${default_values.email}

    IF    $email == 'auto'
        ${randomEmail}=    Run Keyword    Faker_${TEST_NAME}.Email
        RETURN    ${randomEmail}
    END

    RETURN    ${email}

Generate Salutation
    [Arguments]    ${salutation}    ${country}

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
        ${randomPhoneNumber}=     Replace String Using Regexp    ${randomPhoneNumber[::-1]}    [^0-9]    ${EMPTY}

        RETURN    ${randomPhoneNumber}
    END

    RETURN    ${phoneNumber}

Generate Password
    [Arguments]    ${password}

    IF    $password == 'default'    RETURN    ${default_values.password}

    IF    $password== 'auto'
        ${randomPassword}=    Run Keyword    Faker_${TEST_NAME}.Password
        RETURN    ${randomPassword}
    END
    RETURN    ${randomPassword}

Generate BirthDate
    [Arguments]    ${birthDate}

    IF    $birthDate == 'default'    RETURN    ${default_values.birthDate}

    IF    $birthDate == 'auto'
        ${min_date}=    Evaluate    datetime.date(1930, 1, 1)    datetime
        ${max_date}=    Evaluate    datetime.date(2006, 1, 1)    datetime
        ${randomBirthDate}=    Run Keyword    Faker_${TEST_NAME}.Date Between    ${min_date}    ${max_date}
        RETURN    ${randomBirthDate}
    END

    RETURN    ${birthDate}
