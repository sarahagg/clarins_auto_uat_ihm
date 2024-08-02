*** Settings ***
Documentation       all the keywords needed to authentificate and accept the cookiesResource

Resource            ..${/}..${/}Ressources${/}LinkCLM_CreationCompte${/}Common${/}common.resource
# Resource    /Users/s.aggour/Library/CloudStorage/OneDrive-ONEPOINT/Clarins/clarins-auto-uat-ihm/Ressources/LinkCLM_CreationCompte/Common/common.resource


*** Keywords ***
Search Email CLM
    [Arguments]    ${Email}

    Click    ${email_arrow}
    Fill text    ${email_search_input}    ${Email}
    Click    ${email_search_button}
    Click    ${first_email}
    sleep    1s

Verify CLM
    [Arguments]
    ...    ${FirstName}
    ...    ${LastName}
    ...    ${BirthDate}
    ...    ${country}
    ...    ${salutation}
    ...    ${regions}
    ...    ${emailOption}

    ${GetFirstName}=    Get Text    ${first_name_loc}
    Should Contain    ${FirstName}    ${GetFirstName}

    ${GetLastName}=    Get Text    ${Last_Name_loc}
    Should Contain    ${LastName}    ${GetLastName}

    ${GetBirthDate}=    Get Text    ${BirthDate_loc}
    ${GetBirthDateFormatted}=    Convert Date    ${GetBirthDate}    result_format=%Y-%m-%d    date_format=%d/%m/%Y
    Should Be Equal    ${BirthDate}    ${GetBirthDateFormatted}
