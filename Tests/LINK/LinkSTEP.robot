*** Settings ***
Force Tags          Link-STEP
Documentation       But du Test
...                 Vérifier que la création d'un nouveau compte se passe bien
...                 python3 -m robot  -d "Resultats/New-account/logs" -v ENV:UAT  -i "New-account" Tests
Library             DataDriver      file=..${/}..${/}Jeux de donnees${/}LINKFILES.csv
Resource            ..${/}..${/}Ressources${/}LINKSTEP${/}common.resource
Test Template       Verify Account

*** Test Cases ***
Test Par Defaut Si Aucune Donnee

*** Keywords ***

Verify Account
    [Arguments]     ${FirstName}   ${LastName}   ${Email}   ${BirthDate}   ${country}  ${salutation}  ${regions}  ${emailOption}   ${isLoyaltyMember}


     IF   $country != 'CHE' and $country != 'BNL'
        Authentificate   ${Email}
        VerifyLINK       ${FirstName}   ${LastName}   ${Email}   ${BirthDate}   ${country}  ${salutation}  ${regions}  ${emailOption}   ${isLoyaltyMember}
        Sleep    5s
        Close Browser
     END