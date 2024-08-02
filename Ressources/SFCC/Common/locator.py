# locators.py

##################
# accept cookies #
##################
my_popup = "xpath=//*[@id='didomi-popup']"
accept_cookies = "xpath=//*[@id='didomi-notice-agree-button']"
welcome_offer ="xpath=//*[@id='bx-form-1520728-step-1']"
refuse_welcome_offer="xpath=//*[@id='bx-close-inside-1520728']"

##############
# newsletter #
##############
newsletter_email = "xpath=//footer//i-newsletter-form//input[starts-with(@id,'email')]"
newsletter_inscription_button = "xpath=//footer//i-newsletter-form//button[starts-with(@id, 'confirm')]"
newsletter_div = "xpath=//*[starts-with(@id, 'email')]"
newsletter_message = "xpath=//*[@class='text-center text-uppercase']"

#italie newletter
italie_privacy_policy = "xpath=//footer//input[starts-with(@id, 'newsletterTerms')]"

#BNL newsletter
newsletter_region = "xpath=//footer//*[starts-with(@id ,'dwfrm_newsletterformbuilder')]/div/i-select"
newsletter_Belgique = "xpath=//footer//*[@id='dwfrm_newsletterformbuilder_countries_country_BE']"
newsletter_Luxembourg = "xpath=//footer//*[@id='dwfrm_newsletterformbuilder_countries_country_LU']"
newsletter_Nederland = "xpath=//footer//*[@id='dwfrm_newsletterformbuilder_countries_country_NL']"



###############
# Enter email #
###############
connexion_button = "xpath=//*[@class='header-menu-login__icon header-menu__icon flex-vertical-center']"
insert_email = "xpath=//i-input[@class='full-width']/input[starts-with(@id, 'email')]"
remember = "xpath=//*[starts-with(@id, 'rememberme')]"
continuer = "xpath=//*[starts-with(@id, 'submit')]"



##################
# create account #
##################
First_Name_field = "xpath=//*[starts-with(@id, 'firstname')]"
last_name_field = "xpath=//*[starts-with(@id, 'lastname')]"
email_div = "xpath=//*[starts-with(@id, 'email')and (@data-auto-id='account-registration-email')]"
modifier = ("xpath=//*[starts-with(@id, 'dwfrm_cba__registration')]/i-link/a[@class='link link--uppercase "
            "edit-email-js cba-link-style']")
account_password = "xpath=//*[starts-with(@id, 'dwfrm_cba__registration')]/i-password/input"
birthday = "xpath=//*[starts-with(@id, 'birthday')]"
emailOptionYes = "xpath=//*[@id='dwfrm_cba__registration_customer_emailoptin-yes']"
emailOptionNo = "xpath=//*[@id='dwfrm_cba__registration_customer_emailoptin-no']"
isLoyaltyMemberYes = "xpath=//*[@id='dwfrm_cba__registration_customer_issalesforceloyaltymember-yes']"
isLoyaltyMemberNO = "xpath=//*[@id='dwfrm_cba__registration_customer_issalesforceloyaltymember-no']"
submit = "xpath=//*[starts-with(@id, 'submit')]"
date_invalide = "xpath=//*[starts-with(@id, 'error_birthday')]"
dashboard = "xpath=//*[@id='wrapper']//i-account-inner-pages-title/h2"
M = "xpath=//*[@id='dwfrm_cba__registration_customer_title-Mr']"
Mme = "xpath=//*[@id='dwfrm_cba__registration_customer_title-Mrs']"
Mlle = "xpath=//*[@id='dwfrm_cba__registration_customer_title-Ms']"

#USA create account
agreeToTerms = "xpath=//*[starts-with(@id, 'termsandconditions')]"

#italie create account
privacyPolicy = "xpath=//*[@id='dwfrm_cba__registration_customer_agreedpersonalizedemails-0']"
italie_cookies = "xpath=//*[@id='didomi-notice-disagree-button']"
italie_popup = "xpath=//*[@id='didomi-popup']/div/div"
italie_connexion_button = "xpath=//*[@id='header-wrapper-smart-tribune']//i-disclosure-content"

#BNL create account
region = "xpath=//*[starts-with(@id ,'dwfrm_cba__registration')]/div/i-select"
NewAcc_Belgique = "xpath=//*[@id='dwfrm_cba__registration_customer_country_countryProfile_BE']"
NewAcc_Luxembourg = "xpath=//*[@id='dwfrm_cba__registration_customer_country_countryProfile_LU']"
NewAcc_Nederland = "xpath=//*[@id='dwfrm_cba__registration_customer_country_countryProfile_NL']"



#############
# connexion #
#############
connexion_path = "xpath=//*[@id='wrapper']/div[2]/div[1]/i-account-login/h1"
connexion_password = "xpath=//*[starts-with(@id, 'password')and @name='dwfrm_cba__login_password']"
connexion_submit = "xpath=//*[starts-with(@id, 'submit') and @name='dwfrm_cba__login_submit']"
