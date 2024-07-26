*** Settings ***
Documentation       all the keywords needed to verify a user's information on STEP
Resource            ..${/}..${/}..${/}Ressources${/}STEP${/}Common${/}common.resource

*** Keywords ***
IsSomething
    [Arguments]     ${var}

    Click    ${loc_${var}_history}
    ${Get${var}}=                           Get Text                                ${loc_${var}}
    ${var}=                              Set Variable                            ${var}
    Should Contain             ${var}           ${Get${var}}
    Click    ${loc_${var}_history}
