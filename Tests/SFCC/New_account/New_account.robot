*** Settings ***
Force Tags          New_account
Documentation       But du Test
...                 Vérifier que la création d'un nouveau compte se passe bien
...                 python3 -m robot  -d "Resultats/New_account/logs" -v ENV:UAT  -i "New_account" Tests
Library             DataDriver      file=..${/}..${/}..${/}Jeux de données${/}SFCC${/}New_account${/}jdd_New_account.xlsx
Resource            ..${/}..${/}..${/}Ressources${/}SFCC${/}Common${/}common.resource
Test Template       Create a new account
*** Test Cases ***
Test Par Defaut Si Aucune Donnee

*** Keywords ***
Create a new account
    [Arguments]   ${playTest}   ${FirstName}     ${LastName}     ${Email}      ${mypassword}   ${BirthDate}  ${country}   ${emailOption}    ${isLoyaltyMember}   ${salutation}

    IF    $playTest == "YES"
        Authentificate and accept cookies   ${country}
        Creation de compte   ${FirstName}     ${LastName}     ${Email}        ${mypassword}   ${BirthDate}   ${country}    ${emailOption}    ${isLoyaltyMember}    ${salutation}
        sleep   5s
        close browser
    END