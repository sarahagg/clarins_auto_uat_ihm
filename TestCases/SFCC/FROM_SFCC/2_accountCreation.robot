*** Settings ***
Documentation       But du Test
...                 Vérifier la création d'un nouveau compte

Resource            ..${/}..${/}..${/}Ressources${/}SFCC${/}Common${/}a_import_all_common_SFCC.resource
Library             DataDriver    file=..${/}..${/}..${/}Ressources${/}SFCC${/}TestData${/}FROM_SFCC${/}2_createAccount.xlsx    sheet_name=Test Cases

Test Template       Create A New Account
Test Setup          Initialize Test Context
Test Teardown       Terminate Test Context

Force Tags          SFCC_FROM_SFCC_2_accountCreation


*** Test Cases ***
Default Values If No Data    NO  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA  NA

*** Keywords ***
Create A New Account
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

        Generate Test Data Create Account
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
                                        ...    sfcc
        Generate Test Data Last Interaction Date      contactProfileUpdate

        Initialize SFCC Website Context
        Go To Login Page
        Connect As A New SFCC User
        Complete Registration Form
        Verify Account Creation

        Write Data To Link CSV Files    contact                SFCC    ${allCheckSystems}    createAccount
        Write Data To Link CSV Files    lastInteractionDate    SFCC    ${allCheckSystems}    createAccount
    END
