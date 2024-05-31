*** Settings ***
Documentation       all the keywords needed to login to the website and accept the cookies
Resource            ..${/}..${/}..${/}Ressources${/}SFCC${/}Common${/}common.resource

*** Keywords ***
Creation de compte
    [Arguments]    ${FirstName}     ${LastName}     ${Email}        ${mypassword}   ${BirthDate}

    Log To Console              clicking the connexion button
    Click                       ${connexion_button}
    Log To Console              connexion page
    ${Email}=                   Generate Email               ${Email}
    Fill text                   ${insert_email}              ${Email}
    Click                       ${remember}
    Click                       ${continuer}

    #First name
    ${FirstName}=               Generate FirstName          ${FirstName}
    Fill Text                   ${First_Name_field}         ${FirstName}

    #last name
    ${LastName}=                Generate lastName           ${LastName}
    Fill Text                   ${last_name_field}          ${LastName}

    #email
    Click                       ${email_div}

    #password
    ${mypassword}=              Generate Password           ${mypassword}
    Fill Secret                 ${account_password}         $mypassword

    #birthday
    ${BirthDate}=               Generate BirthDate          ${BirthDate}
    Fill Text                   ${birthday}                 ${BirthDate}
    Wait For Elements State     ${date_invalide}            hidden    timeout=1s

    #boutton
    Log To Console              recevoir des informations
    Click                       ${boutton1}
    Log To Console              Club Clarins
    Click                       ${boutton2}

    #submit
    Click                       ${submit}
    Wait For Elements State     ${nextPage}     visible
    ${PAGE_URL}=  Get Url
    Wait For    ${TARGET_PAGE_URL}== ${PAGE_URL}
    close browser
