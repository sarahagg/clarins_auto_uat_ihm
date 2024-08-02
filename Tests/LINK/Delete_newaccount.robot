*** Settings ***
Documentation       But du Test
...                 Supprimer le fichier CVS généré par SFCC
...                 python3 -m robot    -d "Resultats/Delete/logs" -v ENV:UAT    -i "Delete CSV" Tests

Resource            ..${/}..${/}Ressources${/}LinkSFCC_CreationCompte${/}common.resource

Force Tags          delete new-account csv


*** Test Cases ***

Delete NewAccount CSV
    Remove File    ${csv_file_Newaccount}
