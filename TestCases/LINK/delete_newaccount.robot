*** Settings ***
Documentation       But du Test
...                 Supprimer le fichier CVS généré par SFCC
...                 python3 -m robot    -d "Resultats/Delete/logs" -v ENV:UAT    -i "Delete CSV" Tests

Resource            ..${/}..${/}Ressources${/}Common${/}common.resource

Force Tags          delete new-account csv


*** Test Cases ***

Delete NewAccount CSV
    Remove File    ${csv_file_Newaccount_STEP}
    Remove File    ${csv_file_Newaccount_CLM}
    Remove File    ${csv_file_Newaccount_ADOBE}
    Remove File    ${csv_file_Newaccount_Y2}
