*** Settings ***
Documentation       all the keywords needed to create a newsletter

Resource            ..${/}..${/}..${/}Ressources${/}SFCC${/}Common${/}common.resource


*** Keywords ***
Subscribe to Newsletter
    [Arguments]    ${Email}    ${country}    ${regions}

    Import FakerLibrary    ${country}    ${regions}
    Scroll By    ${none}    100%    0
    sleep    2s
    Scroll To Element    ${newsletter_email}

    IF    $country == 'BNL'
        Click    ${newsletter_region}
        ${regions}=    Generate Newsletter Region    ${regions}
        IF    $regions == 'BEL'
            Click    ${newsletter_belgique}
        ELSE IF    $regions == 'LUX'
            Click    ${newsletter_luxembourg}
        ELSE IF    $regions == 'NLD'
            Click    ${newsletter_netherlands}
        ELSE
            Log To Console    BNL country not authorized
        END
    END

    ${Email}=    Generate Newsletter Email    ${Email}
    Fill Text    ${newsletter_email}    ${Email}

    IF    $country == 'ITA'    Click    ${italy_privacy_policy}

    Click    ${newsletter_inscription_button}
    Wait For Elements State    ${newsletter_message}    visible    timeout=30s

    ${text}=    Get Text    ${newsletter_message}
    ${text} =   Convert To String    ${text}
    IF    $country == 'BNL'
        Should Contain    ${text}    ${newsletter_text.${regions}}
    ELSE
        Should Contain    ${text}    ${newsletter_text.${country}}
    END

    RETURN    ${Email}    ${country}    ${regions}
