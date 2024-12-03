*** Settings ***
Documentation       All the common resources
...                 All the different libraries


Library             Browser    run_on_failure=Take Screenshot \ EMBED     timeout=0:00:10
Library             KeePassLibrary
Library             OperatingSystem
Library             DateTime
Library             Collections
Library             String
