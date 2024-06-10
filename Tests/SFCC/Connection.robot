*** Settings ***
Force Tags          Connection
Documentation       But du Test
...                 Vérifier que la connexion se passe bien
...                 python3 -m robot  -d "Resultats/Connection/logs" -v ENV:UAT  -i "Connection" Tests
Library             DataDriver      file=..${/}..${/}Jeux de donnees${/}SFCC${/}Connection${/}jdd-Connection.xlsx
Resource            ..${/}..${/}Ressources${/}SFCC${/}Common${/}common.resource
Test Template       Connect to an existing account

*** Test Cases ***
Test Par Defaut Si Aucune Donnee


*** Keywords ***
Connect to an existing account
    [Arguments]   ${playTest}    ${Email}     ${mypassword}  ${country}
    IF    $playTest == "YES"
        Authentificate and accept cookies    ${country}
        connect a user     ${Email}        ${mypassword}     ${country}
        sleep   5s
        close browser
    END