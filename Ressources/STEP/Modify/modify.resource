*** Settings ***
Documentation       all the keywords needed to modify a user's information on STEP

Resource            ..${/}..${/}..${/}Ressources${/}STEP/Common${/}common.resource


*** Keywords ***
Update fields in Step
    [Arguments]
    ...    ${IsGuest}
    ...    ${gender}
    ...    ${salutation}
    ...    ${FirstName}
    ...    ${localFirstName}
    ...    ${LastName}
    ...    ${localLastName}
    ...    ${BirthDate}
    ...    ${Language}
    ...    ${Nationality}
    ...    ${IsLoyaltyMember}
    ...    ${NewEmail}
    ...    ${OptinChannel}
    ...    ${Optin}
    ...    ${phoneNumber}
    ...    ${phoneType}

    ModifyIsGuest    ${IsGuest}
    ModifyGender    ${Gender}
    ModifySalutation    ${salutation}
    ModifyFirstName    ${FirstName}
    ModifyLastName    ${LastName}
    ModifyBirthDate    ${BirthDate}
    ModifyLanguage    ${Language}
    ModifyIsLoyaltyMember    ${IsLoyaltyMember}
    ModifyEmail    ${NewEmail}
    ModifyConsent    ${OptinChannel}    ${Optin}
    ModifyPhoneInfos    ${phoneNumber}    ${phoneType}
    ##Create and delete
    CreateConsent    ${loc_consent_first}    ${Optin}
    log    consent created
    DeleteConsent
    log    consent deleted

    # Click ${loc_save}
