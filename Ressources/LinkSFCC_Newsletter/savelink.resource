*** Settings ***
Documentation       all the keywords needed to save the info in order to test on other systems

Resource            common.resource

*** Keywords ***
Write Data Newsletter
    [Arguments]       ${data}    ${checkSystems}
    FOR    ${system}    IN    @{checkSystems}
        ${file_exists}=    Run Keyword And Ignore Error    File Should Exist    ${csv_file_Newsletter_${system}}
        ${file_status}=    Set Variable    ${file_exists}[0]
        IF    '${file_status}' == 'PASS'
            Append row To CSV Newsletter      ${data}    ${system}
        ELSE
            Create CSV Newsletter       ${data}    ${system}
        END
    END

Create CSV Newsletter
    [Arguments]      ${data}    ${system}
    Create File    ${csv_file_Newsletter_${system}}
    ${headers}=    Create List    ***Test Cases***    $\{Email}    $\{country}    $\{regions}
    Append header To CSV Newsletter        ${headers}    ${system}
    Append row To CSV Newsletter     ${data}    ${system}

Append header To CSV Newsletter
    [Arguments]       ${headers}    ${system}
    ${headers_string}=    Evaluate    ';'.join($headers)
    Append To File    ${csv_file_Newsletter_${system}}    ${headers_string}\n

Append row To CSV Newsletter
    [Arguments]       ${data}    ${system}
    ${row_strings}=    Create List
    ${new_test_name}=    Replace String    ${TEST_NAME}    SFCC    ${system}
    Append To List    ${row_strings}    ${new_test_name}
    FOR    ${element}    IN    @{data}
        ${element_string}=    Convert To String    ${element}
        Append To List    ${row_strings}    ${element_string}
    END
    Log    ${row_strings}
    ${row_string}=    Evaluate    ';'.join($row_strings)
    Append To File    ${csv_file_Newsletter_${system}}    ${row_string}\n
