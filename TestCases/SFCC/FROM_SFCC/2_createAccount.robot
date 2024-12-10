*** Settings ***
Documentation       But du Test
...                 Vérifier la création d'un nouveau compte

Resource            ..${/}..${/}..${/}Ressources${/}SFCC${/}Common${/}a_import_all_common_SFCC.resource
Library             DataDriver    file=..${/}..${/}..${/}Ressources${/}SFCC${/}TestData${/}FROM_SFCC${/}2_createAccount.xlsx    sheet_name=Test Cases

Test Template       Create A New Account
Test Setup          Initialize Test Context
Test Teardown       Close Browser

Force Tags          STEP_FROM_OTHER_1_verifyContactInformation


*** Test Cases ***
Default Values If No Data    NO


*** Keywords ***
Create A New Account
    [Arguments]
    ...    ${playTest}
    ...    ${email}
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
    ...    ${allCheckSystems}

    IF    $playTest == "YES"

        Generate Test Data Create Account
                                        ...    ${email}
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

        Initialize SFCC Website Context
        Go To Login Page
        Connect As A New SFCC User
        Complete Registration Form
        Verify Account Creation

        Write Data To Link CSV Files    contact    SFCC    ${allCheckSystems}    createAccount

    END
