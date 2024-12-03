*** Settings ***
Documentation       But du Test
...                 Vérifier que la création d'un nouveau compte se passe bien
...                 python3 -m robot    -d "Resultats/New-account/logs" -v ENV:UAT    -i "New-account" Tests

Resource            ..${/}..${/}Ressources${/}SFCC${/}Common${/}common.resource
Library             DataDriver    file=..${/}..${/}Jeux de donnees${/}SFCC${/}NewAccount${/}jdd-New-account.xlsx

Test Template       Create a new account

Force Tags          newaccount


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

        log    ${generated_data}

        Close Browser
    END
