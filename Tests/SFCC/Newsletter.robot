*** Settings ***
Documentation       But du Test
...                 Vérifier l'inscription à    la Newsletter
...                 python3 -m robot    -d "Resultats/Newsletter/logs" -v ENV:UAT    -i "Newsletter" Tests

Library             DataDriver    file=..${/}..${/}Jeux de donnees${/}SFCC${/}Newsletter${/}jdd-Newsletter.xlsx    sheet_name=Test Cases
Resource            ..${/}..${/}Ressources${/}SFCC${/}Common${/}common.resource

Test Template       Create a newsletter

Force Tags          newsletter


*** Test Cases ***
Default Test If No Data


*** Keywords ***
Create a newsletter
    [Arguments]    ${playTest}    ${Email}    ${country}    ${regions}

    IF    $playTest == "YES"
        Authentificate and accept cookies    ${country}
        Subscribe to Newsletter    ${Email}    ${country}    ${regions}
        sleep    5s
        close browser
    END
