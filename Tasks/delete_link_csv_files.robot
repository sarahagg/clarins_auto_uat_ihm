*** Settings ***
Documentation       But de la tâche
...                 Supprimer les fichiers CSV générés
...                 qui font le lien entre les systèmes sources et cibles

Resource            ..${/}Ressources${/}Common${/}common.resource

Force Tags          delete_link_csv_files


*** Tasks ***
Delete LINK CSV Files
    @{files_to_delete}=    List Files In Directory    ${path_to_link_csv_file}    pattern=*.csv
    IF    len($files_to_delete) > 0
        FOR   ${file}    IN    @{files_to_delete}
            Remove File     ${path_to_link_csv_file}${/}${file}
        END
    END

