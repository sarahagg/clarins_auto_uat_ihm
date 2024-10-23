*** Settings ***
Documentation       All the common resources
...                 All the different resources

# variables
Variables           locator.py
# resources
Resource            ..${/}..${/}..${/}Ressources${/}Common${/}common.resource

Resource            common.resource
Resource            commonvariables.resource
Resource            authentification.resource

Resource            ..${/}NewAccount${/}newaccount.resource
Resource            ..${/}NewAccount${/}genericinformation.resource

Resource            ..${/}Newsletter${/}newsletter.resource
Resource            ..${/}Newsletter${/}genericinformation.resource

Resource            ..${/}Connection${/}connection.resource
Resource            ..${/}Connection${/}genericinformation.resource


*** Keywords ***
Import FakerLibrary
    [Arguments]    ${country}    ${regions}

    IF    len($country) == 0
        ${country}=    Set Variable    ${default_values.country}
    END

    ${all_available_countries}=    Set Variable    ${touch_countries}
    IF    $country not in $all_available_countries
        Import Library    FakerLibrary    WITH NAME    Faker_${TEST_NAME}
        RETURN
    END

    IF    $country == 'BNL'
        Import Library    FakerLibrary    locale=${locale_values.${regions}}    WITH NAME    Faker_${TEST_NAME}
    ELSE
        Import Library    FakerLibrary    locale=${locale_values.${country}}    WITH NAME    Faker_${TEST_NAME}
    END




