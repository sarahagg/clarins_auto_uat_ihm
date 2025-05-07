*** Settings ***
Documentation       All the keywords to generate test data for the test case createAccount
Resource    ..${/}Common${/}a_import_all_common_SFCC.resource
*** Keywords ***

Update Test Data
    [Arguments]    ${update_data}

   # Run Keyword Unless    '${update_data.canonical_format}' in ['contact', 'transaction', 'last_interaction_date']    Fail    Format canonique invalide : ${update_data.canonical_format}
    IF   $update_data.canonical_format in ['contact', 'transaction', 'last_interaction_date']
        FOR    ${key}    ${value}    IN    &{update_data}
            Set To Dictionary    ${canonical_form_${update_data.canonical_format}_link_files}    \${${key}}=${value}
        END
    END