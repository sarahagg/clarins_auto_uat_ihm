*** Settings ***
Documentation       all the keywords needed to navigate on the Login Page

Resource            ..${/}Common${/}a_import_all_common_SFCC.resource

*** Keywords ***
Connect As A User
    [Arguments]    ${email}    ${password}    ${country}

    Fill text    ${loginPage_email_input}    ${email}
    Click    ${loginPage_rememberme_button}
    Click    ${loginPage_submit_email_button}

    Fill Secret    ${loginPage_connection_password_input}    $password
    Click    ${loginPage_submit_connection_button}

    Wait For Elements State    ${createAccountPage_dashboard}    visible
    ${text}=    Get Text    ${createAccountPage_dashboard}
    Should Be Equal    ${creation_text.${country}}    ${text}

