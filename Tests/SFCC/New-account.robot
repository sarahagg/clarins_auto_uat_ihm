*** Settings ***
Documentation       But du Test
...                 Vérifier que la création d'un nouveau compte se passe bien
...                 python3 -m robot    -d "Resultats/New-account/logs" -v ENV:UAT    -i "New-account" Tests

Library             DataDriver    file=..${/}..${/}Jeux de donnees${/}SFCC${/}New-account${/}jdd-New-account.xlsx
Resource            ..${/}..${/}Ressources${/}SFCC${/}Common${/}common.resource

Test Template       Create a new account

Force Tags          new-account


*** Test Cases ***
Default Test If No Data


*** Keywords ***
Create a new account
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
    IF    $playTest == "YES"
        Authentificate and accept cookies    ${country}
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
        log    ${generated_data}
        Close Browser
    END
