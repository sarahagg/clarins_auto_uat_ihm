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
...                                 \${phoneNumber}=
...                                 \${birthDate}=
...                                 \${emailOptin}=
...                                 \${SMSOptin}=
...                                 \${isLoyaltyMember}=
...                                 \${country}=
...                                 \${creationSystem}=
...                                 \${createDate}=
...                                 \${lastModificationSystem}=
...                                 \${lastUpdateDate}=



&{canonical_form_transaction_link_files}
...                                 \${email}=
...                                 \${country}=
...                                 \${transactionNumber}=
...                                 \${lastInteractionDate}=


&{canonical_form_last_interaction_date_link_files}
...                                 \${email}=
...                                 \${country}=
...                                 \${lastInteractionDate}=
...                                 \${reason}=


${path_to_link_csv_file}    ${EXECDIR}${/}Ressources${/}LINK${/}LinkFiles

&{default_values}
...                         email=john.doe@qq.com
...                         salutation=M
...                         firstName=John
...                         lastName=Doe
...                         password=Johndoe!
...                         phoneNumber=123456789
...                         birthDate=1980-01-01

&{credit_card_Cybersource_VISA_infos}
...                         cardNumber=4111111111111111
...                         nameOnCard=sarah
...                         expirationDate=01/28
...                         cvv=111

&{credit_card_Adyen_VISA_infos}
...                         cardNumber=4111111145551142
...                         nameOnCard=sarah
...                         expirationDate=03/30
...                         cvv=737

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
@{lov_yes_or_no_optin}      yes    no
@{lov_phoneType}            home (home)    mobile (mobile)    office (office)

@{touch_countries}          ESP    ZAF    CAN    AUS    FRA    IRL    HKG    JPN    SGP    USA    ITA    GBR    CHE    DEU    BEL    LUX    NLD    POL    AUT    PRT    NZL   ARE
@{non_touch_countries}      CHN    CHL
@{BNL_regions}              BEL    LUX    NLD

&{translated_countries_to_alpha2}
...                         GBR=GB
...                         BEL=BE
...                         LUX=LU
...                         NLD=NL
...                         POL=PL
...                         AUT=AT
...                         PRT=PT
...                         FRA=FR
...                         USA=US
...                         CHE=CH
...                         ITA=IT
...                         ESP=ES
...                         ZAF=ZA
...                         CAN=CA
...                         AUS=AU
...                         JPN=JP
...                         SGP=SG
...                         IRL=IE
...                         DEU=DE
...                         HKG=HK
...                         NZL=NZ
...                         ARE=AE

&{full_country}             GBR=United Kingdom
...                         FRA=France
...                         BEL=Belgium
...                         LUX=Luxembourg
...                         NLD=Netherlands
...                         USA=United States
...                         CHE=Suisse
...                         ITA=Italy
...                         POL=Poland
...                         AUT=Austria
...                         PRT=Portugal
...                         ESP=Spain
...                         ZAF=South Africa
...                         CAN=Canada
...                         AUS=Australia
...                         JPN=Japan
...                         SGP=Singapore
...                         IRL=Ireland
...                         DEU=Germany
...                         HKG=Hong Kong
...                         NZL=New Zealand
...                         ARE=United Arab Emirates



&{locale_values}            GBR=en_GB
...                         FRA=fr_FR
...                         BEL=nl_BE
...                         LUX=fr_FR
...                         NLD=en_GB
...                         USA=en_US
...                         CHE=fr_CH
...                         ITA=it_IT
...                         POL=pl_PL
...                         AUT=de_AT
...                         PRT=pt_PT
...                         ESP=es_ES
...                         ZAF=en_GB
...                         CAN=en_CA
...                         AUS=en_AU
...                         JPN=ja_JP
...                         SGP=en_GB
...                         IRL=en_IE
...                         DEU=de_DE
...                         HKG=zh_CN
...                         NZL=en_GB
...                         ARE=ar_SA

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
...                               AUT=10
...                               PRT=9
...                               FRA=10
...                               BEL=9
...                               LUX=9
...                               NLD=9
...                               USA=10
...                               CHE=9
...                               ITA=10
...                               ESP=9
...                               ZAF=10
...                               CAN=10
...                               AUS=9
...                               JPN=10
...                               SGP=8
...                               IRL=9
...                               DEU=11
...                               HKG=8
...                               NZL=9
...                               ARE=9

&{phone_number_country_code}
...                               GBR=+44
...                               POL=+48
...                               AUT=+43
...                               PRT=+351
...                               FRA=+33
...                               BEL=+32
...                               LUX=+352
...                               NLD=+31
...                               USA=+1
...                               CHE=+41
...                               ITA=+39
...                               ESP=+34
...                               ZAF=+27
...                               CAN=+1
...                               AUS=+61
...                               JPN=+81
...                               SGP=+65
...                               IRL=+353
...                               DEU=+49
...                               HKG=+852
...                               NZL=+64
...                               ARE=+971

