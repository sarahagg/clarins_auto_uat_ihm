*** Settings ***

Resource            ${EXECDIR}${/}Ressources${/}SFCC${/}Common${/}a_import_all_common_SFCC.resource

Test Setup          Initialize Test Context

Test Teardown       Terminate Test Context


*** Test Cases ***

Test Case

    ${playTest}=    Set Variable    YES

    IF    $playTest == "YES"

        &{update_data}=    Create Dictionary

        ${email}=    Set Variable    testIHM1@qq.com

        ${update_data}[email]=    Set Variable    ${email}

        ${salutation}=    Set Variable    Mr

        ${update_data}[salutation]=    Set Variable    ${salutation}

        ${firstName}=    Set Variable    toto

        ${update_data}[firstName]=    Set Variable    ${firstName}

        ${lastName}=    Set Variable    tata

        ${update_data}[lastName]=    Set Variable    ${lastName}

        ${phoneNumber}=    Set Variable    auto

        ${update_data}[phoneNumber]=    Set Variable    ${phoneNumber}

        ${birthDate}=    Set Variable    auto

        ${update_data}[birthDate]=    Set Variable    ${birthDate}

        ${emailOptin}=    Set Variable    YES

        ${update_data}[emailOptin]=    Set Variable    ${emailOptin}

        ${smsOptin}=    Set Variable    YES

        ${update_data}[smsOptin]=    Set Variable    ${smsOptin}

        ${isLoyaltyMember}=    Set Variable

        ${update_data}[isLoyaltyMember]=    Set Variable    ${isLoyaltyMember}

        ${country}=    Set Variable    ROU

        ${country}=    Set Test Variable    ${country}

        ${update_data}[country]=    Set Variable    ${country}

        Generate Test Data Create Account    ${email}  ${salutation}  ${firstName}  ${lastName}  ${phoneNumber}  ${birthDate}  ${emailOptin}  ${SMSOptin}  ${isLoyaltyMember}  ${country}

        Initialize SFCC Website Context

        Go To Login Page

        Connect As A New SFCC User

        Complete Registration Form

        Verify Account Creation

        Verify Contact Loyalty Status


    END
