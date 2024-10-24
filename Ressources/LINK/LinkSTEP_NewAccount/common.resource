*** Settings ***
Documentation       All the common resources
...                 All the different libraries
...                 All the different resources


# libraries
Library             utils.py

# resources
Resource            verifylink.resource
Resource            ..${/}..${/}STEP${/}Common${/}common.resource
