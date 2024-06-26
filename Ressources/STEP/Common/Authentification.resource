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
    #go to ClarinsWebUI and loop up a searchItem
    Click                       ${ClarinsWebUI}
    Click                       ${GlobalSearch}
    #${SearchItem}=SetValue              ${Email}
    Fill text                   ${Recherche}         ${Email}
    Click                       ${IconRechercher}





