*** Settings ***
Documentation       all the keywords needed to authentificate and accept the cookiesResource

Resource            ..${/}..${/}..${/}Ressources${/}STEP${/}Common${/}common.resource


*** Keywords ***
Authentificate
    Log To Console    New Browser
    New Browser    ${STEP_BROWSER}    headless=${headless}    reuse_existing=${False}    slowMo=0:00:02
    New Page    ${PAGE_URL}
    Fill text    ${Step_login}    ${STEP_USERNAME}
    Fill secret    ${Step_pass}    $STEP_PASSWORD
    Click    ${LogIn}

Access Contact Page
    [Arguments]    ${Email}
    # Go to ClarinsWebUI
    Click    ${ClarinsWebUI}
    # Search by email
    Click    ${GlobalSearch}
    Fill Text    ${Research}    ${Email}
    Press Keys    ${Research}    Enter
    ${is_visible}=    Is Element Visible    ${multipleElements}
    IF    ${is_visible}    Click    ${FirstElement}    ELSE    Sleep    1s

Is Element Visible
    [Arguments]    ${selector}
    ${state}=    Run Keyword And Return Status    Wait For Elements State    ${selector}    visible    timeout=500ms
    RETURN    ${state}
