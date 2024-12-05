*** Settings ***
Documentation       all the keywords needed to save the info in order to test on other systems

Resource            ..${/}Common${/}common.resource

*** Keywords ***
Write Data To Link CSV Files
    [Arguments]    ${sourceSystem}    ${allCheckSystems}    ${testScenario}

    FOR    ${oneCheckSystem}    IN    @{allCheckSystems}

        ${link_csv_file}=    Set Variable    ${path_to_link_csv_file}${/}link_csv_file_from_${sourceSystem}_to_${oneCheckSystem}_for_${testScenario}.csv

        ${file_exists}=    Run Keyword And Ignore Error    File Should Exist    ${link_csv_file}
        IF    '${file_exists}[0]' != 'PASS'
            Create CSV       ${link_csv_file}
        END

        Append row To CSV       ${sourceSystem}    ${oneCheckSystem}    ${link_csv_file}
    END

Create CSV
    [Arguments]     ${link_csv_file}

    Create File    ${link_csv_file}

    ${data_keys}=    Get Dictionary Keys    ${canonical_form_contact_link_files}   sort_keys=False

    ${headers}=    Create List   ***Test Cases***
    Append To List    ${headers}    @{data_keys}
    ${headers_string}=    Evaluate    ';'.join($headers)

    Append To File    ${link_csv_file}    ${headers_string}\n

Append row To CSV
    [Arguments]      ${sourceSystem}    ${oneCheckSystem}    ${link_csv_file}

    ${new_test_name}=    Replace String    ${TEST_NAME}    ${sourceSystem}     ${oneCheckSystem}

    ${row_strings}=      Create List
    Append To List      ${row_strings}    ${new_test_name}

    ${data_values}=    Get Dictionary Values    ${canonical_form_contact_link_files}   sort_keys=False
    FOR    ${element}    IN    @{data_values}
        ${element_string}=    Convert To String    ${element}
        Append To List    ${row_strings}    ${element_string}
    END

    Log    ${row_strings}

    ${row_string}=    Evaluate    ';'.join($row_strings)
    Append To File    ${link_csv_file}    ${row_string}\n

