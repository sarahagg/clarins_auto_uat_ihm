*** Settings ***
Force Tags          Connection
Documentation       But du Test
...                 Vérifier que la connexion se passe bien
...                 python3 -m robot  -d "Resultats/Connection/logs" -v ENV:UAT  -i "Connection" Tests
Resource            ..${/}..${/}Ressources${/}Common${/}common.resource

