*** Settings ***
Documentation       all the keywords needed to save the info in order to test on other systems

Resource            ..${/}Common${/}common.resource

*** Keywords ***
Write Data To Link CSV Files
    [Arguments]    ${format}    ${sourceSystem}    ${allCheckSystems}    ${testScenario}    ${country}

    FOR    ${oneCheckSystem}    IN    @{allCheckSystems}

        ${link_csv_file}=    Set Variable    ${path_to_link_csv_file}${/}link_csv_file_${format}_from_${sourceSystem}_to_${oneCheckSystem}_for_${testScenario}.csv
        #${link_csv_file}=   Set Variable    ${path_to_link_csv_file}${/}link_csv_file_${format}_from_${sourceSystem}_to_${oneCheckSystem}_for_${testScenario}.csv  avec format = contact,lid ou transaction

        ${file_exists}=      Run Keyword And Ignore Error    File Should Exist    ${link_csv_file}
        IF    '${file_exists}[0]' != 'PASS'
            Create CSV       ${format}    ${link_csv_file}
        END
        Append row To CSV    ${format}    ${sourceSystem}    ${oneCheckSystem}    ${link_csv_file}    ${testScenario}  ${country}
    END

Create CSV
    [Arguments]              ${format}    ${link_csv_file}

    Create File               ${link_csv_file}

    ${data_keys}=    Get Dictionary Keys    ${canonical_form_${format}_link_files}   sort_keys=False

    ${headers}=    Create List   ***Test Cases***
    Append To List    ${headers}    @{data_keys}
    ${headers_string}=    Evaluate    ';'.join($headers)

    Append To File    ${link_csv_file}    ${headers_string}\n

Append row To CSV
    [Arguments]      ${format}    ${sourceSystem}    ${oneCheckSystem}    ${link_csv_file}   ${testScenario}  ${country}

    #${new_test_name}=    Replace String    ${TEST_NAME}    ${sourceSystem}     ${oneCheckSystem}
    ${new_test_name}=  Set Variable   ${format}_from_${sourceSystem}_to_${oneCheckSystem}_for_${testScenario}_${country}

    ${row_strings}=      Create List
    Append To List      ${row_strings}    ${new_test_name}

    ${data_values}=    Get Dictionary Values    ${canonical_form_${format}_link_files}   sort_keys=False
    FOR    ${element}    IN    @{data_values}
        ${element_string}=    Convert To String    ${element}
        Append To List    ${row_strings}    ${element_string}
    END

    ${row_string}=    Evaluate    ';'.join($row_strings)
    Append To File    ${link_csv_file}    ${row_string}\n

