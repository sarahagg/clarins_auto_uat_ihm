*** Settings ***
Documentation   All the common resources
...             All the different libraries
...             All the different resources

#libraries
Library         Browser          run_on_failure=${False}    timeout=0:01:00
Library         KeePassLibrary
Library         OperatingSystem
Library         DateTime
Library         FakerLibrary

#variables
Variables       ..${/}..${/}..${/}Ressources${/}SFCC${/}Common${/}locator.py

#resources
Resource        ..${/}..${/}..${/}Ressources${/}SFCC${/}Common${/}common_variables.resource
Resource        ..${/}..${/}..${/}Ressources${/}SFCC${/}Common${/}common.resource
Resource        ..${/}..${/}..${/}Ressources${/}SFCC${/}Common${/}CookiesAndAuthentification${/}CookiesAndAuthentification.resource

Resource        ..${/}..${/}..${/}Ressources${/}SFCC${/}New_account${/}GenericInformation.resource
Resource        ..${/}..${/}..${/}Ressources${/}SFCC${/}New_account${/}New_account.resource

Resource        ..${/}..${/}..${/}Ressources${/}SFCC${/}Newsletter${/}newsletter.resource
Resource        ..${/}..${/}..${/}Ressources${/}SFCC${/}Newsletter${/}GenericInformation.resource

Resource        ..${/}..${/}..${/}Ressources${/}SFCC${/}Connection${/}GenericInformation.resource
Resource        ..${/}..${/}..${/}Ressources${/}SFCC${/}Connection${/}Connection.resource
