*** Settings ***
Documentation       But du Test
...                 Vérifier l'inscription à    la Newsletter
...                 python3 -m robot    -d "Resultats/Newsletter/logs" -v ENV:UAT    -i "Newsletter" Tests

Resource            ..${/}..${/}Ressources${/}SFCC${/}Common${/}common.resource
Library             DataDriver    file=..${/}..${/}Jeux de donnees${/}SFCC${/}Newsletter${/}jdd-Newsletter.xlsx    sheet_name=Test Cases

Test Template       Create a newsletter

Force Tags          newsletter


*** Test Cases ***
Default Test If No Data


*** Keywords ***
Create a newsletter
    [Arguments]    ${playTest}    ${Email}    ${country}

    IF    $playTest == "YES"
        Authentificate and close all popups    ${country}
        Subscribe to Newsletter    ${Email}    ${country}
        Close Browser
    END
