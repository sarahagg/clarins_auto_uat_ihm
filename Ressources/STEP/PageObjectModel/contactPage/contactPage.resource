*** Settings ***
Documentation       all the keywords needed to interact with the contact

Resource            ..${/}..${/}Common${/}a_import_all_common_STEP.resource


*** Keywords ***
Save Contact
    Click    ${contactPage_save_button}