*** Settings ***
Documentation       All the keywords to generate test data for the test case createAccount

Resource    ..${/}Common${/}a_import_all_common_SFCC.resource

*** Keywords ***
Generate Test Data Create Account
    [Arguments]    ${email}
            ...    ${salutation}
            ...    ${firstName}
            ...    ${lastName}
            ...    ${password}
            ...    ${phoneNumber}
            ...    ${birthDate}
            ...    ${emailOptin}
            ...    ${SMSOptin}
            ...    ${isLoyaltyMember}
            ...    ${country}

    Import FakerLibrary    ${country}

    ${generated_email}=             Generate Email          ${email}
    ${generated_salutation}=        Generate Salutation     ${salutation}    ${country}
    ${generated_firstName}=         Generate FirstName      ${firstName}
    ${generated_lastName}=          Generate LastName       ${lastName}
    ${generated_password}=          Generate Password       ${password}
    ${generated_phoneNumber}=       Generate PhoneNumber    ${phoneNumber}
    ${generated_birthDate}=         Generate BirthDate      ${birthDate}

    Set To Dictionary    ${canonical_form_contact_link_files}    \${email}              ${generated_email}
    Set To Dictionary    ${canonical_form_contact_link_files}    \${salutation}         ${generated_salutation}
    Set To Dictionary    ${canonical_form_contact_link_files}    \${firstName}          ${generated_firstName}
    Set To Dictionary    ${canonical_form_contact_link_files}    \${lastName}           ${generated_lastName}
    Set To Dictionary    ${canonical_form_contact_link_files}    \${password}           ${generated_password}
    Set To Dictionary    ${canonical_form_contact_link_files}    \${phoneNumber}        ${generated_phoneNumber}
    Set To Dictionary    ${canonical_form_contact_link_files}    \${birthDate}          ${generated_birthDate}
    Set To Dictionary    ${canonical_form_contact_link_files}    \${emailOptin}         ${emailOptin}
    Set To Dictionary    ${canonical_form_contact_link_files}    \${SMSOptin}           ${SMSOptin}
    Set To Dictionary    ${canonical_form_contact_link_files}    \${isLoyaltyMember}    ${isLoyaltyMember}
    Set To Dictionary    ${canonical_form_contact_link_files}    \${country}            ${country}
