*** Settings ***
Documentation       All the common resources
...                 All the different resources


# variables
Variables           locator.py

# resources
Resource            ..${/}..${/}..${/}Ressources${/}Common${/}common.resource

Resource            commonvariables.resource
Resource            authentification.resource
