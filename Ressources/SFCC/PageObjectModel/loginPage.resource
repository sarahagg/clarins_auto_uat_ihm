*** Settings ***
Documentation       all the keywords needed to navigate on the Login Page

Resource            ..${/}Common${/}a_import_all_common_SFCC.resource

*** Keywords ***
Connect As A New SFCC User
    ${email}=    Set Variable    ${canonical_form_contact_link_files.get('\${email}')}
    Fill text       ${loginPage_email_input}    ${email}
    Click           ${loginPage_rememberme_button}
    Click           ${loginPage_submit_email_button}

Connect As An Existing SFCC User
    [Arguments]    ${email}     ${country}

    fill Login Form            ${email}

    Wait For Elements State    ${myDashboardPage_dashboard_title}    visible
    ${text}=    Get Text       ${myDashboardPage_dashboard_title}
    Should Be Equal            ${account_dashboard_text.${country}}    ${text}

