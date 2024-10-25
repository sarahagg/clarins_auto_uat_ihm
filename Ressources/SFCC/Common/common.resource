*** Settings ***
Documentation       All the common resources
...                 All the different resources

# variables
Variables           locator.py

# resources
Resource            ..${/}..${/}..${/}Ressources${/}Common${/}common.resource

Resource            commonvariables.resource
Resource            authentification.resource

Resource            ..${/}NewAccount${/}newaccount.resource
Resource            ..${/}NewAccount${/}genericinformation.resource

Resource            ..${/}Newsletter${/}newsletter.resource
Resource            ..${/}Newsletter${/}genericinformation.resource

Resource            ..${/}Connection${/}connection.resource
Resource            ..${/}Connection${/}genericinformation.resource
