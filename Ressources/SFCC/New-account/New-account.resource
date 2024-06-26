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
