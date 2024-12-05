*** Keywords ***
Access Contact Page
    [Arguments]    ${Email}
    # Go to ClarinsWebUI
    Click    ${loc_clarinswebui}
    # Search by email
    Click    ${loc_globalSearch}
    Fill Text    ${loc_research}    ${Email}
    Press Keys    ${loc_research}    Enter
    ${is_visible}=    Is Element Visible    ${loc_multipleElements}
    IF    ${is_visible}    Click    ${loc_FirstElement}    ELSE    Sleep    1s