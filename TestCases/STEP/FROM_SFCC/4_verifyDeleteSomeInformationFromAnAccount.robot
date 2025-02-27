*** Settings ***
Documentation       But du Test
...                 verifier que suppression de la date de naissance d'un compte est faite sur STEP


Resource            ..${/}..${/}..${/}Ressources${/}STEP${/}Common${/}a_import_all_common_STEP.resource
Library             DataDriver    file=..${/}..${/}..${/}Ressources${/}LINK${/}LinkFiles${/}link_csv_file_contact_from_${sourceSystem}_to_${oneCheckSystem}_for_deleteSomeAccountInfo.csv    encoding=utf_8

Test Template       Verify Delete Some Account Info
Test Teardown       Close Browser

Force Tags          STEP_FROM_SFCC_4_verifyDeleteSomeInformationFromAnAccount


*** Test Cases ***
Default Test If No Data    NA  NA


*** Keywords ***
Verify Delete Some Account Info
    [Arguments]    ${email}
            ...    ${country}
            ...    ${lastModificationSystem}
            ...    ${lastUpdateDate}

    IF    '${country}' in @{touch_countries}

        Initialize STEP Website Context
        Connect As An Existing STEP User
        Access Clarins Web UI Home Page
        Access Global Search Tab
        Search By Email              ${email}
        Access Contact Page
        Verify empty birthDate
        Verify modification system   ${lastModificationSystem}   ${lastUpdateDate}

    END
