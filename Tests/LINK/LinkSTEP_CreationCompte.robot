*** Settings ***
Documentation       But du Test
...                 verifier que la création d'un compte est faite sur STEP
...                 python3 -m robot    -d "Resultats/LinkSTEP_CreationCompte/logs" -v ENV:UAT    -i "verify account" Tests

Library             DataDriver    file=..${/}..${/}Jeux de donnees${/}LINKFILES.csv
Resource            ..${/}..${/}Ressources${/}LinkSTEP_CreationCompte${/}common.resource

Test Template       Verify Account

Force Tags          verify account


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
        # $country != 'CHE' and $country != 'BNL'
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
