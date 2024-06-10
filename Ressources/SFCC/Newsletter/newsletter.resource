*** Settings ***
Documentation       all the keywords needed to create a newsletter
Resource            ..${/}..${/}..${/}Ressources${/}SFCC${/}Common${/}common.resource

*** Keywords ***
Inscription a la newsletter
    [Arguments]   ${Email}   ${country}   ${regions}

    Import FakerLibrary         ${country}
    Scroll By                   ${none}   100%    0
    sleep                       2s
    Scroll To Element           ${newsletter_email}


    IF    $country == 'BNL'
         Click                  ${newsletter_region}
         ${regions}=            Generate Newsletter Region             ${regions}
         IF         $regions == 'Belgique'
             Click               ${newsletter_Belgique}
         ELSE IF    $regions == 'Luxembourg '
             Click               ${newsletter_Luxembourg}
         ELSE
             Click               ${newsletter_Nederland}
         END
    END

    ${Email}=                   Generate Newsletter Email              ${Email}
    Fill Text                   ${newsletter_email}                    ${Email}

    IF  $country == 'ITA'
        Click                   ${italie_privacy_policy}
    END

    Click                       ${newsletter_inscription_button}
    Wait For Elements State     ${newsletter_message}                   visible    timeout=3s
    ${text}=                    Get Text                                ${newsletter_message}
    Should Be Equal             ${newsletter_text.${country}}           ${text}



