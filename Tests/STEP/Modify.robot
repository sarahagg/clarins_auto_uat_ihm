*** Settings ***
Force Tags          modify
Documentation       But du Test
...                 Se connecter sur STEP
...                 python3 -m robot  -d "Resultats/STEP/Modify" -v ENV:UAT  -i "modify" Tests
Resource            ..${/}..${/}Ressources${/}STEP${/}Common${/}common.resource
Library             DataDriver      file=..${/}..${/}Jeux de donnees${/}STEP${/}jdd-Modification.xlsx
Test Template       Modifier

*** Test Cases ***
Test Par Defaut Si Aucune Donnee

*** Keywords ***

Modifier
    [Arguments]   ${playTest}   ${Email}   ${IsGuest}  ${gender}  ${salutation}  ${FirstName}  ${localFirstName}  ${LastName}  ${localLastName}   ${BirthDate}  ${Language}  ${Nationality}  ${IsLoyaltyMember}  ${NewEmail}  ${OptinChannel}  ${Optin}  ${phoneNumber}  ${phoneType}


     IF    $playTest == "YES"
     Authentificate   ${Email}
     Modify     ${IsGuest}  ${gender}  ${salutation}  ${FirstName}  ${localFirstName}  ${LastName}  ${localLastName}   ${BirthDate}  ${Language}  ${Nationality}  ${IsLoyaltyMember}  ${NewEmail}   ${OptinChannel}  ${Optin}  ${phoneNumber}  ${phoneType}
     Sleep    5s
     Close Browser
    END
