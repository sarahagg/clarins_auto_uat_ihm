*** Settings ***
Documentation       all the keywords needed to init properly the test case

Resource            a_import_all_common_SFCC.resource


*** Keywords ***
Initialize SFCC Website Context
    Open Browser And Go To Home Page
    Wait And Close All Popups

Open Browser And Go To Home Page
    Log    Instantiate A New Browser
    New Browser    ${BROWSER}    headless=${headless}    reuse_existing=${False}    slowMo=0:00:02
    &{httpCredentials}    Create Dictionary    username=$USERNAME    password=$PASSWORD
    New Context    httpCredentials=${httpCredentials}
    New Page    ${websites.${country}}
