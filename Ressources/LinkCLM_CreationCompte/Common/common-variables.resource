*** Settings ***
Documentation       here are all the common variables

Resource            ..${/}..${/}..${/}Ressources${/}LinkCLM_CreationCompte${/}Common${/}common.resource


*** Variables ***
${ENV}              ${EMPTY}
${CLM_BROWSER}      chromium
${CLM_USERNAME}     s.aggour
${CLM_PASSWORD}     4L7sSg9xwY43pH
${CLM_PAGE_URL}     https://clr-uat.clm-comarch.com/clm-cc/fr/#/login

&{Programmes}       AUS=${programmeAUS}
...                 CAN=${programmeCAN}
...                 CHE=${programmeCHE}
...                 DEU=${programmeDEU}
...                 ESP=${programmeESP}
...                 FRA=${programmeFRA}
...                 UK=${programmeUK}
...                 IRL=${programmeIRL}
...                 LUX=${programmeLUX}
...                 NLD=${programmeNLD}
...                 NZL=${programmeNZL}
...                 SGP=${programmeSGP}
...                 USA=${programmeUSA}
...                 ZAF=${programmeZAF}
...                 BEL=${programmeBEL}

&{BNLregion}        Belgique=BEL
...                 Luxembourg=LUX
...                 Nederland=NLD
