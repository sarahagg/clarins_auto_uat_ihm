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
    Click    ${remember}
    Click    ${continuer}

    ${mypassword}=    Enter Password    ${mypassword}
    Fill Secret    ${connexion_password}    $mypassword
    Click    ${connexion_submit}

    Wait For Elements State    ${dashboard}    visible
    ${text}=    Get Text    ${dashboard}
    Should Be Equal    ${creation_text.${country}}    ${text}
