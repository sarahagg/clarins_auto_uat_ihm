*** Settings ***
Documentation       But de la tâche est de générer n fiches de contact.

Resource            ..${/}Ressources${/}SFCC${/}Common${/}a_import_all_common_SFCC.resource

Test Setup          Initialize Test Context
Test Teardown       Close Browser

Force Tags          Create N SFCC Account
*** Variables ***
@{allCheckSystems}     SFCC
*** Tasks ***
Create N SFCC Account
#the number of iteration "n" and the country "chosen_country" are defined in configuration
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

        Initialize SFCC Website Context
        Go To Login Page
        Connect As A New SFCC User
        Complete Registration Form
        Verify Account Creation

        Write Data To Link CSV Files    contact    SFCC    ${allCheckSystems}    create_N_SFCC_Account
    END





