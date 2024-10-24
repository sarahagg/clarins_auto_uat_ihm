*** Settings ***
Documentation       But du Test
...                 Créer un nouveau compte sur SFCC et mettre les données dans un datadriver LINKFILESCREATE.csv
...                 python3 -m robot    -d "Resultats/LinkSFCC_CreationCompte/logs" -v ENV:UAT    -i "Link SFCC" Tests

Resource            ..${/}..${/}Ressources${/}LINK${/}LinkSFCC_NewAccount${/}common.resource
Library             DataDriver    file=..${/}..${/}Jeux de donnees${/}SFCC${/}NewAccount${/}jdd-New-account.xlsx

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
    ...    ${checkSystems}

    IF    $playTest == "YES"
        Authentificate and close all popups    ${country}
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

        Write Data      ${generated_data}    ${checkSystems}
        sleep    5s
        Close Browser
    END
