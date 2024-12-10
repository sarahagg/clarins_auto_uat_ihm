*** Settings ***
Documentation       all the keywords needed to navigate on the header menu

Resource            ..${/}..${/}Common${/}a_import_all_common_CLM.resource


*** Keywords ***
Access Change Fidelity Program Popup
    Click    ${headerMenu_profil_icon}
    Click    ${headerMenu_changeLoyaltyProgram_button}

