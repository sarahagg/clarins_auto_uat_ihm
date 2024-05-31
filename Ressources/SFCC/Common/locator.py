# locators.py

# cookies
my_popup = "id=didomi-popup"
accept_cookies = "id=didomi-notice-agree-button"

#newsletter
newsletter_email = "xpath=//*[starts-with(@id, 'email')]"
newsletter_inscription_button = "xpath=//*[starts-with(@id, 'confirm')]"
newsletter_div = "xpath=//*[starts-with(@id, 'email')]"
newsletter_message = "xpath=//*[@class='text-center text-uppercase']"

#enter email
connexion_button= "xpath=//*[@class='header-menu-login__icon header-menu__icon flex-vertical-center']"
insert_email = "xpath=//i-input[@class='full-width']/input[starts-with(@id, 'email')]"
remember = "xpath=//*[starts-with(@id, 'rememberme')]"
continuer= "xpath=//*[starts-with(@id, 'submit')]"

#create account
First_Name_field="xpath=//*[starts-with(@id, 'firstname')]"
last_name_field="xpath=//*[starts-with(@id, 'lastname')]"
email_div= "xpath=//*[starts-with(@id, 'email')and (@data-auto-id='account-registration-email')]"
modifier="xpath=//*[starts-with(@id, 'dwfrm_cba__registration')]/i-link/a[@class='link link--uppercase edit-email-js cba-link-style']"
account_password= "xpath=//*[starts-with(@id, 'dwfrm_cba__registration')]/i-password/input"
birthday="xpath=//*[starts-with(@id, 'birthday')]"
boutton1="xpath=//*[@id='dwfrm_cba__registration_customer_emailoptin-yes']"
boutton2="xpath=//*[@id='dwfrm_cba__registration_customer_issalesforceloyaltymember-yes']"
submit= "xpath=//*[starts-with(@id, 'submit')]"
creation_title_path="xpath=//*[@id='wrapper']/div/h1"
date_invalide="xpath=//*[starts-with(@id, 'error_birthday')]"

#connexion
connexion_path="xpath=//*[@id='wrapper']/div[2]/div[1]/i-account-login/h1"
connexion_password="xpath=//*[starts-with(@id, 'password')and @name='dwfrm_cba__login_password']"
connexion_submit="xpath=//*[starts-with(@id, 'submit') and @name='dwfrm_cba__login_submit']"
