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
    ...    ${productList}
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
    ...    ${expectedpoints}

    ${country} =  Set Test Variable    ${country}

    IF    $playTest == "YES"

        Generate Test Data connection
                                             ...    ${email}
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
        #########################################1 .. As a member, logged in to your account
        Go To Login Page
        Connect As An Existing SFCC User
        #########################################2 ..Perform a transaction and finalize the payment (when finalizing the payment, you can click on the "Calculate" button to see how much points the members will earn) - please perform a transaction of less than 250 AED
        Search For A Product
        Wait And Close Transaction Gift Popup
        View Cart
        Click Calculate And See Points
        #########################################3 .. choose the shipping fees and finalise the order
        Finalize Order
        Complete Delivery Form
        Complete Payment Form
        Verify Transaction success
        #Store transaction number
        #########################################4 ..In SFCC, go to the "My points recap" section and verify that the transaction with the points earned are displayed (please note the points balance will be updated once the pending period has passed).
        #Verify my points recap in SFCC
        #########################################5 ..Connect to CLM NCC, and go to "Activity History" > "Transactions" sections, and check that the transaction has been propagated and that the loyalty member has earned points.

       # Write Data To Link CSV Files    transaction            SFCC    ${allCheckSystems}    makeTransaction
       # Write Data To Link CSV Files    lastInteractionDate    SFCC    ${allCheckSystems}    makeTransaction
        sleep  2s

    END