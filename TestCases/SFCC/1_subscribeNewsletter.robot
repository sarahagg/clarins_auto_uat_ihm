*** Settings ***
Documentation       But du Test
...                 Vérifier l'inscription à la Newsletter

Resource            ..${/}..${/}Ressources${/}SFCC${/}Common${/}a_import_all_common_SFCC.resource
Library             DataDriver    file=..${/}..${/}Ressources${/}SFCC${/}TestData${/}1_subscribeNewsletter.xlsx    sheet_name=Test Cases

Test Template       Subscribe To The Newsletter
Test Teardown       Close Browser

Force Tags          newsletter


*** Test Cases ***
Default Values If No Data    NO    NA    NA


*** Keywords ***
Subscribe To The Newsletter
    [Arguments]    ${playTest}    ${email}    ${country}

    IF    $playTest == "YES"
        Initialize Test Context    ${country}
        Open Browser And Go To Home Page    ${country}
        Wait And Close All Popups
        ${generated_data}=    Access And Complete Newsletter Form    ${email}    ${country}
        Check Newsletter Subscription    ${country}
    END
