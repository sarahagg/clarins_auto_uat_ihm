*** Settings ***
Documentation       all the keywords needed to navigate on the Login Page

Resource            ..${/}Common${/}a_import_all_common_SFCC.resource

*** Keywords ***
fill Login Form
    [Arguments]    ${email}

    Fill text    ${loginPage_email_input}                    ${email}
    Click        ${loginPage_rememberme_button}
    Click        ${loginPage_submit_email_button}

    Fill Secret    ${loginPage_connection_password_input}    $email
    Click          ${loginPage_submit_connection_button}
