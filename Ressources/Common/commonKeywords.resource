*** Settings ***
Documentation       All the different common keywords

Resource   common.resource


*** Keywords ***
Check If Element Is Visible And Warn If Not
    [Arguments]    ${selector}
    ${return_status}    ${return_value}=    Run Keyword And Warn On Failure    Wait For Elements State    ${selector}    visible
    RETURN    ${return_status}

Import FakerLibrary
    [Arguments]    ${country}

    IF    len($country) == 0
        ${country}=    Set Variable    FRA
    END

    ${all_available_countries}=    Set Variable    ${touch_countries}
    IF    $country not in $all_available_countries
        Import Library    FakerLibrary    WITH NAME    Faker_${TEST_NAME}
        RETURN
    END

    Import Library    FakerLibrary    locale=${locale_values.${country}}    WITH NAME    Faker_${TEST_NAME}


Custom Run On Failure
    Take Screenshot         EMBED


Initialize Test Context
    # Reset all global variables

    ${allKeys}=    Get Dictionary Keys    ${canonical_form_contact_link_files}
    FOR    ${oneKey}    IN    @{allKeys}
        Set To Dictionary    ${canonical_form_contact_link_files}    ${oneKey}    ${EMPTY}
    END