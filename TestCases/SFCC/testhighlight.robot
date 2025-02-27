*** Settings ***
Documentation       But du Test
...                 Vérifier la création d'un nouveau compte

Resource            ..${/}..${/}Ressources${/}SFCC${/}Common${/}a_import_all_common_SFCC.resource
Library             DataDriver    file=..${/}..${/}Ressources${/}SFCC${/}TestData${/}FROM_SFCC${/}2_createAccount.xlsx    sheet_name=Test Cases

Test Template       highlight
Test Setup          Initialize Test Context
Test Teardown       Close Browser

Force Tags          STEP_FROM_OTHER_1_verifyContactInformation


*** Test Cases ***
 highlight


*** Keywords ***
 highlight
    IF    $playTest == "YES"
        Initialize SFCC Website Context
        Go To Login Page
    END
