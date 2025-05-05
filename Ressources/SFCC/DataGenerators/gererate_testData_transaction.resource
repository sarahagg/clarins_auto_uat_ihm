*** Settings ***
Documentation       All the keywords to generate test data for the test case createAccount

Resource    ..${/}Common${/}a_import_all_common_SFCC.resource

*** Keywords ***
Generate Test Data Transaction
      [Arguments]
                                             ...    ${address}
                                             ...    ${postalCode}
                                             ...    ${city}
                                             ...    ${billingAdress}
                                             ...    ${DPDdelivery}
                                             ...    ${inPostPickUp}
                                             ...    ${marketingConsent}
                                             ...    ${country}
                                             ...    ${productList}
                                             ...    ${expectedpoints}

    Set To Dictionary    ${canonical_form_transaction_link_files}       \${email}               ${canonical_form_contact_link_files.get('\${email}')}
    Set To Dictionary    ${canonical_form_transaction_link_files}       \${country}             ${canonical_form_contact_link_files.get('\${country}')}
    Set To Dictionary    ${canonical_form_transaction_link_files}       \${address}              ${address}
    Set To Dictionary    ${canonical_form_transaction_link_files}       \${postalCode}          ${postalCode}
    Set To Dictionary    ${canonical_form_transaction_link_files}       \${city}                ${city}
    Set To Dictionary    ${canonical_form_transaction_link_files}       \${billingAdress}       ${billingAdress}
    Set To Dictionary    ${canonical_form_transaction_link_files}       \${DPDdelivery}         ${DPDdelivery}
    Set To Dictionary    ${canonical_form_transaction_link_files}       \${inPostPickUp}        ${inPostPickUp}
    Set To Dictionary    ${canonical_form_transaction_link_files}       \${marketingConsent}    ${marketingConsent}
    Set To Dictionary    ${canonical_form_transaction_link_files}       \${productList}        ${productList}
    Set To Dictionary    ${canonical_form_transaction_link_files}       \${expectedpoints}      ${expectedpoints}
