*** Settings ***
Documentation       all the keywords needed to change the loyalty program

Resource            ..${/}..${/}Common${/}a_import_all_common_CLM.resource


*** Keywords ***
Change Fidelity Program To
    [Arguments]    ${country}
    Click    ${changeLoyaltyProgramPopup_programChoice_select}
    Click    ${changeLoyaltyProgramPopup_programChoice_option.replace('$COUNTRY_ALPHA3$','${country}')}
    Click    ${changeLoyaltyProgramPopup_confirm_button}
