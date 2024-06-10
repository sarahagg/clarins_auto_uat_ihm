*** Settings ***
Documentation       all the keywords needed to login to the website and accept the cookies
Resource            ..${/}..${/}..${/}Ressources${/}SFCC${/}Common${/}common.resource

*** Keywords ***
Creation de compte
    [Arguments]    ${FirstName}     ${LastName}     ${Email}    ${mypassword}   ${BirthDate}   ${country}   ${emailOption}  ${isLoyaltyMember}  ${salutation}   ${regions}

    Import FakerLibrary         ${country}

    IF    $country == 'ITA'
         ${connexion_button}=     Set Variable  ${italie_connexion_button}
    END

    Click                       ${connexion_button}
    Log To Console              connexion page
    ${Email}=                   Generate Email               ${Email}
    Fill text                   ${insert_email}              ${Email}
    Click                       ${remember}
    Click                       ${continuer}

    #salutation
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
    #First name
    ${FirstName}=               Generate FirstName          ${FirstName}
    Fill Text                   ${First_Name_field}         ${FirstName}

    #last name
    ${LastName}=                Generate lastName           ${LastName}
    Fill Text                   ${last_name_field}          ${LastName}

    #email
    Click                       ${email_div}

    #password
    ${mypassword}=              Generate Password           ${mypassword}
    Fill Secret                 ${account_password}         $mypassword

    #birthday
    ${BirthDate}=               Generate BirthDate          ${BirthDate}
    Fill Text                   ${birthday}                 ${BirthDate}
    Wait For Elements State     ${date_invalide}            hidden    timeout=1s

    #region BNL
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

    #bouttons
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

        #submit
    Click                       ${submit}

    #Verify that the account was created successfuly
    Wait For Elements State    ${dashboard}                   visible
    ${text}=                   Get Text                       ${dashboard}
    Should Be Equal            ${creation_text.${country}}    ${text}

