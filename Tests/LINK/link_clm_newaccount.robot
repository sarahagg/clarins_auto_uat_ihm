*** Settings ***
Documentation       But du Test
...                 Verifier que les comptes qui sont loyalty member se trouvent sur CLM
...                 python3 -m robot    -d "Resultats/LinkCLM_CreationCompte/logs" -v ENV:UAT    -i "Link CLM" Tests

Library             DataDriver    file=..${/}..${/}Jeux de donnees${/}LINKFILENEWACCOUNT_CLM.csv
Resource            ..${/}..${/}Ressources${/}LinkCLM_NewAccount${/}common${/}common.resource

Test Template       LinkCLM_CreationCompte

Force Tags          link-clm new-account


*** Test Cases ***
Default Test If No Data


*** Keywords ***
LinkCLM_CreationCompte
    [Arguments]
    ...    ${FirstName}
    ...    ${LastName}
    ...    ${Email}
    ...    ${BirthDate}
    ...    ${country}
    ...    ${salutation}
    ...    ${emailOption}
    ...    ${isLoyaltyMember}

    IF    $isLoyaltyMember == 'YES'
        Authentificate CLM
        Access Contact Page CLM    ${country}
        Search Email CLM    ${Email}
        Verify CLM
        ...    ${FirstName}
        ...    ${LastName}
        ...    ${BirthDate}
        ...    ${country}
        ...    ${salutation}
        ...    ${emailOption}
        # Sleep    5s
        Close Browser
    END
