*** Settings ***
Documentation       But du Test
...                 verifier que la création d'un compte est faite sur STEP


Resource            ..${/}..${/}..${/}Ressources${/}STEP${/}Common${/}a_import_all_common_STEP.resource
Library             DataDriver    file=..${/}..${/}..${/}Ressources${/}LINK${/}LinkFiles${/}link_csv_file_contact_from_${sourceSystem}_to_${oneCheckSystem}_for_subscribeNewsletter.csv    encoding=utf_8

Test Template       Verify Newsletter Information
Test Teardown       Close Browser

Force Tags          STEP_FROM_SFCC_1_VerifyNewsletterOfferPage


*** Test Cases ***
Default Test If No Data    NO  NA  NA  NA  NA  NA  NA  NA  NA  NA


*** Keywords ***
Verify Newsletter Information
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
            ...    ${creationSystem}
            ...    ${createDate}
            ...    ${lastModificationSystem}
            ...    ${lastUpdateDate}

    IF    '${country}' in @{touch_countries}

        Initialize STEP Website Context
        Connect As An Existing STEP User
        Access Clarins Web UI Home Page
        Access Global Search Tab
        Search By Email             ${email}
        Access Contact Page
        Verify email                ${email}
        Verify country              ${country}
        Verify creation system      ${creationSystem}  ${createDate}
        Verify modification system  ${lastModificationSystem}  ${lastUpdateDate}
    END
