*** Settings ***
Documentation       here are all the common variables

Resource            ..${/}..${/}..${/}Ressources${/}SFCC${/}Common${/}common.resource


*** Variables ***
${ENV}                      ${EMPTY}
${BROWSER}                  chromium
${timestamp_format}         %Y_%m_%dT%H_%M_%S
${today_format}             %Y_%m_%d
${USERNAME}                 storefront
${PASSWORD}                 unlimited22
${TARGET_PAGE_URL}          https://stg-eu.npr.clarins.com/on/demandware.store/Sites-clarinsfr-Site/fr_FR/Home-Show
&{default_values}           EMAIL=emailderesr@gmail.com
...                         country=FRA
...                         password=azerty12ui
...                         salutation=M
...                         FirstName=Bob
...                         LastName=Evans

# country
&{locale_values}            UK=en_GB
...                         FRA=fr_FR
...                         BNL=nl_BE
...                         USA=en_US
...                         CHE=fr_CH
...                         ITA=it_IT

&{websites}
...                         UK=https://stg-eu.npr.clarins.com/uk/
...                         FRA=https://stg-eu.npr.clarins.com/fr/
...                         BNL=https://stg-eu.npr.clarins.com/bnl/
...                         BEL=https://stg-eu.npr.clarins.com/on/demandware.store/Sites-clarinsbnl-Site/fr/Home-Show
...                         LUX=https://stg-eu.npr.clarins.com/on/demandware.store/Sites-clarinsbnl-Site/fr/Home-Show
...                         NLD=https://stg-eu.npr.clarins.com/on/demandware.store/Sites-clarinsbnl-Site/nl/Home-Show
...                         USA=https://stg-eu.npr.clarins.com/us/
...                         CHE=https://stg-eu.npr.clarins.com/ch/
...                         ITA=https://stg-eu.npr.clarins.com/it/

&{creation_text}            UK=My dashboard
...                         FRA=Mon tableau de bord
...                         BNL=Mijn overzicht
...                         USA=My dashboard
...                         CHE=Mon tableau de bord
...                         ITA=La mia bacheca

&{newsletter_text}
...                         UK=THANK YOU FOR SUBSCRIBING. PLEASE NOTE THAT YOU WILL NOT RECEIVE A WELCOME EMAIL IF YOU ARE ALREADY SUBSCRIBED TO CLARINS NEWSLETTERS.
...                         FRA=MERCI POUR VOTRE INSCRIPTION !
...                         BNL=BEDANKT VOOR JE INSCHRIJVING!
...                         BEL=MERCI POUR VOTRE INSCRIPTION\xa0!
...                         LUX=MERCI POUR VOTRE INSCRIPTION\xa0!
...                         NLD=BEDANKT VOOR JE INSCHRIJVING!
...                         USA=THANKS! CHECK YOUR EMAIL FOR YOUR 10% OFF CODE. PLEASE NOTE THAT YOU WILL NOT RECEIVE A WELCOME EMAIL IF YOU ARE ALREADY SUBSCRIBED TO CLARINS NEWSLETTERS.\nVIEW T&CS
...                         CHE=MERCI POUR VOTRE INSCRIPTION\xa0!
...                         ITA=GRAZIE PER L'ISCRIZIONE!

@{BNLregion}                Belgique    Luxembourg    Nederland
@{salutations}              M    Mlle    Mme
@{BNLsalutations}           M    Mme
@{touch_countries}          ESP    ZAF    CAN    AUS    FRA    JPN    SGP    USA    ITA    UK
@{non_touch_countries}      CHE    IRL    HKG    CHN    CHL
${UNWANTED_CHARACTERS}      []
@{generated_data}           Josephine    Picard    gdupre@example.net    datetime.date(1988, 5, 14)    FRA    auto
