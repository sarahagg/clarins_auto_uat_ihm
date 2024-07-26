*** Settings ***
Documentation       all the keywords needed to authentificate and accept the cookiesResource
Resource            ..${/}..${/}..${/}Ressources${/}STEP${/}Common${/}common.resource


*** Keywords ***
Authentificate
    [Arguments]    ${Email}

    Log To Console              New Browser
    New Browser                 ${STEP_BROWSER}   headless=${false}    reuse_existing=${False}    slowMo=0:00:02
    New Page                    ${PAGE_URL}
    Fill text                   ${Step_login}     ${STEP_USERNAME}
    Fill secret                 ${Step_pass}     $STEP_PASSWORD
    Click                       ${LogIn}

    #go to ClarinsWebUI
    Click                       ${ClarinsWebUI}

    #Search for an email
    Click                       ${GlobalSearch}
    Fill Text    ${Recherche}    ${Email}
    Press Keys    ${Recherche}    Enter
    ${is_visible}=    Is Element Visible    ${multipleElements}
    Run Keyword If    ${is_visible}    Click    ${FirstElement}    ELSE    Sleep    1s


Is Element Visible
    [Arguments]    ${selector}
    ${state}=    Run Keyword And Return Status    Wait For Elements State    ${selector}    visible    timeout=500ms
    [Return]    ${state}
