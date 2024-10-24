*** Settings ***
Documentation       But du Test
...                 verifier que l'inscription à la newsletter est faite sur STEP
...                 python3 -m robot    -d "Resultats/LinkSTEP_Newsletter/logs" -v ENV:UAT    -i "verify account newsletter" Tests

Resource            ..${/}..${/}Ressources${/}LinkSTEP_Newsletter${/}common.resource
Library             DataDriver    file=..${/}..${/}Jeux de donnees${/}LINKFILENEWSLETTER_STEP.csv

Test Template       Verify Account Newsletter

Force Tags          link-step newsletter


*** Test Cases ***
Default Test If No Data


*** Keywords ***
Verify Account Newsletter
    [Arguments]    ${Email}    ${country}

    IF    '${country}' in @{touch_countries}
        Authentificate
        Access Contact Page    ${Email}
        Verify LINK Newsletter    ${Email}    ${country}
        Sleep    5s
        Close Browser
    END
