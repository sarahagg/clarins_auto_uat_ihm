*** Settings ***
Documentation       all the keywords needed to navigate on the Home Page

Resource            ..${/}Common${/}a_import_all_common_SFCC.resource
Library    RPA.Archive

*** Keywords ***

Finalize Order

    Wait For Elements State     ${shoppingBasketPage_finalize_your_order_button}   visible
    Click    ${shoppingBasketPage_finalize_your_order_button}
    sleep  1S

Order Summary Calculation

     Click    ${orderSummaryPage_calculate}

    ${estimated_total}    Get Text    ${orderSummaryPage_estimated_total}
    ${estimated_total}    Evaluate    float("${estimated_total}".replace("AED", "").replace(",", "").strip())

    ${tax}                Get Text    ${orderSummaryPage_tax}
    ${tax}                Evaluate    float("${tax}".replace("AED", "").replace(",", "").strip())

    ${earned_points}      Get Text    ${orderSummaryPage_earned}
    ${earned_points}      Evaluate    float("${earned_points}".replace("pts", "").replace(",", "").strip())

    ${expected_points}    Evaluate    round(${estimated_total} - ${tax})

    log  la difference est : ${expected_points}
    Log  lo montant doit etre : ${earned_points}

    Should Be Equal As Numbers    ${earned_points}    ${expected_points}

See Points And Calculate
    Click    ${orderSummaryPage_calculate}

    ${earned_points}      Get Text    ${orderSummaryPage_earned}
    ${earned_points}      Evaluate    float("${earned_points}".replace("pts", "").replace(",", "").strip())

    ${points}=             Set Variable     ${earned_points}