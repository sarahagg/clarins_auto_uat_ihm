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
FillFirstname
    [Arguments]    ${FirstName}
    ${FirstName}=               Generate FirstName          ${FirstName}
    Fill Text                   ${First_Name_field}         ${FirstName}
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
FillLastName
    [Arguments]     ${LastName}
    ${LastName}=                Generate lastName           ${LastName}
    Fill Text                   ${last_name_field}          ${LastName}

Generate Email
    [Arguments]    ${Email}
    IF  $Email == 'auto'
        ${Email}=     Run Keyword    Faker_${TEST_NAME}.Email
        RETURN    ${Email}
    END
    RETURN     ${Email}

FillEmail
    [Arguments]   ${Email}
    ${Email}=                   Generate Email               ${Email}
    Fill text                   ${insert_email}              ${Email}
    Click                       ${remember}
    Click                       ${continuer}
Generate Password
    [Arguments]    ${mypassword}
    IF  $mypassword== 'auto'
        ${random-mypassword}=     Run Keyword    Faker_${TEST_NAME}.Name
        RETURN    ${random-mypassword}
    END
    RETURN     ${mypassword}
FillPassword
    [Arguments]  ${mypassword}
        ${mypassword}=              Generate Password           ${mypassword}
        Fill Secret                 ${account_password}         $mypassword
Generate BirthDate
    [Arguments]    ${BirthDate}
    IF  $BirthDate == 'default' or $BirthDate == 'auto'
        ${min_date}=    Evaluate    datetime.date(1930, 1, 1)    datetime
        ${max_date}=    Evaluate    datetime.date(2006, 1, 1)    datetime
        ${random_BirthDate}=     Run Keyword    Faker_${TEST_NAME}.Date Between    ${min_date}    ${max_date}
        RETURN    ${random_BirthDate}
    END
    RETURN     ${BirthDate}
FillBirthdate
    [Arguments]   ${BirthDate}
    ${BirthDate}=               Generate BirthDate          ${BirthDate}
    Fill Text                   ${birthday}                 ${BirthDate}
    Wait For Elements State     ${date_invalide}            hidden    timeout=1s
FillSalutation
    [Arguments]    ${salutation}    ${country}
     ${salutation}=             choose salutation        ${salutation}   ${country}
     IF     $country != 'USA'
         IF         $salutation == 'M'
            click                      ${M}
         ELSE IF    $salutation == 'Mme'
            click                      ${Mme}
         ELSE
            click                      ${Mlle}
         END
     END

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

Connection Button
    [Arguments]   ${country}
    IF    $country == 'ITA'
         ${connexion_button}=     Set Variable  ${italie_connexion_button}
    END
    Click                       ${connexion_button}

FillBNL
    [Arguments]   ${country}   ${region}  ${regions}
        IF    $country == 'BNL'
         Click                  ${region}
         ${regions}=            Generate Region     ${regions}
         IF         $regions == 'Belgique'
             Click                  ${NewAcc_Belgique}
         ELSE IF    $regions == 'Luxembourg '
             Click                  ${NewAcc_Luxembourg}
         ELSE
             Click                  ${NewAcc_Nederland}
         END
     END

FillButtons
    [Arguments]   ${emailOption}   ${isLoyaltyMember}  ${country}
        #receive infos by Email
    IF    $emailOption == 'YES'
        Click                   ${emailOptionYes}
    ELSE
        Click                   ${emailOptionNo}
    END
        # Become a loyalty member
    IF    $isLoyaltyMember == 'YES'
        Click                   ${isLoyaltyMemberYes}
    ELSE
        Click                   ${isLoyaltyMemberNo}
    END
         #additional buttons for usa and italy
    IF    $country == 'USA'
         Click                  ${agreeToTerms}
    END
    IF    $country == 'ITA'
         Click                  ${privacyPolicy}
    END
VerifyCreation
    [Arguments]   ${country}
    Wait For Elements State    ${dashboard}                   visible
    ${text}=                   Get Text                       ${dashboard}
    Should Be Equal            ${creation_text.${country}}    ${text}