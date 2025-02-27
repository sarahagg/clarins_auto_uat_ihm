*** Settings ***
Documentation       But du Test
...                 verifier que la création d'un compte est faite sur STEP


Resource            ..${/}..${/}..${/}Ressources${/}STEP${/}Common${/}a_import_all_common_STEP.resource
Library             DataDriver    file=..${/}..${/}..${/}Ressources${/}LINK${/}LinkFiles${/}link_csv_file_lastInteractionDate_from_${sourceSystem}_to_${oneCheckSystem}_for_makeTransaction.csv    encoding=utf_8

Test Template       LastInteractionDate update make a purchase in sfcc
Test Teardown       Close Browser

Force Tags          4_LastInteractionDate_update_make_a_purchase_in_sfcc


*** Test Cases ***
Default Test If No Data    NO   NA   NA


*** Keywords ***
LastInteractionDate update make a purchase in sfcc
    [Arguments]    ${email}   ${country}    ${lastInteractionDate}

    IF    '${country}' in @{touch_countries}

        Initialize STEP Website Context
        Connect As An Existing STEP User
        Access Clarins Web UI Home Page
        Access Global Search Tab
        Search By Email  ${email}
        Access Contact Page
        Go To Tracking Tab
        Verify last interaction date  ${lastInteractionDate}  transaction
    END
