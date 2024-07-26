*** Settings ***
Documentation   here are all the common variables
Resource        ..${/}..${/}..${/}Ressources${/}STEP${/}Common${/}common.resource

*** Variables ***

${ENV}
${STEP_BROWSER}             chromium
${STEP_USERNAME}            SAGGOUR
${STEP_PASSWORD}            saggour24042024
${PAGE_URL}                 https://clarins-qa.mdm.stibosystems.com/
${SearchItem}               UC1_UAT@gg.com

@{lov_OptinChannel}    captainWallet (captainWallet)  email (email)  phoneHome (phoneHome)  phoneMobileSMS (phoneMobileSMS)   phoneMobileVoice (phoneMobileVoice)   phoneOffice (phoneOffice)   postalAddress (postalAddress)   profiling (profiling)   socialMediaFacebook (socialMediaFacebook)   socialMediaInstagram (socialMediaInstagram)  socialMediaLINE (socialMediaLINE)   socialMediaTwitter (socialMediaTwitter)   socialMediaWeChat (socialMediaWeChat)   socialMediaWhatsApp (socialMediaWhatsApp)
@{lov_Optin}           yes (yes)   waiting (waiting)   no (no)
@{lov_phonetype}            home (home)   mobile (mobile)  office (office)


&{full_country}            UK=United Kingdom
...                        FRA=France
...                        BNL=Benelux
...                        USA=United States
...                        CHE=Suisse
...                        ITA=Italy

&{translate_salutation}    Mlle=Ms
...                        M=Mr
...                        Mme=Mrs

&{yes_no}                  Yes=true
...                        NO=false
