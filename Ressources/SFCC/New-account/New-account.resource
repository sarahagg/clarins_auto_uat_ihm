*** Settings ***
Documentation       all the keywords needed to login to the website and accept the cookies
Resource            ..${/}..${/}..${/}Ressources${/}SFCC${/}Common${/}common.resource

*** Keywords ***
Creation de compte
    [Arguments]    ${FirstName}     ${LastName}     ${Email}    ${mypassword}   ${BirthDate}   ${country}   ${emailOption}  ${isLoyaltyMember}  ${salutation}   ${regions}

    Import FakerLibrary         ${country}

    Connection Button           ${country}
    FillEmail                   ${Email}
    FillSalutation              ${salutation}    ${country}
    FillFirstname               ${FirstName}
    FillLastName                ${LastName}
    Click                       ${email_div}
    FillPassword                ${mypassword}
    FillBirthdate               ${BirthDate}
    FillBNL                     ${country}   ${region}  ${regions}
    FillButtons                 ${emailOption}   ${isLoyaltyMember}  ${country}

    Click                       ${submit}

    #Verify that the account was created successfuly
    VerifyCreation              ${country}

Create Account
    [Arguments]    ${data}
    Open Browser    https://first-webpage.com    chrome
    New Page    https://first-webpage.com/register
    ${generated_data}=    Create New Account    ${data}
    Write Data To CSV    ${CSV_FILE}    ${generated_data}
    Close Browser

Create New Account
    [Arguments]    ${data}
    ${generated_username}=    Generate Username
    ${generated_password}=    Generate Password
    Fill Form    username    ${generated_username}
    Fill Form    password    ${generated_password}
    Submit Form
    ${result}=    Wait For Request
    [Return]    ${generated_username},${generated_password}