*** Settings ***
Documentation       But du Test
...                 Vérifier la suppréssion des quelques informations

Resource            ..${/}..${/}..${/}Ressources${/}SFCC${/}Common${/}a_import_all_common_SFCC.resource
Library             DataDriver    file=..${/}..${/}..${/}Ressources${/}SFCC${/}TestData${/}FROM_SFCC${/}4_deleteSomeAccountInfo.xlsx    sheet_name=Test Cases

Test Template       Delete Some Account Info
Test Setup          Initialize Test Context
Test Teardown       Close Browser

Force Tags          SFCC_FROM_SFCC_4_deleteSomeInformationFromAnAccount


*** Test Cases ***
Default Values If No Data

*** Keywords ***
Delete Some Account Info
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

        Prepare Data Delete Some Account Info
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
        Generate Test Data Last Interaction Date      contactProfileUpdate
        Initialize SFCC Website Context
        Go To Login Page
        Connect As An Existing SFCC User    ${email}     ${country}
        Go To My Profile
        Complete Delete Some Info Form
        Verify Account Update

        Write Data To Link CSV Files    contact                SFCC    ${allCheckSystems}    deleteSomeAccountInfo  ${country}
        Write Data To Link CSV Files    lastInteractionDate    SFCC    ${allCheckSystems}    deleteSomeAccountInfo  ${country}

        sleep  3s

    END