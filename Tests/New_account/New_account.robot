*** Settings ***
Force Tags          New_account
Documentation       But du Test
...                 Vérifier que la création d'un nouveau compte se passe bien
...                 python3 -m robot  -d "Resultats/New_account/logs" -v ENV:UAT  -i "New_account" Tests
Library             DataDriver      file=..${/}..${/}Jeux de données${/}New_account${/}jdd_New_account.xlsx     sheet_name=Test Cases
Resource            ..${/}..${/}Ressources${/}Common${/}common.resource
