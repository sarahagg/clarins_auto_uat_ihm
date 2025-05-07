
*** Settings ***
Documentation       all the keywords needed to navigate on Create Account Page

Resource            ..${/}Common${/}a_import_all_common_SFCC.resource

*** Keywords ***
Complete Delete Some Info Form

    ${birthDate}=           Set Variable    ${canonical_form_contact_link_files.get('\${birthDate}')}
    IF    '${birthDate}' != 'DEL'
        Clear Text    ${updateAccountPage_birthday_input}
        Wait For Elements State    ${updateAccountPage_birthday_date_invalid_message}    hidden
        Sleep    6s
    END

    # SUBMIT
    Click    ${updateAccountPage_submit_button}

