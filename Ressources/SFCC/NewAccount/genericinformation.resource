*** Settings ***
Documentation       all the keywords needed to login to the website and accept the cookies

Resource            ..${/}..${/}..${/}Ressources${/}SFCC${/}Common${/}common.resource


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

Fill Password
    [Arguments]    ${mypassword}
    ${mypassword}=    Generate Password    ${mypassword}
    Fill Secret    ${account_password}    $mypassword

Generate BirthDate
    [Arguments]    ${BirthDate}
    IF    $BirthDate == 'default' or $BirthDate == 'auto'
        ${min_date}=    Evaluate    datetime.date(1930, 1, 1)    datetime
        ${max_date}=    Evaluate    datetime.date(2006, 1, 1)    datetime
        ${random_BirthDate}=    Run Keyword    Faker_${TEST_NAME}.Date Between    ${min_date}    ${max_date}
        ${BirthDate}=    Set Variable    ${random_BirthDate}
        RETURN    ${BirthDate}
    END
    RETURN    ${BirthDate}

Choose Salutation
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

Connection Button
    #IF    $country == 'ITA'
       # ${connexion_button}=    Set Variable    ${italie_connexion_button}
    #END
    Click    ${connexion_button}

Click Button emailOption
    [Arguments]    ${emailOption}
    # receive infos by Email
    IF    $emailOption == 'YES'
        Click    ${email_option_yes}
        RETURN    ${emailOption}
    ELSE
        Click    ${email_option_no}
        RETURN    ${emailOption}
    END

    RETURN    ${emailOption}

Click Button isLoyaltyMember
    [Arguments]    ${isLoyaltyMember}
    IF    $isLoyaltyMember == 'YES'
        Click    ${is_loyalty_member_yes}
        RETURN    ${isLoyaltyMember}
    ELSE
        Click    ${is_loyalty_member_no}
        RETURN    ${isLoyaltyMember}
    END

Click Button agreeToTerms and privacyPolicy
    [Arguments]    ${country}
    # additional buttons for usa and italy
    IF    $country == 'USA'    Click    ${agree_to_terms}
    IF    $country == 'ITA'    Click    ${privacy_policy}

Verify Creation
    [Arguments]    ${country}
    Wait For Elements State    ${dashboard}    visible
    ${text}=    Get Text    ${dashboard}
    Should Be Equal    ${creation_text.${country}}    ${text}
