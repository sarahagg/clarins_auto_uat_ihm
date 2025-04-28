*** Settings ***
Documentation       All the keywords to generate test data for the test case createAccount

Resource    ..${/}Common${/}a_import_all_common_SFCC.resource

*** Keywords ***
Generate Test Data Transaction
      [Arguments]
                                             ...    ${adress}
                                             ...    ${postalCode}
                                             ...    ${city}
                                             ...    ${billingAdress}
                                             ...    ${DPDdelivery}
                                             ...    ${inPostPickUp}
                                             ...    ${marketingConsent}
                                             ...    ${country}
                                             ...    ${PRODUCT_LIST}
                                             ...    ${expectedpoints}

    Set To Dictionary    ${canonical_form_transaction_link_files}       \${email}               ${canonical_form_contact_link_files.get('\${email}')}
    Set To Dictionary    ${canonical_form_transaction_link_files}       \${country}             ${canonical_form_contact_link_files.get('\${country}')}
    Set To Dictionary    ${canonical_form_transaction_link_files}       \${adress}              ${canonical_form_contact_link_files.get('\${adress}')}
    Set To Dictionary    ${canonical_form_transaction_link_files}       \${postalCode}          ${canonical_form_contact_link_files.get('\${postalCode}')}
    Set To Dictionary    ${canonical_form_transaction_link_files}       \${city}                ${canonical_form_contact_link_files.get('\${city}')}
    Set To Dictionary    ${canonical_form_transaction_link_files}       \${billingAdress}       ${canonical_form_contact_link_files.get('\${billingAdress}')}
    Set To Dictionary    ${canonical_form_transaction_link_files}       \${DPDdelivery}         ${canonical_form_contact_link_files.get('\${DPDdelivery}')}
    Set To Dictionary    ${canonical_form_transaction_link_files}       \${inPostPickUp}        ${canonical_form_contact_link_files.get('\${inPostPickUp}')}
    Set To Dictionary    ${canonical_form_transaction_link_files}       \${marketingConsent}    ${canonical_form_contact_link_files.get('\${marketingConsent}')}
    Set To Dictionary    ${canonical_form_transaction_link_files}       \${PRODUCT_LIST}        ${canonical_form_contact_link_files.get('\${PRODUCT_LIST}')}
    Set To Dictionary    ${canonical_form_transaction_link_files}       \${expectedpoints}      ${canonical_form_contact_link_files.get('\${expectedpoints}')}
