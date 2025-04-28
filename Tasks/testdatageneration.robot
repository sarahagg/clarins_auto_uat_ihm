*** Settings ***
Documentation       But de la tâche est de générer n fiches de contact.

Resource            ..${/}Ressources${/}SFCC${/}Common${/}a_import_all_common_SFCC.resource

#Test Setup          Initialize Test Context
#Test Teardown       Close Browser

Force Tags          generate data for countries
*** Variables ***
@{allCheckSystems}     SFCC
*** Tasks ***
generate data for countries

    FOR    ${counter}    IN RANGE    1   ${n}
        Log    Running test case number ${counter}
        Generate Test Data Create Account
                                            ...    auto
                                            ...    auto
                                            ...    auto
                                            ...    auto
                                            ...    auto
                                            ...    auto
                                            ...    auto
                                            ...    auto
                                            ...    ${EMPTY}
                                            ...    ${country}
                                            ...    sfcc
                                            ...    sfcc

        Write Data To Link CSV Files    contact    SFCC    ${allCheckSystems}    generate data  ${country}
    END





