*** Settings ***
Documentation       All the common resources
...                 All the different libraries
...                 All the different resources

# libraries
Library             Browser    run_on_failure=${False}    timeout=0:01:00
Library             OperatingSystem
Library             DateTime
Library             utils.py
# variables
Variables           ..${/}..${/}Ressources${/}STEP${/}Common${/}locator.py
# resources
Resource            ..${/}..${/}Ressources${/}STEP${/}Common${/}common-variables.resource
Resource            ..${/}..${/}Ressources${/}STEP${/}Common${/}common.resource
Resource            ..${/}..${/}Ressources${/}STEP${/}Common${/}Authentification.resource
Resource            ..${/}..${/}Ressources${/}STEP${/}Modify${/}modify.resource
Resource            ..${/}..${/}Ressources${/}STEP${/}Modify${/}Choice.resource
Resource            ..${/}..${/}Ressources${/}STEP${/}Modify${/}FillText.resource
Resource            ..${/}..${/}Ressources${/}STEP${/}Verify${/}Verify.resource
Resource            ..${/}..${/}Ressources${/}LinkSTEP_CreationCompte${/}VerifyLINK.resource
