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

        Generate Test Data connection
                                        ...    ${email}
                                        ...    ${country}
        Generate Test Data Transaction
                                             ...    ${adress}
                                             ...    ${postalCode}
                                             ...    ${city}
                                             ...    ${billingAdress}
                                             ...    ${DPDdelivery}
                                             ...    ${inPostPickUp}
                                             ...    ${marketingConsent}
                                             ...    ${country}
                                             ...    ${PRODUCT_LIST}
                                             ...    ${expectedpoints}

        Generate Test Data Last Interaction Date      transaction
        Initialize SFCC Website Context
        Connect As An Existing SFCC User

        ### make the transaction
        Search For A Product
        Wait And Close Transaction Gift Popup
        View Cart

        #Click Calculate And Verify Calculation

        Click Calculate And See Points
        Finalize Order
        Complete Delivery And Payment For Logged In User
        Verify Transaction success
        Store transaction number

        ## make sure the points count is correct on SFCC
        Verify my points recap in SFCC
        #5. Connect to CLM NCC, and go to "Activity History" > "Transactions" sections, and check that the transaction has been propagated and that the loyalty member has earned points.



        Write Data To Link CSV Files    transaction            SFCC    ${allCheckSystems}    makeTransaction  ${country}
        # supprimer la LID
        Write Data To Link CSV Files    lastInteractionDate    SFCC    ${allCheckSystems}    makeTransaction  ${country}
        sleep  2s

    END