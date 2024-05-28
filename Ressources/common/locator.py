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
first_name="xpath=//*[starts-with(@id, 'firstname')]"
last_name="xpath=//*[starts-with(@id, 'lastname')]"
email_div= "xpath=//*[starts-with(@id, 'email')and (@data-auto-id='account-registration-email')]"
modifier="xpath=//*[@id='dwfrm_cba__registration_d0uccrywscmb']/i-link/a"
account_password= "xpath=//*[starts-with(@id, 'dwfrm_cba__registration')]/i-password/input"
birthday="xpath=//*[starts-with(@id, 'birthday')]"
boutton1="xpath=//*[@id='dwfrm_cba__registration_customer_emailoptin-yes']"
boutton2="xpath=//*[@id='dwfrm_cba__registration_customer_issalesforceloyaltymember-yes']"
submit= "xpath=//*[starts-with(@id, 'submit')]"

#connexion
connexion_path="xpath=//*[@id='wrapper']/div[2]/div[1]/i-account-login/h1"
connexion_password="xpath=//*[starts-with(@id, 'password')and @name='dwfrm_cba__login_password']"
connexion_submit="xpath=//*[starts-with(@id, 'submit') and @name='dwfrm_cba__login_submit']"
