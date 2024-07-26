*** Settings ***
Documentation       all the keywords needed to verify a user's information on STEP
Resource            ..${/}..${/}..${/}Ressources${/}STEP${/}Common${/}common.resource

*** Keywords ***
Verify
    [Arguments]   ${ClarinscontactID}   ${Brand}  ${Country}   ${IsGuest}  ${gender}  ${salutation}  ${FirstName}  ${localFirstName}  ${LastName}  ${localLastName}   ${BirthDate}  ${Language}  ${Nationality}  ${isRegistered}  ${IsLoyaltyMember}  ${isAnonymized}  ${isFrozen}  ${Email}

    ${GetcontactID}=           Get Text                                ${loc_ClarinscontactId}
    Should Contain             ${ClarinscontactID}                     ${GetcontactID}

    ${GetBrand}=               Get Text                                ${loc_Brand}
    Should Contain             ${Brand}                                ${GetBrand}

    ${GetCountry}=             Get Text                                ${loc_Country}
    Should Contain             ${Country}                              ${GetCountry}

    Click                       ${loc_isGuest_history}
    ${GetIsGuest}=              Get Text                                ${loc_isGuest}
    ${IsGuest}=                 Set Variable                            ${IsGuest}
    Should Contain              ${IsGuest}                              ${GetIsGuest}
    Mouse Button                down

    Click                       ${loc_gender_history}
    ${Getgender}=               Get Text                                ${loc_gender}
    ${gender}=                  Set Variable                            ${gender}
    Should Contain              ${gender}                               ${Getgender}
    Mouse Button                down

    ${Getsalutation}=           Get Text                                ${loc_salutation}
    Should Contain              ${salutation}                           ${Getsalutation}

    ${GetFirstName}=            Get Text                                ${loc_FirstName}
    Should Contain              ${FirstName}                            ${GetFirstName}

    ${GetlocalFirstName}=       Get Text                                ${loc_localFirstName}
    Should Contain              ${localFirstName}                       ${GetlocalFirstName}

    ${GetLastName}=             Get Text                                ${loc_LastName}
    Should Contain              ${LastName}                             ${GetLastName}

    ${GetlocalLastName}=        Get Text                                ${loc_localLastName}
    Should Contain              ${localLastName}                        ${GetlocalLastName}

    ${GetBirthDate}=            Get Text                                ${loc_BirthDate}
    Should Contain              ${BirthDate}                            ${GetBirthDate}

    ${GetLanguage}=             Get Text                                ${loc_Language}
    Should Contain              ${Language}                             ${GetLanguage}

    ${GetNationality}=          Get Text                                ${loc_Nationality}
    Should Contain              ${Nationality}                          ${GetNationality}

    Click                       ${loc_isRegistered_history}
    ${GetisRegistered}=         Get Text                                ${loc_isRegistered}
    Should Contain              ${isRegistered}                         ${GetisRegistered}
    Mouse Button                down

    Click                       ${loc_IsLoyaltyMember_history}
    ${GetIsLoyaltyMember}=      Get Text                                ${loc_IsLoyaltyMember}
    Should Contain              ${IsLoyaltyMember}                      ${GetIsLoyaltyMember}
    Mouse Button                down

    ${GetisAnonymized}=         Get Text                                ${loc_isAnonymized}
    Should Contain              ${isAnonymized}                         ${GetisAnonymized}

    ${GetisFrozen}=             Get Text                                ${loc_isFrozen}
    Should Contain              ${isFrozen}                             ${GetisFrozen}

    ${GetEmail}=                Get Text                                ${loc_Email}
    Should Contain              ${Email}                                ${GetEmail}
