*** Settings ***
Documentation       All the keywords to generate test data for the test case createAccount

Resource    ..${/}Common${/}a_import_all_common_SFCC.resource

*** Keywords ***
Generate Test Data Update Account
    [Arguments]    ${email}
            ...    ${salutation}
            ...    ${firstName}
            ...    ${lastName}
            ...    ${phoneNumber}
            ...    ${birthDate}
            ...    ${emailOptin}
            ...    ${SMSOptin}
            ...    ${isLoyaltyMember}
            ...    ${lastModificationSystem}

    Import FakerLibrary    ${country}

    ${generated_salutation}=        Generate Salutation         ${salutation}
    ${generated_firstName}=         Generate FirstName          ${firstName}
    ${generated_lastName}=          Generate LastName           ${lastName}
    ${generated_phoneNumber}=       Generate PhoneNumber        ${phoneNumber}
    ${generated_birthDate}=         Generate BirthDate          ${birthDate}
    ${generated_emailOptin}=        Generate emailOptin         ${emailOptin}
    ${generated_SMSOptin}=          Generate SMSOptin           ${SMSOptin}
    ${current_date}=                Get Current Date            result_format=%Y-%m-%d %H:%M:%S

    Set To Dictionary    ${canonical_form_contact_link_files}    \${email}                       ${email}
    Set To Dictionary    ${canonical_form_contact_link_files}    \${salutation}                  ${generated_salutation}
    Set To Dictionary    ${canonical_form_contact_link_files}    \${firstName}                   ${generated_firstName}
    Set To Dictionary    ${canonical_form_contact_link_files}    \${lastName}                    ${generated_lastName}
    Set To Dictionary    ${canonical_form_contact_link_files}    \${phoneNumber}                 ${generated_phoneNumber}
    Set To Dictionary    ${canonical_form_contact_link_files}    \${birthDate}                   ${generated_birthDate}
    Set To Dictionary    ${canonical_form_contact_link_files}    \${emailOptin}                  ${generated_emailOptin}
    Set To Dictionary    ${canonical_form_contact_link_files}    \${SMSOptin}                    ${generated_SMSOptin}
    Set To Dictionary    ${canonical_form_contact_link_files}    \${isLoyaltyMember}             ${isLoyaltyMember}
    Set To Dictionary    ${canonical_form_contact_link_files}    \${country}                     ${country}
    Set To Dictionary    ${canonical_form_contact_link_files}    \${lastModificationSystem}      ${lastModificationSystem}
    Set To Dictionary    ${canonical_form_contact_link_files}    \${lastUpdateDate}        ${current_date}

