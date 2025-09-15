*** Settings ***
Documentation       But du Test
...                 Vérifier l'inscription à la Newsletter

Resource            ..${/}..${/}..${/}Ressources${/}SFCC${/}Common${/}a_import_all_common_SFCC.resource
Library             DataDriver    file=..${/}..${/}..${/}Ressources${/}SFCC${/}TestData${/}FROM_SFCC${/}1_subscribeNewsletter.xlsx    sheet_name=Test Cases

Test Template       Subscribe To The Newsletter
Test Setup          Initialize Test Context
Test Teardown       Close Browser

Force Tags          SFCC_FROM_SFCC_1_newsletterOfferPage

*** Variables ***
${HIGHLIGHT_STYLE}    element.style.border = '3px solid red'; element.style.backgroundColor = 'yellow';

*** Test Cases ***
Default Values If No Data    NO    NA    NA   NA


*** Keywords ***
Subscribe To The Newsletter
    [Arguments]
        ...    ${playTest}
        ...    ${email}
        ...    ${country}
        ...    ${allCheckSystems}

    ${country} =  Set Test Variable    ${country}

    IF    $playTest == "YES"
        Generate Test Data Newsletter
                                        ...    ${email}
        Generate Test Data Last Interaction Date      contactProfileUpdate

        Initialize SFCC Website Context
        Access And Complete Newsletter Footer Form
        #Verify Newsletter Subscription

        Write Data To Link CSV Files    contact               SFCC    ${allCheckSystems}    subscribeNewsletter
        Write Data To Link CSV Files    lastInteractionDate   SFCC    ${allCheckSystems}    subscribeNewsletter
    END
