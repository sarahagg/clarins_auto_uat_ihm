*** Settings ***
Documentation       But du Test
...                 Vérifier une transaction

Resource            ..${/}..${/}Ressources${/}SFCC${/}Common${/}a_import_all_common_SFCC.resource
Library             DataDriver    file=..${/}..${/}Ressources${/}SFCC${/}TestData${/}FROM_SFCC${/}2_createAccount.xlsx   sheet_name=Test Cases

Test Template       S1 Enrollment and Loyalty Account
Test Setup          Initialize Test Context
Test Teardown       Close Browser

Force Tags          S1 Enrollment and Loyalty Account


*** Test Cases ***
Default Values If No Data

*** Keywords ***
S1 Enrollment and Loyalty Account
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


        Generate Test Data Last Interaction Date      contactProfileUpdate
        Initialize SFCC Website Context
        Go To Login Page
        Connect As A New SFCC User
        Complete Registration Form
        Write Data To Link CSV Files    contact                SFCC    ${allCheckSystems}    createAccount

        Verify Account Creation
        Verify Contact Loyalty Status

        ##7. Go to CLM NCC, go to the member's customer card by typing their name in the search bar and go to the "Points & Counters" and "Points Balance" sections (i didnt find ARE in programme de fidélité)
        ##8. Go to STEP and check that the loyalty member can be found (please note that it can take a bit of time for the information to propagate - up to 2 hours)
        sleep  2s

    END