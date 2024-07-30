*** Settings ***
Documentation       But du Test
...                 S'inscrire à une Newsletter sur SFCC et mettre les données dans un datadriver LINKFILESNEWSLETTER.csv
...                 python3 -m robot    -d "Resultats/LinkSFCC_Newsletter/logs" -v ENV:UAT    -i "link-sfcc newsletter" Tests

Library             DataDriver    file=..${/}..${/}Jeux de donnees${/}SFCC${/}Newsletter${/}jdd-Newsletter.xlsx    sheet_name=Test Cases
Resource            ..${/}..${/}Ressources${/}LinkSFCC_Newsletter${/}common.resource

Test Template       Link SFCC Newsletter

Force Tags          link-sfcc newsletter


*** Test Cases ***
Default Test If No Data


*** Keywords ***
Link SFCC Newsletter
    [Arguments]    ${playTest}    ${Email}    ${country}    ${regions}

    IF    $playTest == "YES"
        Authentificate and accept cookies    ${country}
        sleep    1s
        ${generated_data_newsletter}=    Subscribe to Newsletter    ${Email}    ${country}    ${regions}
        Write Data Newsletter    ${CSV_FILE_newsletter}    ${generated_data_newsletter}
        sleep    5s
        Close Browser
    END
