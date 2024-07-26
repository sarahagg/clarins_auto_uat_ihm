*** Settings ***
Documentation       all the keywords needed to login to the website and accept the cookies
Resource            ..${/}..${/}..${/}Ressources${/}SFCC${/}Common${/}common.resource

*** Keywords ***
Create a new account
    [Arguments]   ${playTest}   ${FirstName}     ${LastName}     ${Email}      ${mypassword}   ${BirthDate}  ${country}   ${emailOption}    ${isLoyaltyMember}   ${salutation}  ${regions}
        #sleep  1s
    IF    $playTest == "YES"
        Authentificate and accept cookies   ${country}
        sleep  1s
        ${generated_data}=   Creation de compte   ${FirstName}     ${LastName}     ${Email}        ${mypassword}   ${BirthDate}   ${country}    ${emailOption}    ${isLoyaltyMember}    ${salutation}    ${regions}
        log  ${generated_data}
        Write Data     ${CSV_FILE}    ${generated_data}
        sleep   5s
        Close Browser
    END

Creation de compte
    [Arguments]    ${FirstName}     ${LastName}     ${Email}    ${mypassword}   ${BirthDate}   ${country}   ${emailOption}  ${isLoyaltyMember}  ${salutation}   ${regions}
    sleep  1s
    Import FakerLibrary                                    ${country}
##COUNTRY
    ${generated_country}=       Set Variable               ${country}
    Connection Button                                      ${country}

###EMAIL
    ${Email}=                   Generate Email               ${Email}
    ${generated_Email}=         Set Variable                 ${Email}
    Fill text                   ${insert_email}              ${Email}
    Click                       ${remember}
    Click                       ${continuer}
###SALUTATION
    ${newsalutation}=               choose salutation        ${salutation}   ${country}
    ${generated_salutation}=     set variable            ${newsalutation}
     IF     $country != 'USA'
         IF         $newsalutation == 'M'
            click                      ${M}
         ELSE IF    $newsalutation == 'Mme'
            click                      ${Mme}
         ELSE
            click                      ${Mlle}
         END
     #ELSE IF   $country = 'BNL'   or   $country = 'CHE'

     END

###FIRST NAME
    ${FirstName}=               Generate FirstName          ${FirstName}
     ${generated_FirstName}=    Set Variable   ${FirstName}
    Fill Text                   ${First_Name_field}         ${FirstName}
###LAST NAME
    ${LastName}=                Generate lastName           ${LastName}
    ${generated_LastName}=      Set Variable          ${LastName}
    Fill Text                   ${last_name_field}          ${LastName}
###CLICK ON EMAIL TO NOT CHANGE IT
    Click                                                  ${email_div}
###FILL THE PASSWORD
    FillPassword                                           ${mypassword}
###FILL THE BIRTHDATE
    ${BirthDate}=               Generate BirthDate          ${BirthDate}
    ${generated_BirthDate}=     Set Variable         ${BirthDate}
    Fill Text                   ${birthday}                 ${BirthDate}
    Wait For Elements State     ${date_invalide}            hidden    timeout=1s
###CHOOSE THE COUNTRY IF THE USER IS FROM THE BNL
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
     ${generated_regions}=       Set Variable            ${regions}
###CLICK ALL THE BUTTONS (LOYALTY, OPTIN ....) AND SUBMIT
    ${emailOption}=                 FillButton emailOption                                 ${emailOption}    ${country}
    ${generated_emailOption}=           Set Variable            ${emailOption}
    ${isLoyaltyMember}=             FillButton isLoyaltyMember                             ${isLoyaltyMember}    ${country}
    ${generated_isLoyaltyMember}=       Set Variable            ${isLoyaltyMember}
    FillButton agreeToTerms and privacypolicy              ${country}
    Click                       ${submit}

    [Return]    ${generated_FirstName}  ${generated_LastName}  ${generated_Email}   ${generated_BirthDate}    ${generated_country}  ${generated_salutation}  ${regions}  ${generated_emailOption}  ${generated_isLoyaltyMember}

