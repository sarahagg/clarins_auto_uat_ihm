createAccountPage_salutation_option = "xpath=//*[@id='dwfrm_cba__registration_customer_title-$SALUTATION$']"
createAccountPage_first_name_input = "xpath=//*[starts-with(@id, 'firstname')]"
createAccountPage_last_name_input = "xpath=//*[starts-with(@id, 'lastname')]"
createAccountPage_account_password_input = "xpath=//*[starts-with(@id, 'dwfrm_cba__registration')]/i-password/input"
createAccountPage_birthday_input = "xpath=//*[starts-with(@id, 'birthday')]"
createAccountPage_birthday_date_invalid_message = "xpath=//*[starts-with(@id, 'error_birthday')]"
createAccountPage_phone_number_country_code_select = "xpath=//select[starts-with(@id,'phoneCountryCode')]/parent::div"
createAccountPage_phone_number_country_code_option = "xpath=//*[starts-with(@id,'dwfrm_cba__registration_customer_phoneCountryCode_$COUNTRY_ALPHA2$')]"
createAccountPage_phone_number_input = "xpath=//div[contains(@class,'i-phone-input__info')]/input"
createAccountPage_email_optin_option = "xpath=//*[@id='dwfrm_cba__registration_customer_emailoptin-$EMAIL_OPTIN_VALUE$']"
createAccountPage_sms_optin_option = "xpath=//*[@id='dwfrm_cba__registration_customer_smsoptin-$SMS_OPTIN_VALUE$']"
createAccountPage_whatsapp_optin_option = "xpath=//*[@id='dwfrm_cba__registration_customer_whatsappoptin-$WHATSAPP_OPTIN_VALUE$']"
createAccountPage_is_loyalty_member_option = "xpath=//*[@id='dwfrm_cba__registration_customer_issalesforceloyaltymember-$IS_LOYALTY_MEMBER_VALUE$']"
createAccountPage_submit_button = "xpath=//*[starts-with(@id, 'submit')]"

# SPECIFIC TO EACH COUNTRY

# JPN furigana
createAccountPage_last_name_furigana_input = "xpath=//*[starts-with(@id, 'lastalternativename')]"
createAccountPage_name_furigana_input = "xpath=//*[starts-with(@id, 'firstalternativename')]"

# USA AUT and PRT  terms and conditions button
createAccountPage_agree_to_terms_checkbox = "xpath=//*[starts-with(@id, 'termsandconditions')]"

# ITA privacy_policy
createAccountPage_ITA_privacy_policy_checkbox_no = "xpath=//*[@id='dwfrm_cba__registration_customer_agreedpersonalizedemails-0']"
createAccountPage_ITA_privacy_policy_checkbox_yes = "xpath=//*[@id='dwfrm_cba__registration_customer_agreedpersonalizedemails-1']"

#JPN privacy_policy
createAccountPage_JPN_privacy_policy_checkbox= "xpath=//*[starts-with(@id, 'privacypolicy')]"

# #BNL create account
createAccountPage_region_select = "xpath=//*[starts-with(@id ,'dwfrm_cba__registration')]/div/i-select"
createAccountPage_region_option = "xpath=//*[@id='dwfrm_cba__registration_customer_country_countryProfile_$COUNTRY_ALPHA2$']"
