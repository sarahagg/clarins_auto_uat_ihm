*** Settings ***
Documentation       all the keywords needed to login to the website and accept the cookies
Resource            ..${/}..${/}..${/}Ressources${/}SFCC${/}Common${/}common.resource

*** Keywords ***
Generate FirstName
    [Arguments]    ${FirstName}

    IF  $FirstName == 'default'
        RETURN    sarah
    END

    IF  $FirstName == 'auto'
        ${random_FirstName}=  Run Keyword    FakerLibrary.First Name
        RETURN    ${random_FirstName}
    END

    RETURN     ${FirstName}

Generate lastName
    [Arguments]    ${LastName}

    IF  $LastName == 'default'
        RETURN    sarah
    END

    IF  $LastName == 'auto'
        ${random_LastName}=     Run Keyword    FakerLibrary.Last Name
        RETURN    ${random_LastName}
    END

    RETURN     ${LastName}

Generate Email
    [Arguments]    ${Email}

    IF  $Email == 'auto'
        ${Email}=     Run Keyword    FakerLibrary.Email
        RETURN    ${Email}
    END

    RETURN     ${Email}


Generate Password
    [Arguments]    ${mypassword}

    IF  $mypassword== 'auto'
        ${random-mypassword}=     Run Keyword    FakerLibrary.Name
        RETURN    ${random-mypassword}
    END

    RETURN     ${mypassword}
Generate BirthDate
    [Arguments]    ${BirthDate}

    IF  $BirthDate == 'default' or $BirthDate == 'auto'
        ${random_BirthDate}=     Run Keyword    FakerLibrary.Date Of Birth
        RETURN    ${random_BirthDate}
    END

    RETURN     ${BirthDate}

