*** Settings ***
Documentation       all the keywords needed to save the info in order to test on other systems

Resource            common.resource

*** Keywords ***
Write Data
    [Arguments]       ${data}    ${checkSystems}
    FOR    ${system}    IN    @{checkSystems}
        ${file_exists}=    Run Keyword And Ignore Error    File Should Exist    ${csv_file_Newaccount_${system}}
        ${file_status}=    Set Variable    ${file_exists}[0]
        IF    '${file_status}' == 'PASS'
            Append row To CSV       ${data}    ${system}
        ELSE
            Create CSV       ${data}    ${system}
        END
    END

Create CSV
    [Arguments]     ${data}    ${system}
    Create File    ${csv_file_Newaccount_${system}}
    ${headers}=    Create List   ***Test Cases***    $\{FirstName}    $\{LastName}    $\{Email}    $\{BirthDate}    $\{country}    $\{salutation}    $\{emailOption}    $\{isLoyaltyMember}
    Append header To CSV       ${headers}    ${system}
    Append row To CSV       ${data}    ${system}

Append header To CSV
    [Arguments]       ${headers}    ${system}
    ${headers_string}=    Evaluate    ';'.join($headers)
    Append To File    ${csv_file_Newaccount_${system}}    ${headers_string}\n

Append row To CSV
    [Arguments]      ${data}    ${system}
    ${row_strings}=    Create List
    ${new_test_name}=    Replace String    ${TEST_NAME}    SFCC    ${system}
    Append To List    ${row_strings}    ${new_test_name}
    FOR    ${element}    IN    @{data}
        ${element_string}=    Convert To String    ${element}
        Append To List    ${row_strings}    ${element_string}
    END
    Log    ${row_strings}
    ${row_string}=    Evaluate    ';'.join($row_strings)
    Append To File    ${csv_file_Newaccount_${system}}    ${row_string}\n

Convert Date To String
    [Arguments]    ${date}
    ${formatted_date}=    Evaluate    ${date}.strftime('%Y-%m-%d')
    RETURN    ${formatted_date}

