*** Settings ***
Documentation       all the keywords needed to use the global search tab and find a contact

Resource            ..${/}Common${/}a_import_all_common_STEP.resource


*** Keywords ***

Search By Full Name
    [Arguments]    ${lastName}  ${firstName}
     ${fullName}=   Set Variable   ${firstName} ${lastName}
     Fill Text    ${globalSearchTab_research_input}   ${fullName}

Search By First Name
    [Arguments]     ${firstName}
     Fill Text    ${globalSearchTab_research_input}   ${firstName}

Search By Last Name
    [Arguments]     ${lastName}
     Fill Text    ${globalSearchTab_research_input}   ${lastName}

Search By Phone Number
    [Arguments]     ${phoneNumber}  ${country}
     Fill Text    ${globalSearchTab_research_input}  ${phone_number_country_code.${country}}${phoneNumber}

Search By Email
    [Arguments]    ${email}
    Fill Text    ${globalSearchTab_research_input}    ${email}

Search By CCID
    [Arguments]    ${email}
    Fill Text    ${globalSearchTab_research_input}   ${email}
    Access Contact Page
    ${ccid}=    Get Text    ${contactTab_ccid_value}
    Access Selected Global Search Tab
    Fill Text    ${globalSearchTab_research_input}   ${ccid}

Access Contact Page
    Press Keys    ${globalSearchTab_iconResearch_button}    Enter
    ${is_visible}=    Check If Element Is Visible And Warn If Not    ${globalSearchTab_multipleElements_table}
    IF    $is_visible == 'PASS'    Click    ${globalSearchTab_firstElement_link}
