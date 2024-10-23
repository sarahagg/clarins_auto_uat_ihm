*** Settings ***
Documentation       All the common resources
...                 All the different resources


# variables
Variables           ..${/}..${/}..${/}Ressources${/}LinkCLM_NewAccount${/}Common${/}locator.py

# resources
Resource            ..${/}..${/}..${/}Ressources${/}Common${/}common.resource

Resource            ..${/}..${/}..${/}Ressources${/}LinkCLM_NewAccount${/}Common${/}common.resource
Resource            ..${/}..${/}..${/}Ressources${/}LinkCLM_NewAccount${/}Common${/}commonvariables.resource

Resource            ..${/}..${/}..${/}Ressources${/}LinkCLM_NewAccount${/}authenticate.resource
Resource            ..${/}..${/}..${/}Ressources${/}LinkCLM_NewAccount${/}link.resource
