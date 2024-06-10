*** Settings ***
Force Tags          Newsletter
Documentation       But du Test
...                 Vérifier que la Newsletter se passe bien
...                 python3 -m robot  -d "Resultats/Newsletter/logs" -v ENV:UAT  -i "Newsletter" Tests
Library             DataDriver      file=..${/}..${/}Jeux de donnees${/}SFCC${/}Newsletter${/}jdd-Newsletter.xlsx   sheet_name=Test Cases
Resource            ..${/}..${/}Ressources${/}SFCC${/}Common${/}common.resource
Test Template       Create a newsletter

*** Test Cases ***
Test Par Defaut Si Aucune Donnee


*** Keywords ***
Create a newsletter
    [Arguments]   ${playTest}    ${Email}    ${country}    ${regions}

     IF    $playTest == "YES"
        Authentificate and accept cookies          ${country}
        Inscription a la newsletter                ${Email}  ${country}  ${regions}
        sleep   5s
        close browser
     END