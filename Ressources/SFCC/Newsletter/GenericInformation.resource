* Settings ***
Documentation       all the keywords needed to login to the website and accept the cookies
Resource            ..${/}..${/}..${/}Ressources${/}SFCC${/}Common${/}common.resource

*** Keywords ***
Generate Newsletter Email
    [Arguments]    ${Email}

    IF  $Email == 'default'
        RETURN    emailderesr@gmail.com
    END

    IF  $Email == 'auto'
        ${Email}=     Run Keyword   Faker_${TEST_NAME}.Email
        RETURN    ${Email}
    END

    RETURN     ${Email}

Generate Newsletter Region
    [Arguments]    ${regions}

    IF  $regions == 'auto'
        ${random_regions}=     Evaluate            random.choice($BNLregion)
        RETURN    ${random_regions}
    END

    RETURN     ${regions}
