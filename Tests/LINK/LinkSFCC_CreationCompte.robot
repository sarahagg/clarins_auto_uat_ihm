*** Settings ***
Documentation       But du Test
...                 Créer un nouveau compte sur SFCC et mettre les données dans un datadriver LINKFILESCREATE.csv
...                 python3 -m robot    -d "Resultats/LinkSFCC_CreationCompte/logs" -v ENV:UAT    -i "Link SFCC" Tests

Library             DataDriver    file=..${/}..${/}Jeux de donnees${/}SFCC${/}New-account${/}jdd-New-account.xlsx
Resource            ..${/}..${/}Ressources${/}LinkSFCC_CreationCompte${/}common.resource

Test Template       Link SFCC

Force Tags          link-sfcc new-account


*** Test Cases ***
Default Test If No Data


*** Keywords ***
Link SFCC
    [Arguments]
    ...    ${playTest}
    ...    ${FirstName}
    ...    ${LastName}
    ...    ${Email}
    ...    ${mypassword}
    ...    ${BirthDate}
    ...    ${country}
    ...    ${emailOption}
    ...    ${isLoyaltyMember}
    ...    ${salutation}
    ...    ${regions}
    ...    ${checkSystems}

    IF    $playTest == "YES"
        Authentificate and accept cookies    ${country}    ${regions}
        sleep    1s
        ${generated_data}=    Create account
        ...    ${FirstName}
        ...    ${LastName}
        ...    ${Email}
        ...    ${mypassword}
        ...    ${BirthDate}
        ...    ${country}
        ...    ${emailOption}
        ...    ${isLoyaltyMember}
        ...    ${salutation}
        ...    ${regions}

        Write Data      ${generated_data}    ${checkSystems}
        sleep    5s
        Close Browser
    END
