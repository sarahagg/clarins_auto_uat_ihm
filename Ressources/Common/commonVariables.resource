*** Settings ***
Documentation       All the different common variables


*** Variables ***
${BROWSER}                  chromium

${number_of_retry_to_wait_an_element}   2

${timestamp_format}         %Y_%m_%dT%H_%M_%S
${today_format}             %Y_%m_%d

&{canonical_form_contact_link_files}
...                                 \${email}=
...                                 \${salutation}=
...                                 \${firstName}=
...                                 \${lastName}=
...                                 \${password}=
...                                 \${phoneNumber}=
...                                 \${birthDate}=
...                                 \${emailOptin}=
...                                 \${SMSOptin}=
...                                 \${isLoyaltyMember}=
...                                 \${country}=

${path_to_link_csv_file}    ${EXECDIR}${/}Ressources${/}LINK${/}LinkFiles

&{default_values}
...                         email=john.doe@qq.com
...                         salutation=M
...                         firstName=John
...                         lastName=Doe
...                         password=Johndoe!
...                         phoneNumber=123456789
...                         birthDate=1980-01-01

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
@{lov_phoneType}            home (home)    mobile (mobile)    office (office)

@{touch_countries}          ESP    ZAF    CAN    AUS    FRA    IRL    HKG    JPN    SGP    USA    ITA    GBR    CHE    BEL    LUX    NLD    POL    AUT    PRT    NZL
@{non_touch_countries}      CHN    CHL
@{BNL_regions}              BEL    LUX    NLD

&{translated_countries_to_alpha2}
...                         GBR=UK
...                         BEL=BE
...                         LUX=LU
...                         NLD=NL
...                         POL=PL

&{full_country}             GBR=United Kingdom
...                         FRA=France
...                         BEL=Belgium
...                         LUX=Luxembourg
...                         NLD=Netherlands
...                         USA=United States
...                         CHE=Suisse
...                         ITA=Italy
...                         POL=Poland
...                         AUT=TBD
...                         PRT=TBD

&{locale_values}            GBR=en_GB
...                         FRA=fr_FR
...                         BEL=nl_BE
...                         LUX=fr_FR
...                         NLD=en_GB
...                         USA=en_US
...                         CHE=fr_CH
...                         ITA=it_IT
...                         POL=pl_PL
...                         AUT=TBD
...                         PRT=TBD

&{yes_no}                   YES=true
...                         Yes=true
...                         yes=true
...                         NO=false
...                         No=false
...                         no=false

@{salutations}                  M    Mme    Mlle
@{simplified_salutations}       M    Mme
&{translated_salutations}       M=Mr
...                             Mme=Mrs
...                             Mlle=Ms

&{phone_number_size_by_country}
...                               GBR=10
...                               POL=9
