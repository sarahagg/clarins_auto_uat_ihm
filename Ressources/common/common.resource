*** Settings ***
Documentation   All the common resources
...             All the different libraries
...             All the different resources

#libraries
Library         Browser          run_on_failure=${False}    timeout=0:01:00
Library         KeePassLibrary
Library         OperatingSystem
Library         DateTime

#variables
Variables       ..${/}..${/}Ressources${/}Common${/}locator.py

#resources
Resource        ..${/}..${/}Ressources${/}Common${/}common_variables.resource



