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
    ...    ${salutation}
    ...    ${firstName}
    ...    ${lastName}
    ...    ${phoneNumber}
    ...    ${birthDate}
    ...    ${emailOptin}
    ...    ${SMSOptin}
    ...    ${isLoyaltyMember}
    ...    ${country}
    ...    ${allCheckSystems}

    IF    $playTest == "YES"

        Generate Test Data Update Account
                                        ...    ${email}
                                        ...    ${salutation}
                                        ...    ${firstName}
                                        ...    ${lastName}
                                        ...    ${phoneNumber}
                                        ...    ${birthDate}
                                        ...    ${emailOptin}
                                        ...    ${SMSOptin}
                                        ...    ${isLoyaltyMember}
                                        ...    ${country}
                                        ...    sfcc
        Generate Test Data Last Interaction Date    websiteLogin

        Initialize SFCC Website Context
        Go To Login Page
        Connect As An Existing SFCC User    ${email}     ${country}
        Write Data To Link CSV Files    lastInteractionDate    SFCC    ${allCheckSystems}    webloggin  ${country}
        sleep  3s
    END