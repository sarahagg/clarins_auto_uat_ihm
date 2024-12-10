*** Settings ***
Documentation       all the keywords needed to initialize the website context

Resource            a_import_all_common_CLM.resource


*** Keywords ***
Initialize CLM Website Context
    Log    Instantiate A New Browser
    New Browser    ${BROWSER}    headless=${headless}    reuse_existing=${False}    slowMo=0:00:02
    New Page    ${PAGE_URL}

    # Wait for the login page to fully appear
    ${return_status}=   Check If Element Is Visible And Warn If Not    ${loginPage_username_input}
    WHILE    $return_status == 'FAIL'    limit=${number_of_retry_to_wait_an_element}    on_limit=pass
        Log    Waiting for the login page to appear
        ${return_status}=   Check If Element Is Visible And Warn If Not    ${loginPage_username_input}
    END
