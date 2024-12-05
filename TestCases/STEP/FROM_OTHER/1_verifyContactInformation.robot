*** Settings ***
Documentation       But du Test
...                 verifier que la création d'un compte est faite sur STEP


Resource            ..${/}..${/}..${/}Ressources${/}STEP${/}Common${/}a_import_all_common_STEP.resource
Library             DataDriver    file=..${/}..${/}..${/}Ressources${/}LINK${/}LinkFiles${/}link_csv_file_from_${sourceSystem}_to_${oneCheckSystem}_for_${testScenario}.csv    encoding=utf_8

Test Template       Verify Contact Information

Force Tags          STEP_FROM_OTHER_1_verifyContactInformation


*** Test Cases ***
Default Test If No Data


*** Keywords ***
Verify Contact Information
    [Arguments]    ${email}
            ...    ${salutation}
            ...    ${firstName}
            ...    ${lastName}
            ...    ${password}
            ...    ${phoneNumber}
            ...    ${birthDate}
            ...    ${emailOptin}
            ...    ${SMSOptin}
            ...    ${isLoyaltyMember}
            ...    ${country}

        Log    ${firstName} / ${lastName}

#    IF    '${country}' in @{touch_countries}
#
#        Authentificate
#        access contact page    ${Email}
#        VerifyLINK
#        ...    ${FirstName}
#        ...    ${LastName}
#        ...    ${Email}
#        ...    ${BirthDate}
#        ...    ${country}
#        ...    ${salutation}
#        ...    ${emailOption}
#        ...    ${isLoyaltyMember}
#        Sleep    5s
#        Close Browser
#    END
