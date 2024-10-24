*** Settings ***
Documentation       here are all the common variables

Resource            common.resource


*** Variables ***
${USERNAME}     s.aggour
${PASSWORD}     4L7sSg9xwY43pH
${PAGE_URL}     https://clr-uat.clm-comarch.com/clm-cc/fr/#/login

&{Programmes}       AUS=${programmeAUS}
...                 CAN=${programmeCAN}
...                 CHE=${programmeCHE}
...                 DEU=${programmeDEU}
...                 ESP=${programmeESP}
...                 FRA=${programmeFRA}
...                 GBR=${programmeGBR}
...                 IRL=${programmeIRL}
...                 LUX=${programmeLUX}
...                 NLD=${programmeNLD}
...                 NZL=${programmeNZL}
...                 SGP=${programmeSGP}
...                 USA=${programmeUSA}
...                 ZAF=${programmeZAF}
...                 BEL=${programmeBEL}
