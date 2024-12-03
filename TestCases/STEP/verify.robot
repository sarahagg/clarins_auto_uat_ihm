*** Settings ***
Documentation       But du Test
...                 Comparer les infos step et SFCC
...                 python3 -m robot    -d "Resultats/STEP/Verify" -v ENV:UAT    -i "verify" Tests

Resource            ..${/}..${/}Ressources${/}STEP${/}Common${/}common.resource
Library             DataDriver    file=..${/}..${/}Jeux de donnees${/}STEP${/}jdd-Verify.xlsx

Test Template       Compare STEP data

Force Tags          verify


*** Test Cases ***
Default Test If No Data


*** Keywords ***
Compare STEP data
    [Arguments]
    ...    ${playTest}
    ...    ${ClarinscontactID}
    ...    ${Brand}
    ...    ${Country}
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
    ...    ${isRegistered}
    ...    ${IsLoyaltyMember}
    ...    ${isAnonymized}
    ...    ${isFrozen}
    ...    ${Email}

    IF    $playTest == "YES"
        Authentificate
        Access Contact Page    ${Email}
        Compare fields
        ...    ${ClarinscontactID}
        ...    ${Brand}
        ...    ${Country}
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
        ...    ${isRegistered}
        ...    ${IsLoyaltyMember}
        ...    ${isAnonymized}
        ...    ${isFrozen}
        ...    ${Email}
        Sleep    5s
        Close Browser
    END
