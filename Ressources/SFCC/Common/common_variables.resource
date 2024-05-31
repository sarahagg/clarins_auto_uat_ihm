*** Settings ***
Documentation   here are all the common variables
Resource        ..${/}..${/}Ressources${/}Common${/}common.resource

*** Variables ***

${ENV}
${URL}                      https://staging-clarins-ecommera.demandware.net/on/demandware.store/Sites-clarinsfr-Site
${BROWSER}                  chromium
${timestamp_format}         %Y_%m_%dT%H_%M_%S
${today_format}             %Y_%m_%d
${USERNAME}                 storefront
${PASSWORD}                 unlimited22
${TARGET_PAGE_URL}           https://staging-clarins-ecommera.demandware.net/on/demandware.store/Sites-clarinsfr-Site/fr_FR/Home-Show
#${my_email}                 Test_Email2@gmail.com
#${firstname}            toto
#${my_last_name}             tests
#${my-password}              tototest123
#${my_birthday}              10/03/1999
#${EXPECTED_TEXT}=    Connectez-vous ou créez un compte
${UTC_format_default}       %Y-%m-%dT