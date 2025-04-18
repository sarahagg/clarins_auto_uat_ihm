*** Settings ***
Documentation       But du Test
...                 Vérifier une transaction

Resource            ..${/}..${/}Ressources${/}SFCC${/}Common${/}a_import_all_common_SFCC.resource
Library             DataDriver    file=..${/}..${/}Ressources${/}SFCC${/}TestData${/}FROM_SFCC${/}5_makeTransaction.xlsx   sheet_name=Test Cases

Test Template       S2 Earn Loyalty Points
Test Setup          Initialize Test Context
Test Teardown       Close Browser

Force Tags          S2 Earn Loyalty Points

*** Test Cases ***
Default Values If No Data

*** Keywords ***
S2 Earn Loyalty Points
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
    ...    ${expectedpoints}


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
        Connect As An Existing SFCC User    ${email}     ${country}

        ### make the transaction
        Search For A Product     ${PRODUCT_LIST}
        Transaction popup   ${country}
        View Cart
        #Order Summary Calculation
        See Points And Calculate
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

        ## make sure the points count is correct on SFCC
        Verify my points recap in SFCC      ${expectedpoints}
        #5. Connect to CLM NCC, and go to "Activity History" > "Transactions" sections, and check that the transaction has been propagated and that the loyalty member has earned points.



        Write Data To Link CSV Files    transaction            SFCC    ${allCheckSystems}    makeTransaction  ${country}
        Write Data To Link CSV Files    lastInteractionDate    SFCC    ${allCheckSystems}    makeTransaction  ${country}
        sleep  2s

    END