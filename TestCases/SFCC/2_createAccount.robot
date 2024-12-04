*** Settings ***
Documentation       But du Test
...                 Vérifier la création d'un nouveau compte

Resource            ..${/}..${/}Ressources${/}SFCC${/}Common${/}a_import_all_common_SFCC.resource
Library             DataDriver    file=..${/}..${/}Ressources${/}SFCC${/}TestData${/}2_createAccount.xlsx    sheet_name=Test Cases

Test Template       Create a new account
Test Teardown       Close Browser

Force Tags          newaccount


*** Test Cases ***
Default Values If No Data    NO


*** Keywords ***
Create A New Account
    [Arguments]
    ...    ${playTest}
    ...    ${email}
    ...    ${salutation}
    ...    ${firstName}
    ...    ${lastName}
    ...    ${password}
    ...    ${phoneNumber}
    ...    ${birthDate}
    ...    ${emailOptin}
    ...    ${SMSOptin}
    ...    ${isLoyaltyMember}
    ...    ${country}

    IF    $playTest == "YES"

        Initialize Test Context    ${country}
        Open Browser And Go To Home Page    ${country}
        Wait And Close All Popups   ${country}
        Go To Login Page
        Connect As A New User    ${email}
        Complete Registration Form
        ...                         ${salutation}
        ...                         ${firstName}
        ...                         ${lastName}
        ...                         ${password}
        ...                         ${phoneNumber}
        ...                         ${birthDate}
        ...                         ${emailOptin}
        ...                         ${SMSOptin}
        ...                         ${isLoyaltyMember}
        ...                         ${country}

    END
