*** Settings ***
Documentation       all the keywords needed to authentificate and accept the cookiesResource

Resource            ..${/}..${/}..${/}Ressources${/}SFCC${/}Common${/}common.resource


*** Keywords ***
Authentificate and accept cookies
    [Arguments]    ${country}

# Authentification
    Log To Console    New Browser
    New Browser    ${BROWSER}    headless=${headless}    reuse_existing=${False}    slowMo=0:00:02
    &{httpCredentials}    Create Dictionary    username=$USERNAME    password=$PASSWORD
    New Context    httpCredentials=${httpCredentials}
    New Page    ${websites.${country}}

# Accept cookies
    ${is_visible}    Run Keyword And Return Status    Wait For Elements State    ${my_popup}    visible    timeout=5s
    IF    ${is_visible}
        Log To Console    Waiting for cookie banner to appear
        Wait For Elements State    ${my_popup}    visible    timeout=5s
        Click    ${accept_cookies}
        Log To Console    Cookie accepted

    END
    sleep  2s
    IF    $country == 'ITA'
        ${is_visible}    Is Element Visible    ${welcome_offer}
        IF    ${is_visible}
            Click    ${refuse_welcome_offer}
        ELSE
            Sleep    1s
        END
    END
