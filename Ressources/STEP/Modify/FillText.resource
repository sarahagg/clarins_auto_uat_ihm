*** Settings ***
Documentation       all the keywords needed to modify a user's information on STEP
Resource            ..${/}..${/}..${/}Ressources${/}STEP/Common${/}common.resource

*** Keywords ***
ModifySalutation
    [Arguments]   ${salutation}
    IF  len($salutation)>0
        Click         ${loc_salutation}
        Fill text     ${loc_salutation}     ${salutation}
    END
ModifyFirstName
    [Arguments]   ${FirstName}
    IF  len($FirstName)>0
        Click         ${loc_FirstName}
        Fill text     ${loc_FirstName}     ${FirstName}
    END
ModifyLastName
    [Arguments]   ${LastName}
    IF  len($LastName)>0
        Click         ${loc_LastName}
        Fill text     ${loc_LastName}     ${LastName}
    END
ModifyBirthDate
    [Arguments]   ${BirthDate}
    IF  len($BirthDate)>0
        Click         ${loc_BirthDate}
        Fill text     ${loc_BirthDate}     ${BirthDate}
    END
ModifyLanguage
    [Arguments]   ${Language}
    IF  len($Language)>0
        Click         ${loc_Language}
        Fill text     ${loc_Language}     ${Language}
    END
ModifyEmail
    [Arguments]   ${NewEmail}
    IF  len($NewEmail)>0
        Click         ${loc_Email}
        Click         ${loc_email_input}
        Fill text     ${loc_email_input}     ${NewEmail}
        Click         ${loc_continuer}
    END
ModifyConsent
    [Arguments]  ${OptinChannel}  ${Optin}
     IF  len($Optin)>0
         ${elements}=    Get Elements   ${all_consent}
        FOR    ${element}    IN    @{elements}
            Click           ${element}
            ModifyOptin           ${OptinChannel}  ${Optin}
            #ModifyOptin           ${loc_consent_first}  ${Optin}

        END
     END