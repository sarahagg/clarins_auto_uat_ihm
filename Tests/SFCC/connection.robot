*** Settings ***
Documentation       But du Test
...                 Vérifier que la connexion se passe bien sur SFCC
...                 python3 -m robot    -d "Resultats/Connection/logs" -v ENV:UAT    -i "Connection" Tests

Resource            ..${/}..${/}Ressources${/}SFCC${/}Common${/}common.resource
Library             DataDriver    file=..${/}..${/}Jeux de donnees${/}SFCC${/}Connection${/}jdd-Connection.xlsx

Test Template       Connect to an existing account

Force Tags          connection


*** Test Cases ***
Default Test If No Data


*** Keywords ***
Connect to an existing account
    [Arguments]    ${playTest}    ${Email}    ${mypassword}    ${country}    ${regions}
    IF    $playTest == "YES"
        Authentificate and close all popups    ${country}    ${regions}
        Connect A User    ${Email}    ${mypassword}    ${country}    ${regions}
        sleep    5s
        close browser
    END
