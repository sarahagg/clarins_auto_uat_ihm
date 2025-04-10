*** Settings ***
Documentation       here are all the common variables to SFCC test cases


*** Variables ***
${USERNAME}                 storefront
${PASSWORD}                 unlimited22

${email_regex}    (?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:a-z0-9?\.)+a-z0-9?|\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])

&{websites}                 GBR=https://stg-eu.npr.clarins.com/clarinsuk/
...                         FRA=https://stg-eu.npr.clarins.com/clarinsfr/
...                         BEL=https://stg-eu.npr.clarins.com/on/demandware.store/Sites-clarinsbnl-Site/fr/Home-Show
...                         LUX=https://stg-eu.npr.clarins.com/on/demandware.store/Sites-clarinsbnl-Site/fr/Home-Show
...                         NLD=https://stg-eu.npr.clarins.com/on/demandware.store/Sites-clarinsbnl-Site/nl/Home-Show
...                         USA=https://stg-eu.npr.clarins.com/clarinsus/
...                         CHE=https://stg-eu.npr.clarins.com/clarinsch/
...                         ITA=https://stg-eu.npr.clarins.com/clarinsit/
...                         POL=https://stg-eu.npr.clarins.com/clarinspl/
...                         AUT=https://stg-eu.npr.clarins.com/clarinsat/
...                         PRT=https://stg-eu.npr.clarins.com/clarinsprt/
...                         ESP=https://stg-eu.npr.clarins.com/clarinses/
...                         ZAF=https://stg-eu.npr.clarins.com/clarinsza/  
...                         CAN=https://stg-eu.npr.clarins.com/clarinsca/
...                         AUS=https://stg-ap.npr.clarins.com/clarinsau/
...                         JPN=https://stg-ap.npr.clarins.com/clarinsjp/
...                         SGP=https://stg-ap.npr.clarins.com/clarinssg/
...                         IRL=https://stg-eu.npr.clarins.com/clarinsie/
...                         DEU=https://stg-eu.npr.clarins.com/clarinsde/
...                         HKG=https://stg-ap.npr.clarins.com/clarinshk/
...                         NZL=https://stg-ap.npr.clarins.com/clarinsnz/
...                         ARE=https://stg-eu.npr.clarins.com/clarinsare/


&{account_dashboard_text}
...                         GBR=My dashboard
...                         FRA=Mon tableau de bord
...                         BEL=Mon tableau de bord
...                         LUX=Mon tableau de bord
...                         NLD=Mijn overzicht
...                         USA=My dashboard
...                         CHE=Mon tableau de bord
...                         POL=Mój pulpit
...                         AUT=Mein Dashboard
...                         PRT=O meu painel
...                         ESP=Mi cuenta
...                         ZAF=My dashboard
...                         CAN=Mon tableau de bord
...                         AUS=My dashboard
...                         JPN=ダッシュボード
...                         SGP=My dashboard
...                         IRL=My dashboard
...                         DEU=Mein Dashboard
...                         HKG=我的版面
...                         ITA=La mia bacheca
...                         NZL=My dashboard
...                         ARE=My dashboard



&{transaction_order_summary_text}
...                         GBR=Thank you for your order
...                         FRA=Merci pour votre commande
...                         BEL=Merci pour votre commande
...                         LUX=Merci pour votre commande
...                         NLD=Bedankt voor uw bestelling
...                         USA=Thank you for your order
...                         CHE=Merci pour votre commande
...                         POL=Dziękujemy za złożenie zamówienia
...                         AUT=Vielen Dank für Ihre Bestellung
...                         PRT=Obrigado pela sua encomenda
...                         ESP=Gracias por su pedido
...                         ZAF=Thank you for your order
...                         CAN=Thank you for your order
...                         AUS=Thank you for your order
...                         JPN=ご注文ありがとうございます
...                         SGP=Thank you for your order
...                         IRL=Thank you for your order
...                         DEU=Vielen Dank für Ihre Bestellung
...                         HKG=感謝您的訂單
...                         ITA=
...                         NZL=Thank you for your order
...                         ARE=Thank you for your order


&{account_dashboard_profile_text}
...                         GBR=My profile
...                         FRA=Mon profil
...                         BEL=Mon profil
...                         LUX=Mon profil
...                         NLD=Mijn profiel
...                         USA=My profile
...                         CHE=Mon profil
...                         POL=Mój profil
...                         AUT=Mein Profil
...                         PRT=O meu perfil
...                         ESP=Mi perfil
...                         ZAF=My profile
...                         CAN=My profile
...                         AUS=My profile
...                         JPN=マイ プロフィール
...                         SGP=My profile
...                         IRL=My profile
...                         DEU=Mein Profil
...                         HKG=我的個人資料
...                         ITA=
...                         NZL=My profile
...                         ARE=My profile

&{newsletter_text}          GBR=THANK YOU FOR SUBSCRIBING. PLEASE NOTE THAT YOU WILL NOT RECEIVE A WELCOME EMAIL IF YOU ARE ALREADY SUBSCRIBED TO CLARINS NEWSLETTERS.
...                         FRA=MERCI POUR VOTRE INSCRIPTION !
...                         BEL=MERCI POUR VOTRE INSCRIPTION\xa0!
...                         LUX=MERCI POUR VOTRE INSCRIPTION\xa0!
...                         NLD=BEDANKT VOOR JE INSCHRIJVING!
...                         USA=THANKS! CHECK YOUR EMAIL FOR YOUR 10% OFF CODE. PLEASE NOTE THAT YOU WILL NOT RECEIVE A WELCOME EMAIL IF YOU ARE ALREADY SUBSCRIBED TO CLARINS NEWSLETTERS.\nVIEW T&CS
...                         CHE=MERCI POUR VOTRE INSCRIPTION\xa0!
...                         ITA=GRAZIE PER L'ISCRIZIONE!
...                         POL=DZIĘKUJEMY ZA REJESTRACJĘ!
...                         AUT=VIELEN DANK FÜR IHRE ANMELDUNG!
...                         PRT=AGRADECEMOS O SEU REGISTO!
...                         ESP=GRACIAS POR SUSCRIBIRSE!
...                         ZAF=THANK YOU FOR SUBSCRIBING!
...                         CAN=THANK YOU FOR SUBSCRIBING!
...                         AUS=THANK YOU FOR SUBSCRIBING!
...                         JPN=ご登録ありがとうございます
...                         SGP=THANK YOU FOR SUBSCRIBING!
...                         IRL=THANK YOU FOR SUBSCRIBING!
...                         DEU=VIELEN DANK FÜR IHRE ANMELDUNG!
...                         HKG=感謝您的訂閱
...                         ITA=
...                         NZL=THANK YOU FOR SIGNING UP TO RECEIVE CLARINS NEWSLETTERS.
...                         ARE=THANK YOU FOR SUBSCRIBING!

# SPECIFICITIES BY COUNTRY
@{welcome_offer_countries}                       TBD
@{push_ad_up_banner_countries}                   POL
@{simplified_salutations_countries}              BEL    LUX    NLD    POL   PRT    AUT    DEU
@{transaction_gift_countries}                    AUT
@{no_salutation_countries}                       USA    CAN    AUS    JPN   NZL
@{sms_optin_countries}                           POL    AUT    PRT    FRA   AUS    SGP    HKG    NZL
@{whatsapp_optin_countries}                      FRA    SGP    HKG
@{agree_to_terms_and_condition_countries}        USA    AUT    CAN    AUS   SGP    DEU    NZL
@{credit_card_cybersource_countries}             USA    CAN    GBR    POL   ZAF    JPN    AUS    SGP    HKG  MYS  MEX  NZL  ARE  SAU  KWT  QAT
@{credit_card_adyen_countries}                   AUT    BEL    FIN    PRT   IDN    ITA    IRL    CHE    FRA  DEU  ESP  SWE  DNK  NOR  PRT  IDN
@{newsletterForm_privacy_policy_countries}       ITA    AUT    PRT    NZL

${points}  0