*** Settings ***
Documentation       But du Test
...                 Vérifier l'inscription à la Newsletter

Resource            ..${/}..${/}..${/}Ressources${/}SFCC${/}Common${/}a_import_all_common_SFCC.resource
Library             DataDriver    file=..${/}..${/}..${/}Ressources${/}SFCC${/}TestData${/}FROM_SFCC${/}1_subscribeNewsletter.xlsx    sheet_name=Test Cases

Test Template       Subscribe To The Newsletter
Test Setup          Initialize Test Context
Test Teardown       Close Browser

Force Tags          SFCC_FROM_SFCC_1_subscribeNewsletter


*** Test Cases ***
Default Values If No Data    NO    NA    NA


*** Keywords ***
Subscribe To The Newsletter
    [Arguments]    ${playTest}    ${email}    ${country}    ${allCheckSystems}

    IF    $playTest == "YES"

        Generate Test Data Newsletter    ${email}    ${country}

        Initialize SFCC Website Context
        Access And Complete Newsletter Form
        Verify Newsletter Subscription

        Write Data To Link CSV Files    SFCC    ${allCheckSystems}    subscribeNewsletter

    END
