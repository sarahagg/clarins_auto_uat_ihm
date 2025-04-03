*** Settings ***
Documentation       But du Test
...                 Vérifier une transaction

Resource            ..${/}..${/}Ressources${/}SFCC${/}Common${/}a_import_all_common_SFCC.resource
Library             DataDriver    file=..${/}..${/}Ressources${/}SFCC${/}TestData${/}FROM_SFCC${/}5_makeTransaction.xlsx   sheet_name=Test Cases

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
    ...    ${PRODUCT_LIST}
    ...    ${email}
    ...    ${salutation}
    ...    ${firstName}
    ...    ${lastName}
    ...    ${password}
    ...    ${birthDate}
    ...    ${emailOptin}
    ...    ${SMSOptin}
    ...    ${isLoyaltyMember}
    ...    ${adress}
    ...    ${postalCode}
    ...    ${city}
    ...    ${phoneNumber}
    ...    ${billingAdress}
    ...    ${DPDdelivery}
    ...    ${inPostPickUp}
    ...    ${marketingConsent}
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
        Generate Test Data Transaction
        Generate Test Data Last Interaction Date      transaction

        Initialize SFCC Website Context
        Go To Login Page
        Connect As A New SFCC User
        Complete Registration Form
        Verify Account Creation
        Verify Correct Loyalty
        ##verify in CLM  (i didnt find ARE in programme de fidélité)
        ##verify in STEP
        sleep  2s

    END