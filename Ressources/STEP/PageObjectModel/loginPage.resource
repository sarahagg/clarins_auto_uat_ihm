*** Settings ***
Documentation       all the keywords needed to authentificate and access to the WebUI

Resource            ..${/}Common${/}a_import_all_common_STEP.resource


*** Keywords ***
Connect As An Existing STEP User
    Fill text    ${loginPage_username_input}    ${USERNAME}
    Fill secret    ${loginPage_password_input}    $PASSWORD
    Click    ${loginPage_login_button}

Access Clarins Web UI Home Page
    Click    ${loginPage_clarinsWebUI_button}
