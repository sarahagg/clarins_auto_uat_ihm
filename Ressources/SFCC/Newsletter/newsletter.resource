*** Settings ***
Documentation       all the keywords needed to create a newsletter
Resource            ..${/}..${/}..${/}Ressources${/}SFCC${/}Common${/}common.resource

*** Keywords ***
Inscription a la newsletter
    [Arguments]   ${Email}

    Scroll By                   ${none}   100%    0
    sleep                       2s
    Scroll To Element           ${newsletter_email}


    ${Email}=                   Generate Newsletter Email       ${Email}
    Fill Text                   ${newsletter_email}             ${Email}


    Click                       ${newsletter_inscription_button}
    Wait For Elements State     ${newsletter_message}    visible    timeout=3s

