*** Settings ***
Documentation       all the keywords needed to navigate on the Login Page

Resource            ..${/}Common${/}a_import_all_common_SFCC.resource

*** Keywords ***
Connect As An Existing SFCC User
    [Arguments]    ${email}    ${password}    ${country}

    Fill text    ${loginPage_email_input}    ${email}
    Click    ${loginPage_rememberme_button}
    Click    ${loginPage_submit_email_button}

    Fill Secret    ${loginPage_connection_password_input}    $password
    Click    ${loginPage_submit_connection_button}

    Wait For Elements State    ${updateAccountPage_dashboard}    visible
    ${text}=    Get Text    ${updateAccountPage_dashboard}
    Should Be Equal    ${account_dashboard_text.${country}}    ${text}


Connect As A New SFCC User
    ${email}=    Set Variable    ${canonical_form_contact_link_files.get('\${email}')}
    Fill text       ${loginPage_email_input}    ${email}
    Click           ${loginPage_rememberme_button}
    Click           ${loginPage_submit_email_button}
