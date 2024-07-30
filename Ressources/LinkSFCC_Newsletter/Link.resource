*** Settings ***
Documentation       all the keywords needed to login to the website and accept the cookies

Resource            ..${/}..${/}Ressources${/}LinkSFCC_Newsletter${/}common.resource
Library             OperatingSystem
Library             DateTime
Library             BuiltIn


*** Keywords ***
Write Data Newsletter
    [Arguments]    ${csv_file_Newsletter}    ${data}
    ${file_exists}=    Run Keyword And Ignore Error    File Should Exist    ${csv_file_Newsletter}
    ${file_status}=    Set Variable    ${file_exists}[0]
    IF    '${file_status}' == 'PASS'
        Append row To CSV Newsletter    ${csv_file_Newsletter}    ${data}
    ELSE
        Create CSV Newsletter    ${csv_file_Newsletter}    ${data}
    END

Create CSV Newsletter
    [Arguments]    ${csv_file_Newsletter}    ${row}
    Create File    ${csv_file_Newsletter}
    ${headers}=    Create List    $\{Email}    $\{country}
    Append header To CSV Newsletter    ${csv_file_Newsletter}    ${headers}
    Append row To CSV Newsletter    ${csv_file_Newsletter}    ${row}

Append header To CSV Newsletter
    [Arguments]    ${csv_file_Newsletter}    ${row}
    ${row_string}=    Evaluate    ';'.join($row)
    Append To File    ${csv_file_Newsletter}    ${row_string}\n

Append row To CSV Newsletter
    [Arguments]    ${csv_file_Newsletter}    ${row}
    ${row_strings}=    Create List
    FOR    ${element}    IN    @{row}
        ${element_string}=    Convert To String    ${element}
        Append To List    ${row_strings}    ${element_string}
    END
    Log    ${row_strings}
    ${row_string}=    Evaluate    ';'.join($row_strings)
    Append To File    ${csv_file_Newsletter}    ${row_string}\n
