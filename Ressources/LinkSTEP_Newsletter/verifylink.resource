*** Settings ***
Documentation       all the keywords needed to verify a user's information on STEP

Resource            ..${/}..${/}Ressources${/}LinkSTEP_Newsletter${/}common.resource


*** Keywords ***
Verify LINK Newsletter
    [Arguments]    ${Email}

    Mouse Button    down

    ${GetEmail}=    Get Text    ${loc_Email}
    Should Contain    ${Email}    ${GetEmail}
