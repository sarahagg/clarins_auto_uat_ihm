*** Settings ***
Documentation       All the common resources
...                 All the different resources


Resource            ..${/}..${/}Common${/}common.resource

Resource            commonVariables.resource
Resource            initialization.resource
Library             utils.py

Variables           ..${/}Locators${/}a_import_all_locators_STEP.py

Resource            ..${/}PageObjectModel${/}a_import_all_page_object_model_STEP.resource
