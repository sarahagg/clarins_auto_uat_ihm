
# locators.py

####################
# Authentification #
####################
Step_login = "id=username"
Step_pass= "id=password"
LogIn="id=kc-login"
ClarinsWebUI="xpath=//*[@id='LaunchTable']//span[@title='ClarinsWebUI']"
GlobalSearch="xpath=//*[@class='top bottom-size-3']/div[(@class='primary-menu-item')][1]"
Recherche= "xpath=//*[@class='gwt-SuggestBox stb-SuggestField stibo-Value']"
IconRechercher="xpath=//*[@class='gwt-SuggestBox stb-SuggestField stibo-Value']/following-sibling::node()"

##user unchanged infos
loc_ClarinscontactId="xpath=//div[@title='Clarins contact ID']/ancestor::div[contains(@class,'labelColumn')]/following-sibling::div[@class='widgetColumn widgetColumn--read-only']/descendant::div[@class='gwt-HTML']"
loc_Brand="xpath=//div[@title='Brand']/ancestor::div[contains(@class,'labelColumn')]/following-sibling::div[@class='widgetColumn widgetColumn--read-only']/descendant::div[@class='gwt-HTML']"
loc_Country="xpath=//div[@title='Country (of database)']/ancestor::div[contains(@class,'labelColumn component-2')]/following-sibling::div[@class='widgetColumn widgetColumn--read-only']/descendant::div[@class='gwt-HTML']"

##is the user a guest
loc_isGuest_history="xpath=//*[@id='history_icon_Is_Guest']"
loc_isGuest_modif="//*[@id='Is_Guest']//select"
loc_isGuest="xpath=//*[@id='ContextMenuPopup']//div[@class='GHUGN-BDCB']//tr[1]/td[@class='GHUGN-BDMG GHUGN-BDOG GHUGN-BDJH DataGrid-Cell DataGrid-HistoryCell']//div[@class='DataGrid-HistoryCell-Value']"
loc_isGuest_true="xpath=//*[@id='Is_Guest']//option[3]"
loc_isGuest_false="xpath=//*[@id='Is_Guest']/div/div[1]/div/div[1]/select/option[2]"

#gender
loc_gender_history="xpath=//*[@id='history_icon_Gender']"
loc_gender="xpath=//*[@id='ContextMenuPopup']//div[@class='GHUGN-BDHI']//tr[1]/td[@class='GHUGN-BDMG GHUGN-BDOG GHUGN-BDJH DataGrid-Cell DataGrid-HistoryCell']//div[@class='DataGrid-HistoryCell-Value']"
loc_gender_modif="xpath=//*[@id='Gender']//select"

##user infos
loc_salutation="xpath=//*[@id='Salutation']//textarea"
loc_FirstName="xpath=//*[@id='First_name']//textarea"
loc_localFirstName="xpath=//*[@id='Local_first_name']//textarea"
loc_LastName="xpath=//*[@id='Last_name']//textarea"
loc_localLastName="xpath=//*[@id='Local_last_name']//textarea"
loc_BirthDate="xpath=//*[@id='Birthdate']//input"
loc_language="xpath=//*[@id='Language']//textarea"
loc_Nationality="xpath=//*[@id='Nationality']//textarea"

##register
loc_isRegistered_history="xpath=//*[@id='history_icon_Is_registered']"
loc_isRegistered="xpath=//*[@class='popupContent']//div[@class='GHUGN-BDCB']//tr[1]/td[@class='GHUGN-BDMG GHUGN-BDOG GHUGN-BDJH DataGrid-Cell DataGrid-HistoryCell']//div[@class='DataGrid-HistoryCell-Value']"

##loyalty member
loc_IsLoyaltyMember_history="xpath=//*[@id='history_icon_Is_loyalty_member']"
loc_IsLoyaltyMember="xpath=//*[@class='popupContent']//div[@class='GHUGN-BDCB']//tr[1]/td[@class='GHUGN-BDMG GHUGN-BDOG GHUGN-BDJH DataGrid-Cell DataGrid-HistoryCell']//div[@class='DataGrid-HistoryCell-Value']"
loc_IsLoyaltyMember_modif="xpath=//*[@id='Is_loyalty_member']//select"

loc_isAnonymized="xpath=//*[@id='Is_anonymized']//div[@class='gwt-HTML']"
loc_isFrozen="xpath=//*[@id='Is_frozen']//div[@class='gwt-HTML']"

##Email
loc_email="xpath=//div[@title='Email Info']/ancestor::div[contains(@class,'labelColumn')]/following-sibling::div[@class='widgetColumn']/descendant::div[@class='gwt-Label label']"
loc_email_input="xpath=//div[@title='Email']/ancestor::div[contains(@class,'data-container-editor-field-label-container')]/following-sibling::div[@class='data-container-editor-selected-attributes-field-input']/descendant::div[@class='input-cell']"
loc_continuer="xpath=//div[contains(@class,'dialogMiddleCenterInner dialogContent')]/descendant::div[(@class='portal-alert-buttons')]"

##consent infos
loc_consent_first="xpath=//div[@title='Consent Info']/ancestor::div[@class='labelColumn labelColumn--direct-input component-1']/following-sibling::div[@class='widgetColumn']/descendant::div[@class='DataContainerSubContainer'][1]"

all_consent="//div[@title='Consent Info']/ancestor::div[@class='labelColumn labelColumn--direct-input component-1']/following-sibling::div[@class='widgetColumn']/descendant::div[@class='DataContainerSubContainer']"

loc_OptinChannel="xpath=//*[@id='datacontainer-attributes-view_Optin-channel']"
loc_Optin="xpath=//*[@id='datacontainer-attributes-view_Optin']"
loc_phone_continuer="xpath=//div[@class='portal-alert-buttons']"

loc_phone="xpath=//div[@title='Phone Info']/ancestor::div[@class='labelColumn labelColumn--direct-input component-7']/following-sibling::div[@class='widgetColumn']"
loc_phoneNumber="xpath=//*[@id='datacontainer-attributes-view_Phone-number']"
loc_phoneType="xpath=//*[@id='datacontainer-attributes-view_Phone-type']"

loc_add_consent="xpath=//*[@id='Consent_Info']//button"
loc_delete_consent="xpath=//div[@class='data-container-records-list-element'][1]/i"
##Save
loc_save="xpath=//span[text()='Save']"


multipleElements="xpath=//*[@id='ListTable']/div"
FirstElement="xpath=//*[@id='ListTable']//tr[1]/td[3]"
#//*[@id="ListTable"]/div/div[3]/table/tbody/tr[1]/td[3]