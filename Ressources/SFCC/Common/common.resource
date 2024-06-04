*** Settings ***
Documentation   All the common resources
...             All the different libraries
...             All the different resources

#libraries
Library         Browser          run_on_failure=${False}    timeout=0:01:00
Library         KeePassLibrary
Library         OperatingSystem
Library         DateTime
Library         FakerLibrary


#variables
Variables       ..${/}..${/}..${/}Ressources${/}SFCC${/}Common${/}locator.py

#resources
Resource        ..${/}..${/}..${/}Ressources${/}SFCC${/}Common${/}common_variables.resource
Resource        ..${/}..${/}..${/}Ressources${/}SFCC${/}Common${/}common.resource
Resource        ..${/}..${/}..${/}Ressources${/}SFCC${/}Common${/}CookiesAndAuthentification.resource

Resource        ..${/}..${/}..${/}Ressources${/}SFCC${/}New_account${/}GenericInformation.resource
Resource        ..${/}..${/}..${/}Ressources${/}SFCC${/}New_account${/}New_account.resource

Resource        ..${/}..${/}..${/}Ressources${/}SFCC${/}Newsletter${/}newsletter.resource
Resource        ..${/}..${/}..${/}Ressources${/}SFCC${/}Newsletter${/}GenericInformation.resource

Resource        ..${/}..${/}..${/}Ressources${/}SFCC${/}Connection${/}GenericInformation.resource
Resource        ..${/}..${/}..${/}Ressources${/}SFCC${/}Connection${/}Connection.resource

*** Keywords ***
Import FakerLibrary
    [Arguments]    ${country}

    IF    len($country) == 0
        ${country}=     Set Variable    ${default_values.country}
    END

    ${all_available_countries}=     Set Variable      ${touch_countries}
    IF    $country not in $all_available_countries
        Import Library    FakerLibrary    WITH NAME    Faker_${TEST_NAME}
        RETURN
    END

    Import Library    FakerLibrary    locale=${locale_values.${country}}    WITH NAME    Faker_${TEST_NAME}

