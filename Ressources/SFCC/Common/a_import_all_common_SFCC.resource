*** Settings ***
Documentation       All the common resources
...                 All the different resources



Resource            ..${/}..${/}..${/}Ressources${/}Common${/}common.resource

Resource            commonVariables.resource
Resource            contactInfoGenerators.resource
Resource            initialization.resource

Variables           ..${/}Locators${/}a_import_all_locators.py

Resource            ..${/}PageObjectModel${/}a_import_all_page_object_model.resource




