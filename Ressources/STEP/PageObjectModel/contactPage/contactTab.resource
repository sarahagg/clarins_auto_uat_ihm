*** Settings ***
Documentation       all the keywords needed to check and modify a user's information on STEP

Resource            ..${/}..${/}Common${/}a_import_all_common_STEP.resource


*** Keywords ***
Verify Contact Info
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

    IF    '${country}' != '${EMPTY}'
        ${GetCountry}=    Get Text    ${contactTab_country_value}
        Should Contain    ${full_country.${country}}    ${GetCountry}
    END

    IF    '${salutation}' != '${EMPTY}'
        ${GetSalutation}=    Get Text    ${contactTab_salutation_value}
        Should Contain    ${translate_salutation.${salutation}}    ${GetSalutation}
    END

    IF    '${firstName}' != '${EMPTY}'
        ${GetFirstName}=    Get Text    ${contactTab_firstName_value}
        ${is_equal}=    Normalize And Compare    ${firstName}    ${GetFirstName}
        Should Be True    ${is_equal}
    END

    IF    '${lastName}' != '${EMPTY}'
        ${GetLastName}=    Get Text    ${contactTab_lastName_value}
        ${is_equal}=    Normalize And Compare    ${lastName}    ${GetLastName}
        Should Be True    ${is_equal}
    END

    IF    '${birthDate}' != '${EMPTY}'
        ${GetBirthDate}=    Get Text    ${contactTab_birthDate_value}
        Should Contain    ${birthDate}    ${GetBirthDate}
    END

    IF    '${isLoyaltyMember}' != '${EMPTY}'
        Click    ${contactTab_isLoyaltyMember_history_button}
        ${GetIsLoyaltyMember}=    Get Text    ${contactTab_isLoyaltyMember_value}
        Should Contain    ${yes_no.${isLoyaltyMember}}    ${GetIsLoyaltyMember}
        Mouse Button    down
    END

    IF    '${email}' != '${EMPTY}'
        ${GetEmail}=    Get Text    ${contactTab_email_value}
        Should Contain    ${email}    ${GetEmail}
    END

Modify Salutation
    [Arguments]    ${salutation}
    IF    len($salutation)>0
        Click    ${loc_salutation}
        Fill text    ${loc_salutation}    ${salutation}
    END

Modify FirstName
    [Arguments]    ${FirstName}
    IF    len($FirstName)>0
        Click    ${loc_FirstName}
        Fill text    ${loc_FirstName}    ${FirstName}
    END

Modify LastName
    [Arguments]    ${LastName}
    IF    len($LastName)>0
        Click    ${loc_LastName}
        Fill text    ${loc_LastName}    ${LastName}
    END

Modify BirthDate
    [Arguments]    ${BirthDate}
    IF    len($BirthDate)>0
        Click    ${loc_BirthDate}
        Fill text    ${loc_BirthDate}    ${BirthDate}
    END

Modify Language
    [Arguments]    ${Language}
    IF    len($Language)>0
        Click    ${loc_Language}
        Fill text    ${loc_Language}    ${Language}
    END

Modify Email
    [Arguments]    ${NewEmail}
    IF    len($NewEmail)>0
        Click    ${loc_Email}
        Click    ${loc_email_input}
        Fill text    ${loc_email_input}    ${NewEmail}
        Click    ${loc_continuer}
    END

Modify Consent
    [Arguments]    ${OptinChannel}    ${Optin}
    IF    len($Optin)>0
        ${elements}=    Get Elements    ${all_consent}
        FOR    ${element}    IN    @{elements}
            Click    ${element}
            ModifyOptin    ${OptinChannel}    ${Optin}
            # ModifyOptin    ${loc_consent_first}    ${Optin}
        END
    END

Modify Is Guest
    [Arguments]    ${IsGuest}
    IF    len($IsGuest) > 0
        IF    $IsGuest == 'false'
            select Options By    ${loc_isGuest_modif}    text    false
        ELSE IF    $IsGuest == 'true'
            select Options By    ${loc_isGuest_modif}    text    true
        END
    END

Modify IsLoyaltyMember
    [Arguments]    ${IsLoyaltyMember}
    IF    len($IsLoyaltyMember)>0
        IF    $IsLoyaltyMember == 'false'
            select Options By    ${loc_IsLoyaltyMember_modif}    text    false
        ELSE IF    $IsLoyaltyMember == 'true'
            select Options By    ${loc_IsLoyaltyMember_modif}    text    true
        END
    END

Modify Gender
    [Arguments]    ${Gender}
    IF    len($Gender)>0
        IF    $Gender == 'Female'
            select Options By    ${loc_gender_modif}    text    Female
        ELSE IF    $Gender == 'Male'
            select Options By    ${loc_gender_modif}    text    Male
        ELSE IF    $Gender == 'X'
            select Options By    ${loc_gender_modif}    text    X
        END
    END

Modify Optin
    [Arguments]    ${OptinChannel}    ${Optin}

    # optinChannel
    IF    len($OptinChannel)>0
        IF    $OptinChannel == 'captainWallet (captainWallet)'
            select Options By    ${loc_OptinChannel}    text    captainWallet (captainWallet)
        ELSE IF    $OptinChannel == 'email (email)'
            select Options By    ${loc_OptinChannel}    text    email (email)
        ELSE IF    $OptinChannel == 'phoneHome (phoneHome)'
            select Options By    ${loc_OptinChannel}    text    phoneHome (phoneHome)
        ELSE IF    $OptinChannel == 'phoneMobileSMS (phoneMobileSMS)'
            select Options By    ${loc_OptinChannel}    text    phoneMobileSMS (phoneMobileSMS)
        ELSE IF    $OptinChannel == 'phoneMobileVoice (phoneMobileVoice)'
            select Options By    ${loc_OptinChannel}    text    phoneMobileVoice (phoneMobileVoice)
        ELSE IF    $OptinChannel == 'phoneOffice (phoneOffice)'
            select Options By    ${loc_OptinChannel}    text    phoneOffice (phoneOffice)
        ELSE IF    $OptinChannel == 'postalAddress (postalAddress)'
            select Options By    ${loc_OptinChannel}    text    postalAddress (postalAddress)
        ELSE IF    $OptinChannel == 'profiling (profiling)'
            select Options By    ${loc_OptinChannel}    text    profiling (profiling)
        ELSE IF    $OptinChannel == 'socialMediaFacebook (socialMediaFacebook))'
            select Options By    ${loc_OptinChannel}    text    socialMediaFacebook (socialMediaFacebook)
        ELSE IF    $OptinChannel == 'socialMediaInstagram (socialMediaInstagram)'
            select Options By    ${loc_OptinChannel}    text    socialMediaInstagram (socialMediaInstagram)
        ELSE IF    $OptinChannel == 'socialMediaLINE (socialMediaLINE)'
            select Options By    ${loc_OptinChannel}    text    socialMediaLINE (socialMediaLINE)
        ELSE IF    $OptinChannel == 'socialMediaTwitter (socialMediaTwitter)'
            select Options By    ${loc_OptinChannel}    text    socialMediaTwitter (socialMediaTwitter)
        ELSE IF    $OptinChannel == 'socialMediaWeChat (socialMediaWeChat))'
            select Options By    ${loc_OptinChannel}    text    socialMediaWeChat (socialMediaWeChat)
        ELSE IF    $OptinChannel == 'socialMediaWhatsApp (socialMediaWhatsApp)'
            select Options By    ${loc_OptinChannel}    text    socialMediaWhatsApp (socialMediaWhatsApp)
        ELSE IF    $OptinChannel == 'auto'
            ${randomOptinChoice}    Evaluate    random.choice($lov_OptinChannel)
            select Options By    ${loc_OptinChannel}    text    ${randomOptinChoice}
        END
    END
    # optin
    IF    len($Optin)>0
        IF    $Optin == 'yes (yes)'
            select Options By    ${loc_Optin}    text    yes (yes)
        ELSE IF    $Optin == 'waiting (waiting)'
            select Options By    ${loc_Optin}    text    waiting (waiting)
        ELSE IF    $Optin == 'no (no))'
            select Options By    ${loc_Optin}    text    no (no)
        ELSE IF    $Optin == 'auto'
            ${randomOptinChoice}    Evaluate    random.choice($lov_Optin)
            select Options By    ${loc_Optin}    text    ${randomOptinChoice}
        END
    END
    Click    ${loc_phone_continuer}

Modify PhoneInfos
    [Arguments]    ${phoneNumber}    ${phoneType}

    IF    len($phoneNumber)>0
        Click    ${loc_phone}
        Fill Text    ${loc_phoneNumber}    ${phoneNumber}
    END
    IF    len($phoneType)>0
        IF    $phoneType == 'home (home)'
            select Options By    ${loc_phoneType}    text    home (home)
        ELSE IF    $phoneType == 'mobile (mobile)'
            select Options By    ${loc_phoneType}    text    mobile (mobile)
        ELSE IF    $phoneType == 'office (office)'
            select Options By    ${loc_phoneType}    text    office (office)
        ELSE IF    $phoneType == 'auto'
            ${randonPhoneType}    Evaluate    random.choice($lov_phonetype)
            select Options By    ${loc_phoneType}    text    ${randonPhoneType}
        END
    END
    Click    ${loc_phone_continuer}

Create Consent
    [Arguments]    ${loc_consent_first}    ${Optin}
    Click          ${loc_add_consent}
    Modify Optin    ${loc_consent_first}    ${Optin}

Delete Consent
    Click    ${loc_consent_first}
    Click    ${loc_delete_consent}
    Click    ${loc_phone_continuer}

