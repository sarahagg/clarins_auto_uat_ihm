
*** Settings ***
Documentation       all the keywords needed to navigate on Create Account Page

Resource            ..${/}Common${/}a_import_all_common_SFCC.resource

*** Keywords ***
Complete Delete Some Info Form

    ${birthDate}=           Set Variable    ${canonical_form_contact_link_files.get('\${birthDate}')}
    ${country}=             Set Variable    ${canonical_form_contact_link_files.get('\${country}')}


    #Delete BIRTHDATE
    IF    '${birthDate}' != 'DEL'
        Clear Text    ${updateAccountPage_birthday_input}
        Wait For Elements State    ${updateAccountPage_birthday_date_invalid_message}    hidden
        Sleep    6s
    END

    # SUBMIT
    Click    ${updateAccountPage_submit_button}

Prepare Data Delete Some Account Info
    [Arguments]    ${email}
            ...    ${salutation}
            ...    ${firstName}
            ...    ${lastName}
            ...    ${phoneNumber}
            ...    ${birthDate}
            ...    ${emailOptin}
            ...    ${SMSOptin}
            ...    ${isLoyaltyMember}
            ...    ${country}
            ...    ${lastModificationSystem}

    ${current_date}=                Get Current Date            result_format=%Y-%m-%d %H:%M:%S

    Set To Dictionary    ${canonical_form_contact_link_files}    \${email}              ${email}
    Set To Dictionary    ${canonical_form_contact_link_files}    \${salutation}         ${salutation}
    Set To Dictionary    ${canonical_form_contact_link_files}    \${firstName}          ${firstName}
    Set To Dictionary    ${canonical_form_contact_link_files}    \${lastName}           ${lastName}
    Set To Dictionary    ${canonical_form_contact_link_files}    \${phoneNumber}        ${phoneNumber}
    Set To Dictionary    ${canonical_form_contact_link_files}    \${birthDate}          ${birthDate}
    Set To Dictionary    ${canonical_form_contact_link_files}    \${emailOptin}         ${emailOptin}
    Set To Dictionary    ${canonical_form_contact_link_files}    \${SMSOptin}           ${SMSOptin}
    Set To Dictionary    ${canonical_form_contact_link_files}    \${isLoyaltyMember}    ${isLoyaltyMember}
    Set To Dictionary    ${canonical_form_contact_link_files}    \${country}            ${country}
    Set To Dictionary    ${canonical_form_contact_link_files}    \${lastModificationSystem}      ${lastModificationSystem}
    Set To Dictionary    ${canonical_form_contact_link_files}    \${lastUpdateDate}        ${current_date}