# locators.py

####################
# close all popups #
####################
my_popup = "xpath=//*[@id='didomi-popup']"
accept_cookies = "xpath=//*[@id='didomi-notice-agree-button']"
welcome_offer_popup ="xpath=//*[contains(@id,'bx-form') and contains(@id, 'step-1')]"
refuse_welcome_offer="xpath=//*[contains(@id,'bx-form') and contains(@id, 'step-1')]/descendant::button[@data-click='close']"

##############
# newsletter #
##############
newsletter_email = "xpath=//footer//i-newsletter-form//input[starts-with(@id,'email')]"
newsletter_inscription_button = "xpath=//footer//i-newsletter-form//button[starts-with(@id, 'confirm')]"
newsletter_div = "xpath=//*[starts-with(@id, 'email')]"
newsletter_message = "xpath=//*[@class='text-center text-uppercase']"

# ITA newsletter
italy_privacy_policy = "xpath=//footer//input[starts-with(@id, 'newsletterTerms')]"

# BNL newsletter
newsletter_region = "xpath=//footer//*[starts-with(@id ,'dwfrm_newsletterformbuilder')]/div/i-select"
newsletter_belgique = "xpath=//footer//*[@id='dwfrm_newsletterformbuilder_countries_country_BE']"
newsletter_luxembourg = "xpath=//footer//*[@id='dwfrm_newsletterformbuilder_countries_country_LU']"
newsletter_netherlands = "xpath=//footer//*[@id='dwfrm_newsletterformbuilder_countries_country_NL']"

###############
# Enter email #
###############
connexion_button = "xpath=//*[@class='header-menu-login__icon header-menu__icon flex-vertical-center']"
insert_email = "xpath=//i-input[@class='full-width']/input[starts-with(@id, 'email')]"
rememberme_button = "xpath=//*[starts-with(@id, 'rememberme')]"
submit_button = "xpath=//*[starts-with(@id, 'submit')]"

##################
# create account #
##################
first_Name_field = "xpath=//*[starts-with(@id, 'firstname')]"
last_name_field = "xpath=//*[starts-with(@id, 'lastname')]"
email_div = "xpath=//*[starts-with(@id, 'email')and (@data-auto-id='account-registration-email')]"
modify_button = ("xpath=//*[starts-with(@id, 'dwfrm_cba__registration')]/i-link/a[@class='link link--uppercase "
            "edit-email-js cba-link-style']")
account_password = "xpath=//*[starts-with(@id, 'dwfrm_cba__registration')]/i-password/input"
birthday = "xpath=//*[starts-with(@id, 'birthday')]"
phone_field = "xpath=//div[contains(@class,'i-phone-input__info')]/input"
email_option_yes = "xpath=//*[@id='dwfrm_cba__registration_customer_emailoptin-yes']"
email_option_no = "xpath=//*[@id='dwfrm_cba__registration_customer_emailoptin-no']"
is_loyalty_member_yes = "xpath=//*[@id='dwfrm_cba__registration_customer_issalesforceloyaltymember-yes']"
is_loyalty_member_no = "xpath=//*[@id='dwfrm_cba__registration_customer_issalesforceloyaltymember-no']"
date_invalid = "xpath=//*[starts-with(@id, 'error_birthday')]"
dashboard = "xpath=//*[@id='wrapper']//i-account-inner-pages-title/h2"
M = "xpath=//*[@id='dwfrm_cba__registration_customer_title-Mr']"
Mme = "xpath=//*[@id='dwfrm_cba__registration_customer_title-Mrs']"
Mlle = "xpath=//*[@id='dwfrm_cba__registration_customer_title-Ms']"

# USA create account
agree_to_terms = "xpath=//*[starts-with(@id, 'termsandconditions')]"

# ITA create account
privacy_policy = "xpath=//*[@id='dwfrm_cba__registration_customer_agreedpersonalizedemails-0']"

# #BNL create account
select_region = "xpath=//*[starts-with(@id ,'dwfrm_cba__registration')]/div/i-select"
newaccount_belgique = "xpath=//*[@id='dwfrm_cba__registration_customer_country_countryProfile_BE']"
newaccount_luxembourg = "xpath=//*[@id='dwfrm_cba__registration_customer_country_countryProfile_LU']"
newaccount_netherlands = "xpath=//*[@id='dwfrm_cba__registration_customer_country_countryProfile_NL']"

##############
# connection #
##############
connection_path = "xpath=//*[@id='wrapper']/div[2]/div[1]/i-account-login/h1"
connection_password = "xpath=//*[starts-with(@id, 'password')and @name='dwfrm_cba__login_password']"
connection_submit = "xpath=//*[starts-with(@id, 'submit') and @name='dwfrm_cba__login_submit']"
