*** Settings ***
Documentation       But du Test
...                 Vérifier une transaction

Resource            ..${/}..${/}Ressources${/}SFCC${/}Common${/}a_import_all_common_SFCC.resource
Library             DataDriver    file=..${/}..${/}Ressources${/}SFCC${/}TestData${/}FROM_SFCC${/}5_makeTransaction.xlsx   sheet_name=Test Cases

Test Template       Make Transaction
Test Setup          Initialize Test Context
Test Teardown       Close Browser

Force Tags          SFCC_FROM_SFCC_5_transaction


*** Test Cases ***
Default Values If No Data

*** Keywords ***
Make Transaction
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

        Search For A Product     ${PRODUCT_LIST}
        Transaction popup   ${country}
        View Cart
        Order Summary Calculation
        Finalize Order

        Complete Delivery Form And Pay For loged in User
                                             ...    ${adress}
                                             ...    ${postalCode}
                                             ...    ${city}
                                             ...    ${billingAdress}
                                             ...    ${DPDdelivery}
                                             ...    ${inPostPickUp}
                                             ...    ${marketingConsent}
                                             ...    ${country}
        Verify Transaction success
        Get CLR
        Write Data To Link CSV Files    transaction            SFCC    ${allCheckSystems}    makeTransaction  ${country}
        Write Data To Link CSV Files    lastInteractionDate    SFCC    ${allCheckSystems}    makeTransaction  ${country}

        sleep  2s

    END