*** Settings ***
Documentation       all the keywords needed to navigate on the left menu

Resource            ..${/}..${/}Common${/}a_import_all_common_STEP.resource


*** Keywords ***
Access Global Search Tab
    Click    ${leftMenu_globalSearch_tab}
