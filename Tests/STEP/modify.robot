*** Settings ***
Documentation       But du Test
...                 Modify the user's info on STEP
...                 python3 -m robot    -d "Resultats/STEP/Modify" -v ENV:UAT    -i "modify" Tests

Resource            ..${/}..${/}Ressources${/}STEP${/}Common${/}common.resource
Library             DataDriver    file=..${/}..${/}Jeux de donnees${/}STEP${/}jdd-Modify.xlsx

Test Template       Update Step Data

Force Tags          modify


*** Test Cases ***
Default Test If No Data


*** Keywords ***
Update Step Data
    [Arguments]
    ...    ${playTest}
    ...    ${Email}
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

    IF    $playTest == "YES"
        Authentificate
        Access Contact Page    ${Email}
        Update fields in Step
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
        Sleep    5s
        Close Browser
    END
