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


Convert To ASCII
    [Arguments]    ${text}
    ${ascii_text}=    Evaluate    unidecode.unidecode("${text}")    unidecode
    ${ascii_text}=    Replace Non Alphanum Characters    ${ascii_text}
    ${ascii_text}=     Convert To Lower Case    ${ascii_text}
    log   ${ascii_text}
    [Return]    ${ascii_text}

Replace Non Alphanum Characters
    [Arguments]    ${input_string}
    ${output_string}    Set Variable    ${input_string}
    ${output_string}=    Replace String Using Regexp    ${output_string}    [^a-zA-Z0-9]    x
    [Return]    ${output_string}

Custom Run On Failure
    Take Screenshot         EMBED


Initialize Test Context
    # Reset all global variables

    ${allKeys}=    Get Dictionary Keys    ${canonical_form_contact_link_files}
    FOR    ${oneKey}    IN    @{allKeys}
        Set To Dictionary    ${canonical_form_contact_link_files}    ${oneKey}    ${EMPTY}
    END

    ${allKeys}=    Get Dictionary Keys    ${canonical_form_transaction_link_files}
    FOR    ${oneKey}    IN    @{allKeys}
        Set To Dictionary    ${canonical_form_transaction_link_files}    ${oneKey}    ${EMPTY}
    END

    ${allKeys}=    Get Dictionary Keys    ${canonical_form_last_interaction_date_link_files}
    FOR    ${oneKey}    IN    @{allKeys}
        Set To Dictionary    ${canonical_form_last_interaction_date_link_files}    ${oneKey}    ${EMPTY}
    END


Terminate Test Context
    Close Browser
