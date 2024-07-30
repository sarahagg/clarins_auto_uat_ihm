*** Settings ***
Documentation       But du Test
...                 verifier que l'inscription à la newsletter est faite sur STEP
...                 python3 -m robot    -d "Resultats/LinkSTEP_Newsletter/logs" -v ENV:UAT    -i "verify account newsletter" Tests

Library             DataDriver    file=..${/}..${/}Jeux de donnees${/}LINKFILESNEWSLETTER.csv
Resource            ..${/}..${/}Ressources${/}LinkSTEP_Newsletter${/}common.resource

Test Template       Verify Account Newsletter

Force Tags          verify account newsletter


*** Test Cases ***
Default Test If No Data


*** Keywords ***
Verify Account Newsletter
    [Arguments]    ${Email}    ${country}

    IF    '${country}' in @{touch_countries}
        # $country != 'CHE' and $country != 'BNL'
        Authentificate
        access contact page    ${Email}
        Verify LINK Newsletter    ${Email}
        Sleep    5s
        Close Browser
    END
