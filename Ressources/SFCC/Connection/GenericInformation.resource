*** Settings ***
Documentation       all the keywords needed to create a newsletter
Resource            ..${/}..${/}..${/}Ressources${/}SFCC${/}Common${/}common.resource

*** Keywords ***
Enter Email
    [Arguments]    ${Email}

    IF  $Email == 'default'
        RETURN    emailderesr@gmail.com
    END


    RETURN          ${Email}


Enter Password
    [Arguments]    ${mypassword}

    IF  $mypassword == 'default'
        RETURN    azerty12ui
    END

    RETURN          ${mypassword}