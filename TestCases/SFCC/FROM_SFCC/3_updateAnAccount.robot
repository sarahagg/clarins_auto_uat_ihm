*** Settings ***
Documentation       But du Test
...                 Vérifier la modification d'un compte

Resource            ..${/}..${/}..${/}Ressources${/}SFCC${/}Common${/}a_import_all_common_SFCC.resource
Library             DataDriver    file=..${/}..${/}..${/}Ressources${/}SFCC${/}TestData${/}FROM_SFCC${/}3_updateAccount.xlsx    sheet_name=Test Cases

Test Template       Update SFCC Account
Test Setup          Initialize Test Context
Test Teardown       Close Browser

Force Tags          SFCC_FROM_SFCC_3_updateAnAccount


*** Test Cases ***
Default Values If No Data

*** Keywords ***
Update SFCC Account
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

    ${country} =  Set Test Variable    ${country}
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
                                        ...    sfcc
        Generate Test Data Last Interaction Date      contactProfileUpdate

        Initialize SFCC Website Context
        Go To Login Page
        Connect As An Existing SFCC User
        Go To My Profile
        Complete Update Form
        sleep  5s
       # Verify Account Update

        Write Data To Link CSV Files    contact                SFCC    ${allCheckSystems}    updateAccount
        Write Data To Link CSV Files    lastInteractionDate    SFCC    ${allCheckSystems}    updateAccount
        sleep  3s
    END