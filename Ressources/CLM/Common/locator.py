# locators.py

####################
# Authentification #
####################
CLM_login = "xpath=//*[@id='logged-out-container']/form/form-input[1]//input"
CLM_pass = "xpath=//*[@id='logged-out-container']/form/form-input[2]//input"
Connexion_CLM = "xpath=//*[@id='logged-out-container']/form/button[1]/span[2]"
titre_trouver_compte = "xpath=//*[@id='main']//h2"
#message1 = "xpath=//*[@id='cdk-overlay-0]/snack-bar-container/div/div/ng-component/div/button/span[1]/mat-icon/svg"
profil_icon = "xpath=*//navigation[2]"
changer_le_programme_de_fidelite = "xpath=//*[starts-with(@id, 'mat-menu-panel')]//button[1]"
#Programmechoice = "xpath=//*[@id='mat-select-40']"
Programmechoice = "xpath=//mat-dialog-container//form-select/mat-form-field/div"
programmeAUS = "xpath=//span[text()='Club Clarins AUS']"
programmeCAN = "xpath=//span[text()='Club Clarins CAN']"
programmeCHE = "xpath=//span[text()='Club Clarins CHE']"
programmeDEU = "xpath=//span[text()='Club Clarins DEU']"
programmeESP = "xpath=//span[text()='Club Clarins ESP']"
programmeFRA = "xpath=//span[text()='Club Clarins FRA']"
programmeGBR = "xpath=//span[text()='Club Clarins GBR']"
programmeIRL = "xpath=//span[text()='Club Clarins IRL']"
programmeLUX = "xpath=//span[text()='Club Clarins LUX']"
programmeNLD = "xpath=//span[text()='Club Clarins NLD']"
programmeNZL = "xpath=//span[text()='Club Clarins NZL']"
programmeSGP = "xpath=//span[text()='Club Clarins SGP']"
programmeUSA = "xpath=//span[text()='Club Clarins USA']"
programmeZAF = "xpath=//span[text()='Club Clarins ZAF']"
programmeBEL = "xpath=//span[text()='Club Clarins BEL']"
programmeITA = "xpath=//*[@id='mat-option-']/span"
confirmer = "xpath=//change-loyalty-program/mat-dialog-actions/button[2]"
email_arrow = "xpath=//*[@id='main']//mat-icon[2]"
email_search_input = "xpath=//form/section[2]/form-input[7]//input"
email_search_button = "xpath=//mat-action-row/button[2]"
first_email = "xpath=//*[@id='main']//div[1]/div/tr"
first_name_loc = "xpath=//div[text()='Prénom']/following-sibling::div[1]"
last_name_loc = "xpath=//div[text()='Nom de famille']/following-sibling::div[1]"
birthdate_loc = "xpath=//div[text()='Date de naissance']/following-sibling::div[1]"
