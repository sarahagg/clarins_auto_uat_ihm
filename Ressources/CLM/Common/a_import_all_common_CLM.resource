*** Settings ***
Documentation       All the common resources
...                 All the different resources


Resource            ..${/}..${/}Common${/}common.resource

Resource            commonVariables.resource
Resource            initialization.resource


Variables           ..${/}Locators${/}a_import_all_locators_CLM.py

Resource            ..${/}PageObjectModel${/}a_import_all_page_object_model_CLM.resource
