*** Settings ***
Documentation   here are all the common variables
Resource        ..${/}..${/}..${/}Ressources${/}SFCC${/}Common${/}common.resource

*** Variables ***

${ENV}
${BROWSER}                  chromium
${timestamp_format}         %Y_%m_%dT%H_%M_%S
${today_format}             %Y_%m_%d
${USERNAME}                 storefront
${PASSWORD}                 unlimited22
${TARGET_PAGE_URL}           https://staging-clarins-ecommera.demandware.net/on/demandware.store/Sites-clarinsfr-Site/fr_FR/Home-Show
${CSV_FILE}                  file=..${/}..${/}Jeux de donnees${/}LINKFILES.csv

&{default_values}         EMAIL=emailderesr@gmail.com
...                       country=FRA
...                       password= azerty12ui
...                       salutation= M

#country
&{locale_values}           UK=uk_UA
...                        FRA=fr_FR
...                        BNL=nl_BE
...                        USA=en_US
...                        CHE=fr_CH
...                        ITA=it_IT

&{websites}                UK=https://staging-clarins-ecommera.demandware.net/on/demandware.store/Sites-clarinsuk-Site
...                        FRA=https://staging-clarins-ecommera.demandware.net/on/demandware.store/Sites-clarinsfr-Site
...                        BNL=https://staging-clarins-ecommera.demandware.net/on/demandware.store/Sites-clarinsbnl-Site
...                        USA=https://staging-clarins-ecommera.demandware.net/on/demandware.store/Sites-clarinsus-Site
...                        CHE=https://staging-clarins-ecommera.demandware.net/on/demandware.store/Sites-clarinsch-Site
...                        ITA=https://staging-clarins-ecommera.demandware.net/on/demandware.store/Sites-clarinsit-Site

&{creation_text}           UK=My dashboard
...                        FRA=Mon tableau de bord
...                        BNL=Mijn overzicht
...                        USA=My dashboard
...                        CHE=Mon tableau de bord
...                        ITA=La mia bacheca

&{newsletter_text}         UK=
...                        FRA=MERCI POUR VOTRE INSCRIPTION !
...                        BNL=BEDANKT VOOR JE INSCHRIJVING!
...                        USA=THANKS! CHECK YOUR EMAIL FOR YOUR 10% OFF CODE. PLEASE NOTE THAT YOU WILL NOT RECEIVE A WELCOME EMAIL IF YOU ARE ALREADY SUBSCRIBED TO CLARINS NEWSLETTERS.\nVIEW T&CS
...                        CHE=
...                        ITA=GRAZIE PER L'ISCRIZIONE!



@{BNLregion}                      Belgique   Luxembourg    Nederland
@{salutations}                    M       Mlle    Mme
@{BNLsalutations}                 M       Mme
@{touch_countries}                ESP     ZAF     CAN     AUS     FRA     JPN     SGP    USA     CHE     IRL     HKG     CHN     CHL
@{non_touch_countries}            USA     CHE     IRL     HKG     CHN     CHL
${UNWANTED_CHARACTERS}            []
@{generated_data}                 Josephine   Picard   gdupre@example.net   datetime.date(1988, 5, 14)   FRA    auto
