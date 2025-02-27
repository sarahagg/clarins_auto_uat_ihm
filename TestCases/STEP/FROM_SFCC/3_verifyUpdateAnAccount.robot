*** Settings ***
Documentation       But du Test
...                 Modify the user's info on STEP
...                 python3 -m robot    -d "Resultats/STEP/Modify" -v ENV:UAT    -i "modify" Tests

Resource            ..${/}..${/}..${/}Ressources${/}STEP${/}Common${/}a_import_all_common_STEP.resource
Library             DataDriver    file=..${/}..${/}..${/}Ressources${/}LINK${/}LinkFiles${/}link_csv_file_contact_from_${sourceSystem}_to_${oneCheckSystem}_for_UpdateAccount.csv    encoding=utf_8

Test Template       Verify Update Account
Test Teardown       Close Browser

Force Tags          STEP_FROM_SFCC_3_verifyUpdateAnAccount


*** Test Cases ***
Default Test If No Data    NO  NA  NA  NA  NA  NA  NA  NA  NA  NA

*** Keywords ***
Verify Update Account
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
            ...    ${lastModificationSystem}
            ...    ${lastUpdateDate}

    IF    '${country}' in @{touch_countries}

        Initialize STEP Website Context
        Connect As An Existing STEP User
        Access Clarins Web UI Home Page
        Access Global Search Tab
        Search By Email               ${email}
        Access Contact Page
        Verify email                  ${email}
        Verify salutation             ${salutation}
        Verify firstName              ${firstName}
        Verify lastName               ${lastName}
        verify phoneNumber            ${phoneNumber}              ${country}
        Verify birthDate              ${birthDate}
        verify isLoyaltyMember        ${isLoyaltyMember}
        Verify country                ${country}
        Verify modification system    ${lastModificationSystem}   ${lastUpdateDate}
    END
