*** Settings ***
Documentation       But du Test
...                 verifier que la création d'un compte est faite sur STEP
...                 python3 -m robot    -d "Resultats/LinkSTEP_CreationCompte/logs" -v ENV:UAT    -i "verify account" Tests

Library             DataDriver    file=..${/}..${/}Jeux de donnees${/}LINKFILENEWACCOUNT_STEP.csv
Resource            ..${/}..${/}Ressources${/}LinkSTEP_NewAccount${/}common.resource

Test Template       Verify Account

Force Tags          link-step new-account


*** Test Cases ***
Default Test If No Data


*** Keywords ***
Verify Account
    [Arguments]
    ...    ${FirstName}
    ...    ${LastName}
    ...    ${Email}
    ...    ${BirthDate}
    ...    ${country}
    ...    ${salutation}
    ...    ${regions}
    ...    ${emailOption}
    ...    ${isLoyaltyMember}

    IF    '${country}' in @{touch_countries}

        Authentificate
        access contact page    ${Email}
        VerifyLINK
        ...    ${FirstName}
        ...    ${LastName}
        ...    ${Email}
        ...    ${BirthDate}
        ...    ${country}
        ...    ${salutation}
        ...    ${regions}
        ...    ${emailOption}
        ...    ${isLoyaltyMember}
        Sleep    5s
        Close Browser
    END
