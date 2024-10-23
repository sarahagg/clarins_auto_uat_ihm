*** Settings ***
Documentation       here are all the common variables

Resource            ..${/}..${/}..${/}Ressources${/}SFCC${/}Common${/}common.resource


*** Variables ***
${USERNAME}                 storefront
${PASSWORD}                 unlimited22

${timestamp_format}         %Y_%m_%dT%H_%M_%S
${today_format}             %Y_%m_%d

&{default_values}           EMAIL=emailderesr@gmail.com
...                         country=FRA
...                         password=azerty12ui
...                         salutation=M
...                         FirstName=Bob
...                         LastName=Evans

&{websites}                 GBR=https://stg-eu.npr.clarins.com/uk/
...                         FRA=https://stg-eu.npr.clarins.com/fr/
...                         BNL=https://stg-eu.npr.clarins.com/bnl/
...                         BEL=https://stg-eu.npr.clarins.com/on/demandware.store/Sites-clarinsbnl-Site/fr/Home-Show
...                         LUX=https://stg-eu.npr.clarins.com/on/demandware.store/Sites-clarinsbnl-Site/fr/Home-Show
...                         NLD=https://stg-eu.npr.clarins.com/on/demandware.store/Sites-clarinsbnl-Site/nl/Home-Show
...                         USA=https://stg-eu.npr.clarins.com/us/
...                         CHE=https://stg-eu.npr.clarins.com/ch/
...                         ITA=https://stg-eu.npr.clarins.com/it/

&{creation_text}            GBR=My dashboard
...                         FRA=Mon tableau de bord
...                         BNL=Mijn overzicht
...                         USA=My dashboard
...                         CHE=Mon tableau de bord
...                         ITA=La mia bacheca

&{newsletter_text}          GBR=THANK YOU FOR SUBSCRIBING. PLEASE NOTE THAT YOU WILL NOT RECEIVE A WELCOME EMAIL IF YOU ARE ALREADY SUBSCRIBED TO CLARINS NEWSLETTERS.
...                         FRA=MERCI POUR VOTRE INSCRIPTION !
...                         BNL=BEDANKT VOOR JE INSCHRIJVING!
...                         BEL=MERCI POUR VOTRE INSCRIPTION\xa0!
...                         LUX=MERCI POUR VOTRE INSCRIPTION\xa0!
...                         NLD=BEDANKT VOOR JE INSCHRIJVING!
...                         USA=THANKS! CHECK YOUR EMAIL FOR YOUR 10% OFF CODE. PLEASE NOTE THAT YOU WILL NOT RECEIVE A WELCOME EMAIL IF YOU ARE ALREADY SUBSCRIBED TO CLARINS NEWSLETTERS.\nVIEW T&CS
...                         CHE=MERCI POUR VOTRE INSCRIPTION\xa0!
...                         ITA=GRAZIE PER L'ISCRIZIONE!

${UNWANTED_CHARACTERS}      []
#@{generated_data}           Josephine    Picard    gdupre@example.net    datetime.date(1988, 5, 14)    FRA    auto
