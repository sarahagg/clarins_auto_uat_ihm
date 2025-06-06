*** Settings ***
Documentation       But du Test
...                 search the user's info by ccid STEP
...                 python3 -m robot    -d "Resultats/STEP/Modify" -v ENV:UAT    -i "modify" Tests

Resource            ..${/}..${/}..${/}Ressources${/}STEP${/}Common${/}a_import_all_common_STEP.resource
Library             DataDriver    file=..${/}..${/}..${/}Ressources${/}LINK${/}LinkFiles${/}link_csv_file_contact_from_${sourceSystem}_to_${oneCheckSystem}_for_createAccount.csv     encoding=utf_8

Test Template       Advanced Search
Test Teardown       Close Browser

Force Tags          STEP_FROM_STEP_6_advancedSearch


*** Test Cases ***
Default Test If No Data

*** Keywords ***
Advanced Search
     [Arguments]    ${email}
            ...    ${salutation}
            ...    ${firstName}
            ...    ${lastName}
            ...    ${phoneNumber}
            ...    ${birthDate}
            ...    ${emailOptin}
            ...    ${SMSOptin}
            ...    ${isLoyaltyMember}
            ...    ${country}

     IF    '${country}' in @{touch_countries}

        Initialize STEP Website Context
        Connect As An Existing STEP User
        Access Clarins Web UI Home Page
        Access Global Search Tab
        Access Advanced Search
        Email Attribute     ${email}
        Verify Step infos   ${email}  ${salutation}  ${firstName}  ${lastName}   ${birthDate}  ${isLoyaltyMember}  ${country}

     END