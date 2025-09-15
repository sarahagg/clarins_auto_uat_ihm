*** Settings ***
Documentation       all the keywords needed to navigate on the Home Page

Resource            ..${/}Common${/}a_import_all_common_SFCC.resource
*** Keywords ***

Finalize Order
    Wait For Elements State     ${shoppingBasketPage_finalize_your_order_button}   visible
    Click    ${shoppingBasketPage_finalize_your_order_button}
    sleep  1S
    ${return_status}=        Check If Element Is Visible And Warn If Not    ${shoppingBasketPage_log_in}
    IF    $return_status == 'PASS'
           Click        ${shoppingBasketPage_log_in}
    END

Click Calculate And See Points
    Click    ${orderSummaryPage_calculate}
    ${earned_points}                          Get Text        ${orderSummaryPage_earned}
    ${earned_points}                          Evaluate        float("${earned_points}".replace("pts", "").replace(",", "").strip())
    Set To Dictionary  ${canonical_form_transaction_link_files}   \${currentPointsWhileFinalizingOrder}  ${earned_points}

Verify my points calculate
        [Arguments]          ${expectedpoints}  ${currentPoints}
        Should Be Equal      ${expectedpoints}  ${currentPoints}
