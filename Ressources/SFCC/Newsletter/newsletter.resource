*** Settings ***
Documentation       all the keywords needed to create a newsletter

Resource            ..${/}..${/}..${/}Ressources${/}SFCC${/}Common${/}common.resource


*** Keywords ***
Subscribe to Newsletter
    [Arguments]    ${Email}    ${country}

    Import FakerLibrary    ${country}
    Scroll By    ${none}    100%    0
    sleep    2s
    Scroll To Element    ${newsletter_email}

    IF    $country == 'BEL' or $country == 'LUX' or $country == 'NLD'
        Click    ${newsletter_region}
        IF    $country == 'BEL'
            Click    ${newsletter_belgique}
        ELSE IF    $country == 'LUX'
            Click    ${newsletter_luxembourg}
        ELSE IF    $country == 'NLD'
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

    Should Contain    ${text}    ${newsletter_text.${country}}

    RETURN    ${Email}    ${country}
