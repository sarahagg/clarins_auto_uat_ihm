*** Settings ***
Documentation       all the keywords needed to navigate on the Home Page

Resource            ..${/}Common${/}a_import_all_common_SFCC.resource

*** Keywords ***
Verify Transaction success
    ${country}=    Set Variable    ${canonical_form_contact_link_files.get('\${country}')}

    ${return_status}=   Check If Element Is Visible And Warn If Not    ${orderSummaryPage_transaction_success_title }
    WHILE    $return_status == 'FAIL'    limit=${number_of_retry_to_wait_an_element}    on_limit=pass
        Log    Waiting dashboard title to appear
        ${return_status}=   Check If Element Is Visible And Warn If Not    ${orderSummaryPage_transaction_success_title }
    END

    IF    $return_status == 'PASS'
        ${text}=    Get Text    ${orderSummaryPage_transaction_success_title }
        Should Be Equal    ${transaction_order_summary_text.${country}}    ${text}
        Log      Account created
    END

Get CLR

    ${C}=        Get Text    ${orderSummaryPage_transaction_LID_value}
    Log    Le texte extrait est : ${C}
    ${match}=      Get Regexp Matches    ${C}    CLR_[A-Z0-9]+
    ${C}=       Set Variable  ${match[0]}
    Set To Dictionary    ${canonical_form_transaction_link_files}       \${transactionNumber}          ${C}
