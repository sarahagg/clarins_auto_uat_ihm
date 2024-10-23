*** Settings ***
Documentation       all the keywords needed to authentificate and accept the cookiesResource

Resource            common.resource


*** Keywords ***
Authentificate
    Log To Console    New Browser
    New Browser    ${BROWSER}    headless=${headless}    reuse_existing=${False}    slowMo=0:00:02
    New Page    ${PAGE_URL}
    Fill text    ${loc_stepLogin}    ${USERNAME}
    Fill secret    ${loc_stepPassword}    $PASSWORD
    Click    ${loc_login}

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

Is Element Visible
    [Arguments]    ${selector}
    ${state}=    Run Keyword And Return Status    Wait For Elements State    ${selector}    visible    timeout=500ms
    RETURN    ${state}
