*** Settings ***
Documentation       But du Test
...                 Vérifier une transaction

Resource            ..${/}..${/}..${/}Ressources${/}SFCC${/}Common${/}a_import_all_common_SFCC.resource
Library             DataDriver    file=..${/}..${/}..${/}Ressources${/}SFCC${/}TestData${/}FROM_SFCC${/}5_makeTransaction.xlsx   sheet_name=Test Cases

Test Template       Make Guest Transaction
Test Setup          Initialize Test Context
Test Teardown       Close Browser

Force Tags          SFCC_FROM_SFCC_6_guest


*** Test Cases ***
Default Values If No Data

*** Keywords ***
Make Guest Transaction
    [Arguments]
     ...    ${playTest}
    ...    ${email}
    ...    ${salutation}
    ...    ${firstName}
    ...    ${lastName}
    ...    ${password}
    ...    ${birthDate}
    ...    ${emailOptin}
    ...    ${SMSOptin}
    ...    ${isLoyaltyMember}
    ...    ${address}
    ...    ${postalCode}
    ...    ${city}
    ...    ${phoneNumber}
    ...    ${billingAdress}
    ...    ${DPDdelivery}
    ...    ${inPostPickUp}
    ...    ${marketingConsent}
    ...    ${country}
    ...    ${allCheckSystems}
    ...    ${productList}
    ...    ${expectedpoints}

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

    Generate Test Data Transaction
                                             ...    ${address}
                                             ...    ${postalCode}
                                             ...    ${city}
                                             ...    ${billingAdress}
                                             ...    ${DPDdelivery}
                                             ...    ${inPostPickUp}
                                             ...    ${marketingConsent}
                                             ...    ${productList}
                                             ...    ${expectedpoints}
    Generate Test Data Last Interaction Date      transaction
    Initialize SFCC Website Context
    Search For A Product
    Add Chosen Product To Cart
    View Cart
    Finalize Order
    Connect As A Guest
    Complete Delivery Form For Guest User
    Complete Payment Form
    Verify Transaction success
    Store transaction number
    Write Data To Link CSV Files    transaction            SFCC    ${allCheckSystems}    makeGuestTransaction
    Write Data To Link CSV Files    lastInteractionDate    SFCC    ${allCheckSystems}    makeGuestTransaction
    sleep  3s

    END