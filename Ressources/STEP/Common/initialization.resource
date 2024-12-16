*** Settings ***
Documentation       all the keywords needed to authentificate and accept the cookiesResource

Resource            a_import_all_common_STEP.resource


*** Keywords ***
Initialize STEP Website Context
    Log    Instantiate A New Browser
    New Browser    ${BROWSER}    headless=${headless}    reuse_existing=${False}    slowMo=0:00:02
    New Page    ${PAGE_URL}
