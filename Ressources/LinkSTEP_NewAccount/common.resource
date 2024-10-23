*** Settings ***
Documentation       All the common resources
...                 All the different libraries
...                 All the different resources

# libraries
Library             utils.py

# variables
Variables           ..${/}..${/}Ressources${/}STEP${/}Common${/}locator.py

# resources
Resource            verifylink.resource

Resource            ..${/}..${/}Ressources${/}STEP${/}Common${/}common.resource
Resource            ..${/}..${/}Ressources${/}STEP${/}Common${/}commonvariables.resource
Resource            ..${/}..${/}Ressources${/}STEP${/}Common${/}authentification.resource

Resource            ..${/}..${/}Ressources${/}STEP${/}Modify${/}modify.resource
Resource            ..${/}..${/}Ressources${/}STEP${/}Modify${/}choice.resource
Resource            ..${/}..${/}Ressources${/}STEP${/}Modify${/}filltext.resource

Resource            ..${/}..${/}Ressources${/}STEP${/}Verify${/}verify.resource
