*** Settings ***
Force Tags          Newsletter
Documentation       But du Test
...                 Vérifier que la Newsletter se passe bien
...                 python3 -m robot  -d "Resultats/Newsletter/logs" -v ENV:UAT  -i "Newsletter" Tests
Resource            ..${/}..${/}Ressources${/}Common${/}common.resource

