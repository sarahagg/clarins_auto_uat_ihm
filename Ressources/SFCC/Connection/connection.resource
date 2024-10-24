*** Settings ***
Documentation       all the keywords needed to connect a user

Resource            ..${/}..${/}..${/}Ressources${/}SFCC/Common${/}common.resource


*** Keywords ***
Connect A User
    [Arguments]    ${Email}    ${mypassword}    ${country}

    Import FakerLibrary    ${country}

    Click    ${connexion_button}
    Log To Console    connexion page
    ${Email}=    Enter Email    ${Email}
    Fill text    ${insert_email}    ${Email}
    Click    ${rememberme_button}
    Click    ${submit_button}

    ${mypassword}=    Enter Password    ${mypassword}
    Fill Secret    ${connection_password}    $mypassword
    Click    ${connection_submit}

    Wait For Elements State    ${dashboard}    visible
    ${text}=    Get Text    ${dashboard}
    Should Be Equal    ${creation_text.${country}}    ${text}
