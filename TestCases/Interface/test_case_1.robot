*** Settings ***

Resource            ${EXECDIR}${/}Ressources${/}SFCC${/}Common${/}a_import_all_common_SFCC.resource

Test Setup          Initialize Test Context

Test Teardown       Terminate Test Context


*** Test Cases ***

Test Case

    ${playTest}=    Set Variable    YES

    IF    $playTest == "YES"

        &{update_data}=    Create Dictionary

        ${email}=    Set Variable    Dionyz9z6dzvu@qq.com

        ${update_data}[email]=    Set Variable    ${email}

        ${country}=    Set Variable    SVK

        ${update_data}[country]=    Set Variable    ${country}


        Generate Test Data Connection    ${email}  ${country}

        Initialize SFCC Website Context

        Go To Login Page

        Connect As An Existing SFCC User


        &{update_data}=    Create Dictionary

        @{productList}=    Split String    80103084:1  separator=,

        @{productList}=    Create List     @{productList}

        ${update_data}[productList]=    Set Variable    ${productList}

        ${canonical_format}=    Set Variable    transaction

        ${update_data}[canonical_format]=    Set Variable    ${canonical_format}


        Update Test Data    ${update_data}

        #Search For A Product

        #Wait And Close Transaction Gift Popup

        View Cart


        &{update_data}=    Create Dictionary

        ${address}=    Set Variable    Hlavná 15

        ${update_data}[address]=    Set Variable    ${address}

        ${postalCode}=    Set Variable    81101


        ${update_data}[postalCode]=    Set Variable    ${postalCode}

        ${city}=    Set Variable    Bratislava

        ${update_data}[city]=    Set Variable    ${city}

        ${billingAddress}=    Set Variable    YES

        ${update_data}[billingAddress]=    Set Variable    ${billingAddress}

        ${DPDdelivery}=    Set Variable    YES

        ${update_data}[DPDdelivery]=    Set Variable    ${DPDdelivery}

        ${inPostPickUp}=    Set Variable    YES

        ${update_data}[inPostPickUp]=    Set Variable    ${inPostPickUp}

        ${marketingConsent}=    Set Variable    YES

        ${update_data}[marketingConsent]=    Set Variable    ${marketingConsent}

        ${canonical_format}=    Set Variable    transaction

        ${update_data}[canonical_format]=    Set Variable    ${canonical_format}

        Finalize Order

        Update Test Data    ${update_data}

        Complete Delivery And Payment For Logged In User

        Verify Transaction Success

        # country needs to be set at the big
    END
