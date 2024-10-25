*** Settings ***
Documentation       All the common resources
...                 All the different libraries
...                 All the different resources
...                 All the different variables

Library             Browser    run_on_failure=Take Screenshot \ EMBED     timeout=0:00:30
Library             KeePassLibrary
Library             OperatingSystem
Library             DateTime
Library             Collections
Library             String


*** Variables ***
${ENV}                      ${EMPTY}
${BROWSER}                  chromium

${csv_file_Newaccount_STEP}         ${CURDIR}${/}..${/}..${/}Jeux de donnees${/}LINKFILENEWACCOUNT_STEP.csv
${csv_file_Newaccount_CLM}          ${CURDIR}${/}..${/}..${/}Jeux de donnees${/}LINKFILENEWACCOUNT_CLM.csv
${csv_file_Newaccount_ADOBE}        ${CURDIR}${/}..${/}..${/}Jeux de donnees${/}LINKFILENEWACCOUNT_ADOBE.csv
${csv_file_Newaccount_Y2}           ${CURDIR}${/}..${/}..${/}Jeux de donnees${/}LINKFILENEWACCOUNT_Y2.csv

${csv_file_Newsletter_STEP}         ${CURDIR}${/}..${/}..${/}Jeux de donnees${/}LINKFILENEWSLETTER_STEP.csv
${csv_file_Newsletter_ADOBE}        ${CURDIR}${/}..${/}..${/}Jeux de donnees${/}LINKFILENEWSLETTER_ADOBE.csv


@{lov_OptinChannel}         captainWallet (captainWallet)
...                         email (email)
...                         phoneHome (phoneHome)
...                         phoneMobileSMS (phoneMobileSMS)
...                         phoneMobileVoice (phoneMobileVoice)
...                         phoneOffice (phoneOffice)
...                         postalAddress (postalAddress)
...                         profiling (profiling)
...                         socialMediaFacebook (socialMediaFacebook)
...                         socialMediaInstagram (socialMediaInstagram)
...                         socialMediaLINE (socialMediaLINE)
...                         socialMediaTwitter (socialMediaTwitter)
...                         socialMediaWeChat (socialMediaWeChat)
...                         socialMediaWhatsApp (socialMediaWhatsApp)
@{lov_Optin}                yes (yes)    waiting (waiting)    no (no)
@{lov_phonetype}            home (home)    mobile (mobile)    office (office)

@{touch_countries}          ESP    ZAF    CAN    AUS    FRA    IRL    HKG    JPN    SGP    USA    ITA    GBR    CHE    BEL    LUX    NLD
@{non_touch_countries}      CHN    CHL
@{BNLregion}                BEL    LUX    NLD

&{full_country}             GBR=United Kingdom
...                         FRA=France
...                         BEL=Belgium
...                         LUX=Luxembourg
...                         NLD=Netherlands
...                         USA=United States
...                         CHE=Suisse
...                         ITA=Italy

&{locale_values}            GBR=en_GB
...                         FRA=fr_FR
...                         BEL=nl_BE
...                         LUX=fr_FR
...                         NLD=en_GB
...                         USA=en_US
...                         CHE=fr_CH
...                         ITA=it_IT

&{yes_no}                   YES=true
...                         Yes=true
...                         yes=true
...                         NO=false
...                         No=false
...                         no=false

@{salutations}              M    Mlle    Mme
@{BNLsalutations}           M    Mme
&{translate_salutation}     Mlle=Ms
...                         M=Mr
...                         Mme=Mrs


*** Keywords ***
Is Element Visible
    [Arguments]    ${selector}
    ${return_status}    ${return_value}=    Run Keyword And Warn On Failure    Wait For Elements State    ${selector}    visible
    RETURN    ${return_status}