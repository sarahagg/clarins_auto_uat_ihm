*** Settings ***
Documentation       All the keywords to generate test data for the test case subscribeNewsletter

Resource    ..${/}Common${/}a_import_all_common_SFCC.resource

*** Keywords ***
Generate Test Data Newsletter
    [Arguments]    ${email}
    Import FakerLibrary    ${country}

    ${generated_email}=    Generate Email    ${email}
    ${current_date}=    Get Current Date    result_format=%Y-%m-%d %H:%M:%S

    Set To Dictionary    ${canonical_form_contact_link_files}    \${email}                     ${generated_email}
    Set To Dictionary    ${canonical_form_contact_link_files}    \${country}                   ${country}
    Set To Dictionary    ${canonical_form_contact_link_files}    \${createDate}                ${current_date}
    Set To Dictionary    ${canonical_form_contact_link_files}    \${lastUpdateDate}      ${current_date}

Generate Test Data Newsletter With Name
    [Arguments]        ${email}
                ...    ${firstName}
                ...    ${lastName}
                ...    ${birthDate}
    Import FakerLibrary    ${country}

    ${generated_email}=             Generate Email              ${email}
    ${generated_firstName}=         Generate FirstName          ${firstName}
    ${generated_lastName}=          Generate LastName           ${lastName}
    ${generated_birthDate}=         Generate BirthDate          ${birthDate}


    ${current_date}=    Get Current Date    result_format=%Y-%m-%d %H:%M:%S

    Set To Dictionary    ${canonical_form_contact_link_files}    \${email}                       ${generated_email}
    Set To Dictionary    ${canonical_form_contact_link_files}    \${firstName}                   ${generated_firstName}
    Set To Dictionary    ${canonical_form_contact_link_files}    \${lastName}                    ${generated_lastName}
    Set To Dictionary    ${canonical_form_contact_link_files}    \${birthDate}                   ${generated_birthDate}
    Set To Dictionary    ${canonical_form_contact_link_files}    \${country}                     ${country}
    Set To Dictionary    ${canonical_form_contact_link_files}    \${createDate}                  ${current_date}
    Set To Dictionary    ${canonical_form_contact_link_files}    \${lastUpdateDate}              ${current_date}
