*** Settings ***
Force Tags          Link-SFCC
Documentation       But du Test
...                 Vérifier que la création d'un nouveau compte se passe bien
...                 python3 -m robot  -d "Resultats/New-account/logs" -v ENV:UAT  -i "New-account" Tests
Library             DataDriver      file=..${/}..${/}Jeux de donnees${/}SFCC${/}New-account${/}jdd-New-account.xlsx
Resource            ..${/}..${/}Ressources${/}LINKSFCC${/}common.resource
Test Template       Link SFCC
*** Test Cases ***
Test Par Defaut Si Aucune Donnee

*** Keywords ***
   # Clear CSV File   ${CSV_FILE}
Link SFCC
    [Arguments]  ${playTest}   ${FirstName}     ${LastName}     ${Email}      ${mypassword}   ${BirthDate}  ${country}   ${emailOption}    ${isLoyaltyMember}   ${salutation}  ${regions}

    IF    $playTest == "YES"
        Authentificate and accept cookies   ${country}
        sleep  1s
        ${generated_data}=   Creation de compte   ${FirstName}     ${LastName}     ${Email}    ${mypassword}   ${BirthDate}   ${country}    ${emailOption}    ${isLoyaltyMember}    ${salutation}    ${regions}
        Write Data     ${CSV_FILE}    ${generated_data}
        sleep   5s
        Close Browser
    END

