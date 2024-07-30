*** Settings ***
Documentation       But du Test
...                 Supprimer le fichier CVS généré par SFCC
...                 python3 -m robot    -d "Resultats/Delete/logs" -v ENV:UAT    -i "Delete CSV" Tests

Library             DataDriver    file=..${/}..${/}Jeux de donnees${/}LINKFILES.csv
Resource            ..${/}..${/}Ressources${/}LinkSFCC_CreationCompte${/}common.resource

Test Template       Delete NewAccount CSV

Force Tags          Delete NewAccount CSV


*** Test Cases ***
Default Test If No Data


*** Keywords ***
Delete NewAccount CSV
    Clear CSV File    ${csv_file}
