*** Settings ***
Documentation       All the keywords to generate test data for the test case createAccount
Resource    ..${/}Common${/}a_import_all_common_SFCC.resource
*** Keywords ***
Update Dictionary Values

     [Arguments]    ${format}    &{update_data}

    Run Keyword Unless    '${format}' in ['contact', 'transaction', 'last_interaction_date']    Fail    Format canonique invalide : ${format}

    ${dictionary_name}=    Set Variable    canonical_form_${format}_link_files
    ${original_dict}=    Get Variable Value    &{${dictionary_name}}

    FOR    ${key}    ${value}    IN    &{update_data}
        Set To Dictionary    ${original_dict}    \${${key}}=${value}
    END

    [Return]    ${original_dict}
