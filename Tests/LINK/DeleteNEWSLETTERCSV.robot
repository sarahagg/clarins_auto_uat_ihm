*** Settings ***
Documentation       But du Test
...                 Supprimer le fichier CVS généré par SFCC
...                 python3 -m robot    -d "Resultats/Delete/logs" -v ENV:UAT    -i "Delete Newsletter CSV" Tests

Library             DataDriver    file=..${/}..${/}Jeux de donnees${/}LINKFILES.csv
Resource            ..${/}..${/}Ressources${/}LinkSFCC_NEWSLETTER${/}common.resource

Test Template       Delete Newsletter CSV

Force Tags          delete newsletter csv


*** Test Cases ***
Default Test If No Data


*** Keywords ***
Delete Newsletter CSV
    Clear CSV File    ${csv_file_Newsletter}
