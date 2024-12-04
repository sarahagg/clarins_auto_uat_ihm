*** Settings ***
Documentation       here are all the common variables to SFCC test cases


*** Variables ***
${USERNAME}                 storefront
${PASSWORD}                 unlimited22

${number_of_retry_to_wait_an_element}   2

${timestamp_format}         %Y_%m_%dT%H_%M_%S
${today_format}             %Y_%m_%d

&{websites}                 GBR=https://stg-eu.npr.clarins.com/uk/
...                         FRA=https://stg-eu.npr.clarins.com/fr/
...                         BEL=https://stg-eu.npr.clarins.com/on/demandware.store/Sites-clarinsbnl-Site/fr/Home-Show
...                         LUX=https://stg-eu.npr.clarins.com/on/demandware.store/Sites-clarinsbnl-Site/fr/Home-Show
...                         NLD=https://stg-eu.npr.clarins.com/on/demandware.store/Sites-clarinsbnl-Site/nl/Home-Show
...                         USA=https://stg-eu.npr.clarins.com/us/
...                         CHE=https://stg-eu.npr.clarins.com/ch/
...                         ITA=https://stg-eu.npr.clarins.com/it/
...                         POL=https://stg-eu.npr.clarins.com/pl/
...                         AUT=https://stg-eu.npr.clarins.com/at/
...                         PRT=https://stg-eu.npr.clarins.com/pt/

&{account_dashboard_text}
...                         GBR=My dashboard
...                         FRA=Mon tableau de bord
...                         BEL=Mon tableau de bord
...                         LUX=Mon tableau de bord
...                         NLD=Mijn overzicht
...                         USA=My dashboard
...                         CHE=Mon tableau de bord
...                         POL=Mój pulpit
...                         AUT=TBD
...                         PRT=TBD

&{newsletter_text}          GBR=THANK YOU FOR SUBSCRIBING. PLEASE NOTE THAT YOU WILL NOT RECEIVE A WELCOME EMAIL IF YOU ARE ALREADY SUBSCRIBED TO CLARINS NEWSLETTERS.
...                         FRA=MERCI POUR VOTRE INSCRIPTION !
...                         BEL=MERCI POUR VOTRE INSCRIPTION\xa0!
...                         LUX=MERCI POUR VOTRE INSCRIPTION\xa0!
...                         NLD=BEDANKT VOOR JE INSCHRIJVING!
...                         USA=THANKS! CHECK YOUR EMAIL FOR YOUR 10% OFF CODE. PLEASE NOTE THAT YOU WILL NOT RECEIVE A WELCOME EMAIL IF YOU ARE ALREADY SUBSCRIBED TO CLARINS NEWSLETTERS.\nVIEW T&CS
...                         CHE=MERCI POUR VOTRE INSCRIPTION\xa0!
...                         ITA=GRAZIE PER L'ISCRIZIONE!
...                         POL=DZIĘKUJEMY ZA REJESTRACJĘ!
...                         AUT=TBD
...                         PRT=TBD

# SPECIFICITIES BY COUNTRY
@{welcome_offer_countries}             TBD
@{push_ad_up_banner_countries}         POL
@{simplified_salutations_countries}    BEL    LUX    NLD    POL