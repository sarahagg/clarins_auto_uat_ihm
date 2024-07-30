*** Settings ***
Documentation       all the keywords needed to modify a user's information on STEP

Resource            ..${/}..${/}..${/}Ressources${/}STEP/Common${/}common.resource


*** Keywords ***
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
    Click    ${loc_add_consent}
    ModifyOptin    ${loc_consent_first}    ${Optin}

Delete Consent
    Click    ${loc_consent_first}
    Click    ${loc_delete_consent}
    Click    ${loc_phone_continuer}
