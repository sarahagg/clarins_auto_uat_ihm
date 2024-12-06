*** Settings ***
Documentation       But du Test
...                 verifier que la création d'un compte est faite sur STEP


Resource            ..${/}..${/}..${/}Ressources${/}STEP${/}Common${/}a_import_all_common_STEP.resource
Library             DataDriver    file=..${/}..${/}..${/}Ressources${/}LINK${/}LinkFiles${/}link_csv_file_from_${sourceSystem}_to_${oneCheckSystem}_for_${testScenario}.csv    encoding=utf_8

Test Template       Verify Contact Information
Test Teardown       Close Browser

Force Tags          STEP_FROM_OTHER_1_verifyContactInformation


*** Test Cases ***
Default Test If No Data    NO


*** Keywords ***
Verify Contact Information
    [Arguments]    ${email}
            ...    ${salutation}
            ...    ${firstName}
            ...    ${lastName}
            ...    ${password}
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
        Search Contact And Access Contact Page    ${email}
        # Access Contact Tab

        Verify Contact Info    ${email}
                        ...    ${salutation}
                        ...    ${firstName}
                        ...    ${lastName}
                        ...    ${password}
                        ...    ${phoneNumber}
                        ...    ${birthDate}
                        ...    ${emailOptin}
                        ...    ${SMSOptin}
                        ...    ${isLoyaltyMember}
                        ...    ${country}
    END
