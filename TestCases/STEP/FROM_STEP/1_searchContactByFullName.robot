*** Settings ***
Documentation       But du Test
...                 search the user's info by full name STEP
...                 python3 -m robot    -d "Resultats/STEP/Modify" -v ENV:UAT    -i "modify" Tests

Resource            ..${/}..${/}..${/}Ressources${/}STEP${/}Common${/}a_import_all_common_STEP.resource
Library             DataDriver    file=..${/}..${/}..${/}Ressources${/}LINK${/}LinkFiles${/}link_csv_file_contact_from_${sourceSystem}_to_${oneCheckSystem}_for_createAccount.csv     encoding=utf_8

Test Template       Search Contact By Full Name
Test Teardown       Close Browser

Force Tags          STEP_FROM_STEP_1_SearchContactByFullName


*** Test Cases ***
Default Test If No Data

*** Keywords ***
Search Contact By Full Name
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
        Search By Full Name  ${lastName}  ${firstName}
        Access Contact Page
        Verify Step infos   ${email}  ${salutation}  ${firstName}  ${lastName}   ${birthDate}  ${isLoyaltyMember}  ${country}

     END