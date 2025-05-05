*** Settings ***
Documentation       But du Test
...                 Vérifier une transaction

Resource            ..${/}..${/}Ressources${/}SFCC${/}Common${/}a_import_all_common_SFCC.resource
Library             DataDriver    file=..${/}..${/}Ressources${/}SFCC${/}TestData${/}FROM_SFCC${/}5_makeTransaction.xlsx   sheet_name=Test Cases

Test Template       S2 Earn Loyalty Points
Test Setup          Initialize Test Context
Test Teardown       Close Browser

Force Tags          S2 Earn Loyalty Points
*** Variables ***
&{updated}    email=test@example.com    firstName=Alice    lastName=Smith

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


    IF    $playTest == "YES"

        Generate Test Data connection
                                        ...    ${email}
                                        ...    ${country}
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
        Generate Test Data Transaction
                                             ...    ${address}
                                             ...    ${postalCode}
                                             ...    ${city}
                                             ...    ${billingAdress}
                                             ...    ${DPDdelivery}
                                             ...    ${inPostPickUp}
                                             ...    ${marketingConsent}
                                             ...    ${country}
                                             ...    ${productList}
                                             ...    ${expectedpoints}

        Update Test Data    contact  &{updated}



    END
