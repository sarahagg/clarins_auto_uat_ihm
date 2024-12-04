createAccountPage_salutation_option = "xpath=//*[@id='dwfrm_cba__registration_customer_title-$SALUTATION$']"
createAccountPage_first_name_input = "xpath=//*[starts-with(@id, 'firstname')]"
createAccountPage_last_name_input = "xpath=//*[starts-with(@id, 'lastname')]"
createAccountPage_account_password_input = "xpath=//*[starts-with(@id, 'dwfrm_cba__registration')]/i-password/input"
createAccountPage_birthday_input = "xpath=//*[starts-with(@id, 'birthday')]"
createAccountPage_birthday_date_invalid_message = "xpath=//*[starts-with(@id, 'error_birthday')]"
createAccountPage_phone_number_country_code_select = "xpath=//select[starts-with(@id,'phoneCountryCode')]/parent::div"
createAccountPage_phone_number_country_code_option = "xpath=//*[@id='dwfrm_cba__registration_customer_phoneCountryCode_$COUNTRY_ALPHA2$']"
createAccountPage_phone_number_input = "xpath=//div[contains(@class,'i-phone-input__info')]/input"
createAccountPage_email_optin_option = "xpath=//*[@id='dwfrm_cba__registration_customer_emailoptin-$EMAIL_OPTIN_VALUE$']"
createAccountPage_sms_optin_option = "xpath=//*[@id='dwfrm_cba__registration_customer_smsoptin-$SMS_OPTIN_VALUE$']"
createAccountPage_is_loyalty_member_option = "xpath=//*[@id='dwfrm_cba__registration_customer_issalesforceloyaltymember-$IS_LOYALTY_MEMBER_VALUE$']"

createAccountPage_submit_button = "xpath=//*[starts-with(@id, 'submit')]"

# SPECIFIC TO EACH COUNTRY

# USA create account
createAccountPage_USA_agree_to_terms_checkbox = "xpath=//*[starts-with(@id, 'termsandconditions')]"

# ITA create account
createAccountPage_ITA_privacy_policy_checkbox = "xpath=//*[@id='dwfrm_cba__registration_customer_agreedpersonalizedemails-0']"

# #BNL create account
createAccountPage_region_select = "xpath=//*[starts-with(@id ,'dwfrm_cba__registration')]/div/i-select"
createAccountPage_region_option = "xpath=//*[@id='dwfrm_cba__registration_customer_country_countryProfile_$COUNTRY_ALPHA2$']"
