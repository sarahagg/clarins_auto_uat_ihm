*** Settings ***
Documentation       all the keywords needed to login to the website and accept the cookies
Resource            ..${/}..${/}..${/}Ressources${/}SFCC${/}Common${/}common.resource

*** Keywords ***
Generate FirstName
    [Arguments]    ${FirstName}

    IF  $FirstName == 'default'
        RETURN    sarah
    END

    IF  $FirstName == 'auto'
        ${random_FirstName}=  Run Keyword    Faker_${TEST_NAME}.First Name
        RETURN    ${random_FirstName}
    END

    RETURN     ${FirstName}

Generate lastName
    [Arguments]    ${LastName}

    IF  $LastName == 'default'
        RETURN    sarah
    END

    IF  $LastName == 'auto'
        ${random_LastName}=     Run Keyword    Faker_${TEST_NAME}.Last Name
        RETURN    ${random_LastName}
    END

    RETURN     ${LastName}

Generate Email
    [Arguments]    ${Email}

    IF  $Email == 'auto'
        ${Email}=     Run Keyword    Faker_${TEST_NAME}.Email
        RETURN    ${Email}
    END

    RETURN     ${Email}

Generate Password
    [Arguments]    ${mypassword}

    IF  $mypassword== 'auto'
        ${random-mypassword}=     Run Keyword    Faker_${TEST_NAME}.Name
        RETURN    ${random-mypassword}
    END

    RETURN     ${mypassword}
Generate BirthDate
    [Arguments]    ${BirthDate}

    IF  $BirthDate == 'default' or $BirthDate == 'auto'
        ${min_date}=    Evaluate    datetime.date(1930, 1, 1)    datetime
        ${max_date}=    Evaluate    datetime.date(2006, 1, 1)    datetime
        ${random_BirthDate}=     Run Keyword    Faker_${TEST_NAME}.Date Between    ${min_date}    ${max_date}
        RETURN    ${random_BirthDate}
    END

    RETURN     ${BirthDate}

choose salutation
    [Arguments]    ${salutation}    ${country}

    IF  $salutation == 'auto'
        ${random_salutation}=     Evaluate            random.choice($salutations)
        IF    $country == 'BNL' or $country == 'CHE'
           ${random_salutation}=     Evaluate            random.choice($BNLsalutations)
        END
        RETURN    ${random_salutation}
    END

    RETURN     ${salutation}

Generate Region
    [Arguments]    ${regions}

    IF  $regions == 'auto'
        ${random_regions}=     Evaluate            random.choice($BNLregion)
        RETURN    ${random_regions}
    END

    RETURN     ${regions}