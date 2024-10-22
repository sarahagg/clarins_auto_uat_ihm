*** Settings ***
Documentation       All the common resources
...                 All the different libraries
...                 All the different resources

# libraries
Library             Browser    run_on_failure=Take Screenshot \ EMBED     timeout=0:00:10
Library             KeePassLibrary
Library             OperatingSystem
Library             DateTime
Library             FakerLibrary
Library             Collections
Library             String
# variables
Variables           ..${/}..${/}Ressources${/}SFCC${/}Common${/}locator.py
Variables           ..${/}..${/}Ressources${/}STEP${/}Common${/}locator.py
# resources
Resource            ..${/}..${/}Ressources${/}SFCC${/}Common${/}common-variables.resource
Resource            ..${/}..${/}Ressources${/}SFCC${/}Common${/}common.resource
Resource            ..${/}..${/}Ressources${/}SFCC${/}Common${/}CookiesAndAuthentification.resource
Resource            ..${/}..${/}Ressources${/}SFCC${/}New-account${/}GenericInformation.resource
Resource            ..${/}..${/}Ressources${/}SFCC${/}New-account${/}New-account.resource
Resource            ..${/}..${/}Ressources${/}SFCC${/}Newsletter${/}newsletter.resource
Resource            ..${/}..${/}Ressources${/}SFCC${/}Newsletter${/}GenericInformation.resource
Resource            ..${/}..${/}Ressources${/}SFCC${/}Connection${/}GenericInformation.resource
Resource            ..${/}..${/}Ressources${/}SFCC${/}Connection${/}Connection.resource
Resource            ..${/}..${/}Ressources${/}LinkSFCC_CreationCompte${/}Link.resource

*** Variables ***
${csv_file_Newaccount_STEP}      ${CURDIR}${/}..${/}..${/}Jeux de donnees${/}LINKFILENEWACCOUNT_STEP.csv
${csv_file_Newaccount_CLM}      ${CURDIR}${/}..${/}..${/}Jeux de donnees${/}LINKFILENEWACCOUNT_CLM.csv