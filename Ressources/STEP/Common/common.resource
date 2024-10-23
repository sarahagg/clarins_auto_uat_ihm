*** Settings ***
Documentation       All the common resources
...                 All the different libraries
...                 All the different resources


# variables
Variables           locator.py

# resources
Resource            ..${/}..${/}..${/}Ressources${/}Common${/}common.resource

Resource            commonvariables.resource
Resource            authentification.resource

Resource            ..${/}Modify${/}modify.resource
Resource            ..${/}Modify${/}choice.resource
Resource            ..${/}Modify${/}filltext.resource

Resource            ..${/}Verify${/}verify.resource
