*** Settings ***
Documentation       all the keywords needed to authentificate and accept the cookiesResource

Resource            ..${/}..${/}..${/}Ressources${/}SFCC${/}Common${/}common.resource


*** Keywords ***
Authentificate and close all popups
    [Arguments]    ${country}    ${regions}

# Authentification
    Log To Console    New Browser
    New Browser    ${BROWSER}    headless=${headless}    reuse_existing=${False}    slowMo=0:00:02
    &{httpCredentials}    Create Dictionary    username=$USERNAME    password=$PASSWORD
    New Context    httpCredentials=${httpCredentials}

    IF    $country == 'BNL'
        New Page    ${websites.${regions}}
    ELSE
        New Page    ${websites.${country}}
    END

    Sleep  2s

    # Accept cookies
    ${return_status}    ${return_value}=    Run Keyword And Warn On Failure    Wait For Elements State    ${my_popup}    visible
    IF    $return_status == 'PASS'
        Log To Console    Waiting for cookie banner to appear
        Wait For Elements State    ${my_popup}    visible    timeout=30s
        Click    ${accept_cookies}
        Log To Console    Cookie accepted
    END

    Sleep  2s

    # Decline welcome offer
    ${return_status}    ${return_value}=    Run Keyword And Warn On Failure    Wait For Elements State    ${welcome_offer_popup}    visible
    IF    $return_status == 'PASS'
        Log To Console    Waiting for welcome offer to appear
        Wait For Elements State    ${refuse_welcome_offer}    visible    timeout=30s
        Click    ${refuse_welcome_offer}
        Log To Console    Welcome offer refused
    END
