*** Settings ***
Documentation       all the keywords needed to authentificate and accept the cookiesResource

Resource            ..${/}..${/}..${/}Common${/}a_import_all_common_CLM.resource


*** Keywords ***
Verify Details Info Customer Personal Data
    [Arguments]    ${email}
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

    IF    '${firstName}' != '${EMPTY}'
        ${GetFirstName}=    Get Text    ${detailsInfo_customer_personalData_firstName_value}
        Should Contain    ${firstName}    ${GetFirstName}
    END

    IF    '${lastName}' != '${EMPTY}'
        ${GetLastName}=    Get Text    ${detailsInfo_customer_personalData_lastName_value}
        Should Contain    ${lastName}    ${GetLastName}
    END

    IF    '${birthDate}' != '${EMPTY}'
        ${GetBirthDate}=    Get Text    ${detailsInfo_customer_personalData_birthDate_value}
        ${GetBirthDateFormatted}=    Convert Date    ${GetBirthDate}    result_format=%Y-%m-%d    date_format=%d/%m/%Y
        Should Be Equal    ${birthDate}    ${GetBirthDateFormatted}
    END