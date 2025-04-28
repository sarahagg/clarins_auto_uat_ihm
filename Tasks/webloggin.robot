*** Settings ***
Documentation       But du Test
...                 Vérifier la modification d'un compte

Resource            ..${/}..${/}Ressources${/}SFCC${/}Common${/}a_import_all_common_SFCC.resource
Library             DataDriver    file=..${/}..${/}Ressources${/}SFCC${/}TestData${/}FROM_SFCC${/}3_updateAccount.xlsx    sheet_name=Test Cases    encoding=utf_8

Test Template       Webloggin
Test Setup          Initialize Test Context
Test Teardown       Close Browser

Force Tags          SFCC_webloggin


*** Test Cases ***
Default Values If No Data

*** Keywords ***
Webloggin
    [Arguments]
    ...    ${playTest}
    ...    ${email}
    ...    ${country}
    ...    ${allCheckSystems}

    IF    $playTest == "YES"

        Generate Test Data connection
                                        ...    ${email}
                                        ...    ${country}
        Generate Test Data Last Interaction Date    websiteLogin

        Initialize SFCC Website Context
        Connect As An Existing SFCC User
        Write Data To Link CSV Files    lastInteractionDate    SFCC    ${allCheckSystems}    webloggin  ${country}
        sleep  3s
    END