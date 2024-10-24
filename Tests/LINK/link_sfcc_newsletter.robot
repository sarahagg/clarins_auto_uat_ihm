*** Settings ***
Documentation       But du Test
...                 S'inscrire à une Newsletter sur SFCC et mettre les données dans un datadriver LINKFILESNEWSLETTER.csv
...                 python3 -m robot    -d "Resultats/LinkSFCC_Newsletter/logs" -v ENV:UAT    -i "link-sfcc newsletter" Tests

Resource            ..${/}..${/}Ressources${/}LinkSFCC_Newsletter${/}common.resource
Library             DataDriver    file=..${/}..${/}Jeux de donnees${/}SFCC${/}Newsletter${/}jdd-Newsletter.xlsx    sheet_name=Test Cases

Test Template       Link SFCC Newsletter

Force Tags          link-sfcc newsletter


*** Test Cases ***
Default Test If No Data


*** Keywords ***
Link SFCC Newsletter
    [Arguments]    ${playTest}    ${Email}    ${country}   ${checkSystems}

    IF    $playTest == "YES"
        Authentificate and close all popups    ${country}
        sleep    1s
        ${generated_data_newsletter}=    Subscribe to Newsletter    ${Email}    ${country}
        Write Data Newsletter     ${generated_data_newsletter}    ${checkSystems}
        sleep    5s
        Close Browser
    END
