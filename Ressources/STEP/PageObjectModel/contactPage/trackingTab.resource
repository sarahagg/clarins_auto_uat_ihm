*** Settings ***
Documentation       all the keywords needed to check and modify a user's information on STEP

Resource            ..${/}..${/}Common${/}a_import_all_common_STEP.resource


*** Keywords ***
Go To Tracking Tab
            Click    ${trackingTab_panel_tab}
            sleep  1s
Verify creation system
    [Arguments]     ${creationSystem}  ${createDate}
    #creation systeme
    ${creation_system_step}=     Get Text    ${trackingTab_creation_system_value}
    Should Be Equal         ${creation_system_step}   ${creationSystem}

    ${now}=          Get Current Date    result_format=%Y-%m-%d %H:%M:%S
    ${creation_date_step}=    Get Text    ${trackingTab_creation_Date_value}

    ${result}=  Evaluate    "${creation_date_step}" <= "${createDate}" <= "${now}"
    Should Be True        ${result}    creation date is not updated
    log  creation date is correct

Verify modification system
    [Arguments]      ${lastModificationSystem}    ${lastUpdateDate}
    #modification systeme
    ${lastModificationSystem_step}=     Get Text    ${trackingTab_lastModification_System_value}
    Should Be Equal         ${lastModificationSystem_step}   ${lastModificationSystem}

    ${now}=          Get Current Date    result_format=%Y-%m-%d %H:%M:%S
    ${lastUpdateDate_step}=    Get Text    ${trackingTab_lastUpdate_Date_value}

    ${result}=  Evaluate    "${lastUpdateDate}" <= "${lastUpdateDate_step}" <= "${now}"
    Should Be True        ${result}    modification date is not updated
    log  modification date is correct


Verify last interaction date
    [Arguments]     ${lastInteractionDate}      ${reason}

    ${last_interaction_reason}=     Get Text     ${trackingTab_last_interaction_reason_value}
    Should Be Equal         ${last_interaction_reason}     ${reason}

    ${now}=          Get Current Date    result_format=%Y-%m-%d %H:%M:%S
    ${lastInteractionDate_step}=     Get Text     ${trackingTab_last_interaction_date_value}
    ${result}=  Evaluate    "${lastInteractionDate}" <= "${lastInteractionDate_step}" <= "${now}"
    #${result}=  Evaluate    "${lastInteractionDate_step}" <= "${lastInteractionDate}" <= "${now}"

    Should Be True        ${result}    last interaction is not updated
    Log    last interaction date is correct


