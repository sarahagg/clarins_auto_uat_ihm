*** Settings ***
Force Tags          Newsletter
Documentation       But du Test
...                 Vérifier que la Newsletter se passe bien
...                 python3 -m robot  -d "Resultats/Newsletter/logs" -v ENV:UAT  -i "Newsletter" Tests
Library             DataDriver      file=..${/}..${/}..${/}Jeux de données${/}SFCC${/}Newsletter${/}jdd_Newsletter.xlsx   sheet_name=Test Cases
Resource            ..${/}..${/}..${/}Ressources${/}SFCC${/}Common${/}common.resource
Test Template       Create a newsletter

*** Test Cases ***
Test Par Defaut Si Aucune Donnee


*** Keywords ***
Create a newsletter
    [Arguments]   ${playTest}    ${Email}    ${country}
     IF    $playTest == "YES"
        Authentificate and accept cookies          ${country}
        Inscription a la newsletter                ${Email}  ${country}
        sleep   5s
        close browser
     END