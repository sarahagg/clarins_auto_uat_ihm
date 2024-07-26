*** Settings ***
Documentation       all the keywords needed to login to the website and accept the cookies
Resource            ..${/}..${/}Ressources${/}LINKSFCC${/}common.resource
Library             OperatingSystem
Library             DateTime
Library             BuiltIn
*** Keywords ***

Write Data
    [Arguments]    ${csv_file}    ${data}
    #${row}=        Create List    @{data}
    ${file_exists}=    Run Keyword And Ignore Error    File Should Exist    ${csv_file}
    ${file_status}=    Set Variable    ${file_exists}[0]
    Run Keyword If    '${file_status}' == 'PASS'    Append row To CSV    ${csv_file}    ${data}    ELSE    Create CSV   ${csv_file}    ${data}

Create CSV
    [Arguments]      ${csv_file}    ${row}
    Create File      ${csv_file}
    ${headers}=    Create List    $\{FirstName}    $\{LastName}    $\{Email}   $\{BirthDate}    $\{country}     $\{salutation}    $\{regions}      $\{emailOption}      $\{isLoyaltyMember}
    Append header To CSV    ${csv_file}    ${headers}
    Append row To CSV    ${csv_file}    ${row}

Append header To CSV
    [Arguments]    ${csv_file}    ${row}
    ${row_string}=    Evaluate    ';'.join($row)
    Append To File    ${csv_file}    ${row_string}\n


Append row To CSV
   [Arguments]    ${csv_file}    ${row}
    ${row_strings}=    Create List
    FOR    ${element}    IN    @{row}
        #${element_string}=    Run Keyword If    '${element}' in ['datetime.date', 'datetime.datetime']    Convert Date To String    ${element}    ELSE    Convert To String    ${element}
        ${element_string}=    Convert To String    ${element}
        Append To List    ${row_strings}    ${element_string}
    END
    Log    ${row_strings}
    ${row_string}=    Evaluate    ';'.join($row_strings)
    Append To File    ${csv_file}    ${row_string}\n

Convert Date To String
    [Arguments]     ${date}
    ${formatted_date}=    Evaluate    ${date}.strftime('%Y-%m-%d')
    [Return]    ${formatted_date}

Clear CSV File
    [Arguments]    ${csv_file}
    Remove File    ${csv_file}

