*** Settings ***
Documentation       all the keywords needed to authentificate and accept the cookiesResource

Resource            ..${/}..${/}Ressources${/}LinkCLM_NewAccount${/}Common${/}common.resource
# Resource    /Users/s.aggour/Library/CloudStorage/OneDrive-ONEPOINT/Clarins/clarins-auto-uat-ihm/Ressources/LinkCLM_CreationCompte/Common/common.resource


*** Keywords ***
Authentificate CLM
    Log To Console    New Browser
    New Browser    ${BROWSER}    headless=${headless}    reuse_existing=${False}    slowMo=0:00:02
    New Page    ${PAGE_URL}

    WHILE    True
        ${is_visible} =    Run Keyword And Return Status
        ...    Wait For Elements State
        ...    ${CLM_login}
        ...    visible
        ...    timeout=500ms
        IF    '${is_visible}' == 'True'    BREAK
        Reload
        Sleep    1s
    END
    Fill text    ${CLM_login}    ${USERNAME}
    Fill secret    ${CLM_pass}    $PASSWORD
    Click    ${Connexion_CLM}
    Wait For Elements State    ${titre_trouver_compte}    visible
    sleep    3S

Access Contact Page CLM
    [Arguments]    ${country}    ${regions}
    click    ${profil_icon}
    Click    ${changer_le_programme_de_fidelite}
    Click    ${Programmechoice}
    IF    $country != 'BNL' and $country != 'ITA'
        Click    ${programmes.${country}}
    ELSE
        Click    ${programmes.${regions}}
    END
    Click    ${confirmer}
