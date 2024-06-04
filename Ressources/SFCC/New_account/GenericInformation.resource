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

        #${min_date}=    Evaluate    datetime.date(1930, 1, 1)    datetime
        #${max_date}=    Evaluate    datetime.date.today()    datetime
        ##${random_date}=    Evaluate    str(${min_date} + datetime.timedelta(days=random.randint(0, (${max_date} - ${min_date}).days)))    datetime    random    min_date=${min_date}    max_date=${max_date}

        RETURN    ${random_BirthDate}
    END

    RETURN     ${BirthDate}

choose salutation
    [Arguments]    ${salutation}

    IF  $salutation == 'auto'
        #${random_gender}=     Append To List      ${cuContact_lov_gender}        ${EMPTY}
        ${random_salutation}=     Evaluate            random.choice($salutations)
        RETURN    ${random_salutation}
    END

    RETURN     ${salutation}
