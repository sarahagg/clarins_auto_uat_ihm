*** Settings ***
Documentation       all the keywords needed to login to the website and accept the cookies

Resource            common.resource
Library             OperatingSystem
Library             DateTime
Library             BuiltIn


*** Keywords ***
Write Data
    [Arguments]       ${data}
    ${file_exists}=    Run Keyword And Ignore Error    File Should Exist    ${csv_file_Newaccount}
    ${file_status}=    Set Variable    ${file_exists}[0]
    IF    '${file_status}' == 'PASS'
        Append row To CSV       ${data}
    ELSE
        Create CSV       ${data}
    END

Create CSV
    [Arguments]     ${row}
    Create File    ${csv_file_Newaccount}
    ${headers}=    Create List
    ...    $\{FirstName}
    ...    $\{LastName}
    ...    $\{Email}
    ...    $\{BirthDate}
    ...    $\{country}
    ...    $\{salutation}
    ...    $\{regions}
    ...    $\{emailOption}
    ...    $\{isLoyaltyMember}
    Append header To CSV       ${headers}
    Append row To CSV       ${row}

Append header To CSV
    [Arguments]       ${row}
    ${row_string}=    Evaluate    ';'.join($row)
    Append To File    ${csv_file_Newaccount}    ${row_string}\n

Append row To CSV
    [Arguments]      ${row}
    ${row_strings}=    Create List
    FOR    ${element}    IN    @{row}
        ${element_string}=    Convert To String    ${element}
        Append To List    ${row_strings}    ${element_string}
    END
    Log    ${row_strings}
    ${row_string}=    Evaluate    ';'.join($row_strings)
    Append To File    ${csv_file_Newaccount}    ${row_string}\n

Convert Date To String
    [Arguments]    ${date}
    ${formatted_date}=    Evaluate    ${date}.strftime('%Y-%m-%d')
    RETURN    ${formatted_date}

