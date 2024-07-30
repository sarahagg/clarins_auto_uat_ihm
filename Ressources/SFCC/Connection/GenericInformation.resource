*** Settings ***
Documentation       all the keywords needed to create a newsletter

Resource            ..${/}..${/}..${/}Ressources${/}SFCC${/}Common${/}common.resource


*** Keywords ***
Enter Email
    [Arguments]    ${Email}

    IF    $Email == 'default'    RETURN    ${default_values.EMAIL}

    RETURN    ${Email}

Enter Password
    [Arguments]    ${mypassword}

    IF    $mypassword == 'default'    RETURN    ${default_values.password}

    RETURN    ${mypassword}
