*** Settings ***
Documentation       But du Test
...                 Supprimer le fichier CVS généré par SFCC
...                 python3 -m robot    -d "Resultats/Delete/logs" -v ENV:UAT    -i "Delete Newsletter CSV" Tests

Resource            ..${/}..${/}Ressources${/}LinkSFCC_Newsletter${/}common.resource

Force Tags          delete newsletter csv


*** Test Cases ***

Delete Newsletter CSV
       Remove File    ${csv_file_Newsletter_STEP}
       Remove File    ${csv_file_Newsletter_ADOBE}
