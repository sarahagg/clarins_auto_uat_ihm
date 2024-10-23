*** Settings ***
Documentation       all the keywords needed to verify a user's information on STEP

Resource            ..${/}..${/}Ressources${/}LinkSTEP_NewAccount${/}common.resource


*** Keywords ***
Verify LINK
    [Arguments]
    ...    ${FirstName}
    ...    ${LastName}
    ...    ${Email}
    ...    ${BirthDate}
    ...    ${country}
    ...    ${salutation}
    ...    ${regions}
    ...    ${emailOption}
    ...    ${isLoyaltyMember}

    ${GetCountry}=    Get Text    ${loc_Country}
    IF    $country == 'BNL'
        Should Contain    ${full_country.${regions}}    ${GetCountry}
    ELSE
        Should Contain    ${full_country.${country}}    ${GetCountry}
    END


    ${Getsalutation}=    Get Text    ${loc_salutation}
    Should Contain    ${translate_salutation.${salutation}}    ${Getsalutation}

    ${GetFirstName}=    Get Text    ${loc_FirstName}
    ${is_equal}=    Normalize And Compare    ${FirstName}    ${GetFirstName}
    Should Be True    ${is_equal}

    ${GetLastName}=    Get Text    ${loc_LastName}
    ${is_equal}=    Normalize And Compare    ${LastName}    ${GetLastName}
    Should Be True    ${is_equal}

    ${GetBirthDate}=    Get Text    ${loc_BirthDate}
    Should Contain    ${BirthDate}    ${GetBirthDate}

    Click    ${loc_IsLoyaltyMember_history}
    ${GetIsLoyaltyMember}=    Get Text    ${loc_IsLoyaltyMember}
    Should Contain    ${yes_no.${IsLoyaltyMember}}    ${GetIsLoyaltyMember}
    Mouse Button    down

    ${GetEmail}=    Get Text    ${loc_Email}
    Should Contain    ${Email}    ${GetEmail}
