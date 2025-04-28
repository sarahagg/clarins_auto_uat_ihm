*** Settings ***
Documentation       all the keywords needed to init properly the test case

Resource            a_import_all_common_SFCC.resource


*** Keywords ***
Initialize SFCC Website Context
    ${country}=    Set Variable    ${canonical_form_contact_link_files.get('\${country}')}
    Open Browser And Go To Home Page    ${country}
    IF  '${country}' not in @{no_popup_countries}
        Wait And Close All Popups   ${country}
    END

Open Browser And Go To Home Page
    [Arguments]    ${country}

    Log    Instantiate A New Browser
    New Browser    ${BROWSER}    headless=${headless}    reuse_existing=${False}    slowMo=0:00:02
    &{httpCredentials}    Create Dictionary    username=$USERNAME    password=$PASSWORD
    New Context    httpCredentials=${httpCredentials}
    New Page    ${websites.${country}}
