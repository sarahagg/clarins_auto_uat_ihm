*** Settings ***
Documentation       all the keywords needed to navigate on the Home Page

Resource            ..${/}Common${/}a_import_all_common_SFCC.resource

*** Keywords ***
Go To My Profile
    Click    ${myDashboardPage_edit_profile_button}

Verify Account Creation
    Sleep    2s
    IF  $country != 'DEU'
        ${return_status}=   Check If Element Is Visible And Warn If Not    ${myDashboardPage_dashboard_title}
        WHILE    $return_status == 'FAIL'    limit=${number_of_retry_to_wait_an_element}    on_limit=pass
            Log    Waiting dashboard title to appear
            ${return_status}=   Check If Element Is Visible And Warn If Not    ${myDashboardPage_dashboard_title}
        END

        IF    $return_status == 'PASS'
            ${text}=    Get Text    ${myDashboardPage_dashboard_title}
            Should Be Equal    ${account_dashboard_text.${country}}    ${text}
            Log      Account created
        END
    END

Verify Contact Loyalty Status
    ${isLoyaltyMember}=     Set Variable    ${canonical_form_contact_link_files.get('\${isLoyaltyMember}')}
    IF  $isLoyaltyMember == 'YES'
        ${text}=     Get Text    ${myDashboardPage_loyalty_status_value}
        Should Be Equal      ${text}    Member
    ELSE
        ${text}=     Get Text    ${myDashboardPage_loyalty_status_value}
        Should Be Equal      ${text}    Non Member
    END

Verify my points recap in SFCC
    ${expectedpoints} =             Set Variable    ${canonical_form_transaction_link_files.get('\${expectedpoints}')}
    Hover     ${headerMenu_login_button}
    Wait For Elements State    ${headerMenu_myAccount_popup_menu}    visible
    click  ${headerMenu_my_points_recap_button}
    # missing the display part in the website cuz it waits for the pending period to be over
    Verify my points calculate     ${expectedpoints}    ${currentPointsSFCCRecap}



