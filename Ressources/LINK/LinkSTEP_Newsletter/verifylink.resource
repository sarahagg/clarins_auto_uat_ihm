*** Settings ***
Documentation       all the keywords needed to verify a user's information on STEP

Resource            common.resource


*** Keywords ***
Verify LINK Newsletter
    [Arguments]    ${Email}    ${country}

    Mouse Button    down

    ${GetEmail}=    Get Text    ${loc_Email}
    Should Contain    ${Email}    ${GetEmail}

    ${GetCountry}=    Get Text    ${loc_Country}
    Should Contain    ${full_country.${country}}    ${GetCountry}
