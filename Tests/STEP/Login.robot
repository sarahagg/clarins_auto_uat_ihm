*** Settings ***
Force Tags          login
Documentation       But du Test
...                 Se connecter sur STEP
...                 python3 -m robot  -d "Resultats/STEP/login" -v ENV:UAT  -i "login" Tests
Resource            ..${/}..${/}Ressources${/}STEP${/}Common${/}common.resource
Library             DataDriver      file=..${/}..${/}Jeux de donnees${/}STEP${/}jdd-Modification.xlsx
Test Template       Connect to STEP

*** Test Cases ***
Test Par Defaut Si Aucune Donnee

*** Keywords ***

Connect to STEP
    [Arguments]    ${Email}
     Authentificate   ${Email}
     #Modify
     Sleep    5s
     Close Browser