*** Settings ***
Documentation       all the keywords needed to authentificate and access to the WebUI

Resource            ..${/}Common${/}a_import_all_common_CLM.resource


*** Keywords ***
Connect As An Existing CLM User
    Fill text    ${loginPage_username_input}    ${USERNAME}
    Fill secret    ${loginPage_password_input}    $PASSWORD
    Click    ${loginPage_login_button}

    Wait For Elements State    ${homePage_findAccount_title}    visible
