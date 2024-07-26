*** Settings ***
Force Tags          Delete-CVS
Documentation       But du Test
...                 Vérifier que la création d'un nouveau compte se passe bien
...                 python3 -m robot  -d "Resultats/New-account/logs" -v ENV:UAT  -i "Delete-CVS" Tests
Library             DataDriver      file=..${/}..${/}Jeux de donnees${/}LINKFILES.csv
Resource            ..${/}..${/}Ressources${/}LINKSFCC${/}common.resource
Test Template       Delete CSV

*** Test Cases ***
Test Par Defaut Si Aucune Donnee

*** Keywords ***

Delete CSV
    Clear CSV File   ${csv_file}
