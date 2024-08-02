*** Settings ***
Documentation       All the common resources
...                 All the different libraries
...                 All the different resources

# libraries
Library             Browser    run_on_failure=${False}    timeout=0:02:00
Library             KeePassLibrary
Library             OperatingSystem
Library             DateTime
Library             FakerLibrary
# variables
Variables           ..${/}..${/}..${/}Ressources${/}LinkCLM_CreationCompte${/}Common${/}locator.py
# resources
Resource            ..${/}..${/}..${/}Ressources${/}LinkCLM_CreationCompte${/}Common${/}common-variables.resource
Resource            ..${/}..${/}..${/}Ressources${/}LinkCLM_CreationCompte${/}Common${/}common.resource
Resource            ..${/}..${/}..${/}Ressources${/}LinkCLM_CreationCompte${/}Authentificate_CLM.resource
Resource            ..${/}..${/}..${/}Ressources${/}LinkCLM_CreationCompte${/}Link.resource
