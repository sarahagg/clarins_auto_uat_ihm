*** Settings ***
Documentation       all the keywords needed to navigate on the Home Page

Resource            ..${/}Common${/}a_import_all_common_SFCC.resource
Library    RPA.RobotLogListener

*** Keywords ***
Complete Delivery Form
    ${return_status}=        Check If Element Is Visible And Warn If Not    ${deliveryForm_adress_input}
    IF    $return_status == 'PASS'
          Common Delivery Infos
    END
    Click Save Delivery Info

Complete Delivery Form For Guest User
    ${return_status}=        Check If Element Is Visible And Warn If Not    ${deliveryForm_adress_input}
    IF    $return_status == 'PASS'
           Common Delivery Infos
           Fill Text    ${deliveryForm_firstname_input}     ${canonical_form_contact_link_files.get('\${firstName}')}
           Fill Text    ${deliveryForm_lastname_input}      ${canonical_form_contact_link_files.get('\${lastName}')}
           Fill Text    ${deliveryForm_phoneNumber_input}   ${canonical_form_contact_link_files.get('\${phoneNumber}')}
           Fill Text    ${deliveryForm_email_input}         ${canonical_form_contact_link_files.get('\${email}')}
           Click        ${deliveryForm_newsletter_option}
    END
    Click Save Delivery Info

Common Delivery Infos
    ${address} =             Set Variable    ${canonical_form_transaction_link_files.get('\${address}')}
    ${postalCode} =          Set Variable    ${canonical_form_transaction_link_files.get('\${postalCode}')}
    ${city} =                Set Variable    ${canonical_form_transaction_link_files.get('\${city}')}
    ${billingAdress} =       Set Variable    ${canonical_form_transaction_link_files.get('\${billingAdress}')}
    ${DPDdelivery} =         Set Variable    ${canonical_form_transaction_link_files.get('\${DPDdelivery}')}
    ${inPostPickUp} =        Set Variable    ${canonical_form_transaction_link_files.get('\${inPostPickUp}')}
    ${marketingConsent} =    Set Variable    ${canonical_form_transaction_link_files.get('\${marketingConsent}')}
         IF  $country not in @{no_salutation_countries}
            Click        ${deliveryForm_salutation_option}
         END

         Fill Text    ${deliveryForm_adress_input}        ${address}

         IF  $country not in @{no_postal_code_counties}
            Fill Text    ${deliveryForm_postalCode_input}    ${postalCode}
         END

         IF   $country not in @{no_city_input_countries}
            Fill Text    ${deliveryForm_city_input}          ${city}
         END

         IF  $country in @{district_countries}
            Fill Text    ${deliveryForm_are_district_input}         al oulaya
         END

         IF   $country in @{city_dropdown_countries}
            Click    ${deliveryForm_are_city_select}
            Fill Text    ${deliveryForm_are_city_input}   ${city}
            Click    ${deliveryForm_are_city_choice.replace('$CITYVALUE$', '${city.upper()}')}
         END

         IF  $country in @{couty_select_countries}
            Click    ${deliveryForm_rou_county_select}
            Click    ${deliveryForm_rou_county_choice_cluj}
         END

         IF  $country in @{state_countries}
            Click    ${deliveryForm_state_select}
            Click    ${deliveryForm_state_choice}
         END

Complete Payment Form
    IF    $country in ${credit_card_cybersource_countries}
        ${card_type}=   Set Variable    Cybersource
    ELSE IF   $country in ${credit_card_adyen_countries}
        ${card_type}=   Set Variable     Adyen
    ELSE
        ${card_type}=   Set Variable    Cybersource
    END

    Click        ${deliveryForm_payment_credit_card_button}
    Fill Text    ${deliveryForm_payment_card_number_input}    ${credit_card_${card_type}_VISA_infos.cardNumber}
    Fill Text    ${deliveryForm_payment_name_on_card_input}    ${credit_card_${card_type}_VISA_infos.nameOnCard}
    Fill Text    ${deliveryForm_payment_card_expiration_date_input}    ${credit_card_${card_type}_VISA_infos.expirationDate}
    Fill Text    ${deliveryForm_payment_cvn_input}    ${credit_card_${card_type}_VISA_infos.cvv}

    Click                    ${deliveryForm_payment_accept_general_terms_and_conditions_button}
    Click                    ${deliveryForm_payment_pay_button}
    Wait For Elements State  ${deliveryForm_payment_thanks_for_order_title}  visible
    Log                      successful transaction

Click Save Delivery Info
    Click        ${deliveryForm_save_button}
    log          delivery infos saved

Connect As A Guest
    Click          ${deliveryForm_login_as_guest_user_link}

