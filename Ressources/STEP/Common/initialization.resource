*** Settings ***
Documentation       all the keywords needed to authentificate and accept the cookiesResource

Resource            a_import_all_common_STEP.resource


*** Keywords ***
Authentificate
    Log To Console    New Browser
    New Browser    ${BROWSER}    headless=${headless}    reuse_existing=${False}    slowMo=0:00:02
    New Page    ${PAGE_URL}
    Fill text    ${loc_stepLogin}    ${USERNAME}
    Fill secret    ${loc_stepPassword}    $PASSWORD
    Click    ${loc_login}




