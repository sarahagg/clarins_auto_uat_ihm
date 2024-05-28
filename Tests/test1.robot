*** Settings ***
Force Tags      login_ihm
Documentation   But du Test
...             Vérifier que la connexion se passe bien
...              python3 -m robot  -d "Resultats/login_ihm_uat/logs" -v ENV:UAT  -i "login_ihm" Tests
Resource        ..${/}Ressources${/}Common${/}common.resource


*** Test Cases ***
Mon_cas_de_test
    Access to Login page
    #Accept cookies
    #Inscription a la newsletter
    #Inserer email
    #Connexion ou creer un compte
    Sleep    5s


*** Keywords ***
Access to Login page

    Log To Console              New Browser
    New Browser                 ${BROWSER}   headless=${false}    reuse_existing=${False}    slowMo=0:00:02

    Log To Console              Creating new browser with HTTP credentials
    &{httpCredentials}          Create Dictionary     username=$USERNAME    password=$PASSWORD
    New Context                 httpCredentials=${httpCredentials}

    Log To Console              Opening new page
    New Page                    ${URL}

 Accept cookies
    Log To Console              Waiting for cookie banner to appear
    Wait For Elements State     ${my_popup}    visible    timeout=3s

    Log To Console              Accepting cookies
    Click                       ${accept_cookies}

    Log To Console              Cookie accepted

 Inscription a la newsletter
    Log To Console              looking for newsletter
    Scroll By                   ${none}   100%    0
    sleep                       2s
    Scroll To Element           ${newsletter_email}

    Log To Console              click on email
    click                       ${newsletter_email}
    Log To Console              email clicked

    Log To Console              inserting an email
    Keyboard Input              insertText    ${my_email}

    Log To Console              validate email
    Click                       ${newsletter_inscription_button}
    Wait For Elements State     ${newsletter_message}    visible    timeout=3s
    Log To Console              newsletter done

Inserer email
    Log To Console              clicking the connexion button
    Scroll By                   ${none}   0    100%
    Click                       ${connexion_button}
    Log To Console              connexion page
    Click                       ${insert_email}
    Log To Console              inserting an email
    Keyboard Input              insertText    ${my_email}
    Click                       ${remember}
    Click                       ${continuer}

Connexion ou creer un compte
    ${is_visible}=   Run Keyword And Return Status    Wait For Elements State     ${connexion_path}    visible    timeout=3s
    Run Keyword If    ${is_visible}    Connexion
    ...    ELSE    Creer Un Compte

Connexion
    Log To Console              filling passwordd
    Click                       ${connexion_password}
    Log To Console              inserting password
    Type Text                   ${connexion_password}    ${my-password}

    Click                       ${connexion_submit}
    sleep   5s
Creer un compte
    Log To Console              filling first name
    Click                       ${first_name}
    Keyboard Input              insertText    ${my_first_name}

    Log To Console              filling last name
    Click                       ${last_name}
    Keyboard Input              insertText    ${my_last_name}

    Log To Console              clicking on email
    Click                       ${email_div}
    #Click                       ${modifier}

    Log To Console              filling passwordd
    Click                       ${account_password}
    Log To Console              inserting password
    Type Text                   ${account_password}    ${my-password}

    Log To Console              filling birthday
    Click                       ${birthday}
    Type Text                   ${birthday}    ${my_birthday}   delay=0.1

    Log To Console              recevoir des informations
    Click                       ${boutton1}

    Log To Console              Club Clarins
    Click                       ${boutton2}

    Click                       ${submit}
