*** Settings ***
Documentation       All the keywords to generate contact informations

Resource    a_import_all_common_SFCC.resource

*** Keywords ***
Generate FirstName
    [Arguments]    ${FirstName}

    IF    $FirstName == 'default'
        RETURN    ${default_values.FistName}
    END

    IF    $FirstName == 'auto'
        ${random_FirstName}=    Run Keyword    Faker_${TEST_NAME}.First Name
        ${FirstName}=    Set Variable    ${random_FirstName}
        RETURN    ${random_FirstName}
    END

    RETURN    ${FirstName}

Generate LastName
    [Arguments]    ${LastName}

    IF    $LastName == 'default'
        RETURN    ${default_values.LastName}
    END

    IF    $LastName == 'auto'
        ${random_LastName}=    Run Keyword    Faker_${TEST_NAME}.Last Name
        ${LastName}=    Set Variable    ${random_LastName}
        RETURN    ${random_LastName}
    END
    RETURN    ${LastName}

Generate Email
    [Arguments]    ${Email}

    IF    $Email == 'default'    RETURN    emailderesr@gmail.com

    IF    $Email == 'auto'
        ${randomEmail}=    Run Keyword    Faker_${TEST_NAME}.Email
        ${Email}=    set variable    ${randomEmail}
        RETURN    ${randomEmail}
    END

    RETURN    ${Email}

Generate Password
    [Arguments]    ${mypassword}
    IF    $mypassword== 'auto'
        ${random-mypassword}=    Run Keyword    Faker_${TEST_NAME}.Name
        RETURN    ${random-mypassword}
    END
    RETURN    ${mypassword}

Generate BirthDate
    [Arguments]    ${BirthDate}

    IF    $BirthDate == 'default' or $BirthDate == 'auto'
        ${min_date}=    Evaluate    datetime.date(1930, 1, 1)    datetime
        ${max_date}=    Evaluate    datetime.date(2006, 1, 1)    datetime
        ${random_BirthDate}=    Run Keyword    Faker_${TEST_NAME}.Date Between    ${min_date}    ${max_date}
        RETURN    ${random_BirthDate}
    END

    RETURN    ${BirthDate}

Generate Salutation
    [Arguments]    ${salutation}    ${country}
    IF    $salutation == 'auto'
        ${random_salutation}=    Evaluate    random.choice($salutations)
        IF    $country == 'BEL' or $country == 'LUX' or $country == 'NLD' or $country == 'CHE'
            ${random_salutation}=    Evaluate    random.choice($BNLsalutations)
        END
        RETURN    ${random_salutation}
    END
    IF    $salutation == 'default'    RETURN    ${default_values.salutation}
    RETURN    ${salutation}
