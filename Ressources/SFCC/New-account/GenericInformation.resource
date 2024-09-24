*** Settings ***
Documentation       all the keywords needed to login to the website and accept the cookies

Resource            ..${/}..${/}..${/}Ressources${/}SFCC${/}Common${/}common.resource


*** Keywords ***
Generate FirstName
    [Arguments]    ${FirstName}
    IF    $FirstName == 'default'    RETURN    ${default_values.FistName}
    IF    $FirstName == 'auto'
        ${random_FirstName}=    Run Keyword    Faker_${TEST_NAME}.First Name
        ${FirstName}=    Set Variable    ${random_FirstName}
        RETURN    ${random_FirstName}
    END
    RETURN    ${FirstName}

Generate lastName
    [Arguments]    ${LastName}
    IF    $LastName == 'default'    RETURN    ${default_values.LastName}
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
        IF    $country == 'BNL' or $country == 'CHE'
            ${random_salutation}=    Evaluate    random.choice($BNLsalutations)
        END
        RETURN    ${random_salutation}
    END
    IF    $salutation == 'default'    RETURN    ${default_values.salutation}
    RETURN    ${salutation}

Generate Region
    [Arguments]    ${regions}
    IF    $regions == 'auto'
        ${random_regions}=    Evaluate    random.choice($BNLregion)
        RETURN    ${random_regions}
    END
    RETURN    ${regions}

Connection Button
    #IF    $country == 'ITA'
       # ${connexion_button}=    Set Variable    ${italie_connexion_button}
    #END
    Click    ${connexion_button}

Fill Button emailOption
    [Arguments]    ${emailOption}    ${country}
    # receive infos by Email
    IF    $emailOption == 'YES'
        Click    ${emailOptionYes}
        RETURN    ${emailOption}
    ELSE
        Click    ${emailOptionNo}
        RETURN    ${emailOption}
    END

    RETURN    ${emailOption}

Fill Button isLoyaltyMember
    [Arguments]    ${isLoyaltyMember}    ${country}
    # Become a loyalty member
    IF    $isLoyaltyMember == 'YES'
        Click    ${isLoyaltyMemberYes}
        RETURN    ${isLoyaltyMember}
    ELSE
        Click    ${isLoyaltyMemberNo}
        RETURN    ${isLoyaltyMember}
    END

Fill Button agreeToTerms and privacypolicy
    [Arguments]    ${country}
    # additional buttons for usa and italy
    IF    $country == 'USA'    Click    ${agreeToTerms}
    IF    $country == 'ITA'    Click    ${privacyPolicy}

Verify Creation
    [Arguments]    ${country}
    Wait For Elements State    ${dashboard}    visible
    ${text}=    Get Text    ${dashboard}
    Should Be Equal    ${creation_text.${country}}    ${text}
