*** Settings ***
Resource            ${EXECDIR}${/}Ressources${/}SFCC${/}Common${/}a_import_all_common_SFCC.resource

Test Setup          Initialize Test Context
Test Teardown       Terminate Test Context


*** Test Cases ***
Test Case

    ${playTest}=    Set Variable    YES

    IF    $playTest == "YES"

        &{update_data}=    Create Dictionary

        ${country}=    Set Variable    MYS
        ${country}=    Set Test Variable    ${country}
        ${update_data}[country]=    Set Variable    ${country}

        Initialize SFCC Website Context

        &{update_data}=    Create Dictionary

        ${email}=    Set Variable    asatdfzef@q.com
        ${update_data}[email]=    Set Variable    ${email}

        Generate Test Data Connection    ${email}
        Connect As An Existing SFCC User



    END