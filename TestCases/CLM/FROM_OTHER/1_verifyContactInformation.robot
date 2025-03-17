*** Settings ***
Documentation       But du Test
...                 Verifier que les comptes qui sont loyalty member se trouvent dans CLM

Resource            ..${/}..${/}..${/}Ressources${/}CLM${/}Common${/}a_import_all_common_CLM.resource
Library             DataDriver    file=..${/}..${/}..${/}Ressources${/}LINK${/}LinkFiles${/}link_csv_file_contact_from_${sourceSystem}_to_${oneCheckSystem}_for_${testScenario}.csv    encoding=utf_8
                                    #    link_csv_file_contact_from_${sourceSystem}_to_${oneCheckSystem}_for_createAccount.csv
Test Template       Verify Contact Information
Test Teardown       Close Browser

Force Tags          CLM_FROM_OTHER_1_verifyContactInformation


*** Test Cases ***
Default Test If No Data    NO


*** Keywords ***
Verify Contact Information
    [Arguments]    ${email}
            ...    ${salutation}
            ...    ${firstName}
            ...    ${lastName}
            ...    ${phoneNumber}
            ...    ${birthDate}
            ...    ${emailOptin}
            ...    ${SMSOptin}
            ...    ${isLoyaltyMember}
            ...    ${country}

    IF    $isLoyaltyMember == 'YES'
        Initialize CLM Website Context
        Connect As An Existing CLM User
        Access Change Fidelity Program Popup
        Change Fidelity Program To    ${country}
        Search Account By Email    ${email}
        # Access Details Info Customer Personal Data
        
        Verify Details Info Customer Personal Data
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

    END
