*** Settings ***
Documentation       All the common resources
...                 All the different resources

# variables
Variables           ..${/}..${/}Ressources${/}SFCC${/}Common${/}locator.py

# resources
Resource            savelink.resource
Resource            ..${/}..${/}Ressources${/}Common${/}common.resource

Resource            ..${/}..${/}Ressources${/}SFCC${/}Common${/}common.resource
Resource            ..${/}..${/}Ressources${/}SFCC${/}Common${/}commonvariables.resource
Resource            ..${/}..${/}Ressources${/}SFCC${/}Common${/}authentification.resource

Resource            ..${/}..${/}Ressources${/}SFCC${/}NewAccount${/}newaccount.resource
Resource            ..${/}..${/}Ressources${/}SFCC${/}NewAccount${/}genericinformation.resource
