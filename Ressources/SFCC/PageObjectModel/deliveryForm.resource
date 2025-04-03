*** Settings ***
Documentation       all the keywords needed to navigate on the Home Page

Resource            ..${/}Common${/}a_import_all_common_SFCC.resource

*** Keywords ***
Complete Delivery Form And Pay For New User
    [Arguments]                                      ${adress}
                                              ...    ${postalCode}
                                              ...    ${city}
                                              ...    ${billingAdress}
                                              ...    ${DPDdelivery}
                                              ...    ${inPostPickUp}
                                              ...    ${marketingConsent}
                                              ...    ${country}
    Connect As A New SFCC User
    sleep  1S
    Complete Registration Form
    sleep  1S
    Shipping Info
                                              ...    ${adress}
                                              ...    ${postalCode}
                                              ...    ${city}
                                              ...    ${billingAdress}
                                              ...    ${DPDdelivery}
                                              ...    ${inPostPickUp}
                                              ...    ${marketingConsent}
                                              ...    ${country}
    Payment Form            ${country}

Complete Delivery Form And Pay For loged in User
    [Arguments]                                      ${adress}
                                              ...    ${postalCode}
                                              ...    ${city}
                                              ...    ${billingAdress}
                                              ...    ${DPDdelivery}
                                              ...    ${inPostPickUp}
                                              ...    ${marketingConsent}
                                              ...    ${country}
    Shipping Info
                                              ...    ${adress}
                                              ...    ${postalCode}
                                              ...    ${city}
                                              ...    ${billingAdress}
                                              ...    ${DPDdelivery}
                                              ...    ${inPostPickUp}
                                              ...    ${marketingConsent}
                                              ...    ${country}
    Payment Form            ${country}

Complete Delivery Form And Pay For Guest
    [Arguments]                                      ${adress}
                                              ...    ${postalCode}
                                              ...    ${city}
                                              ...    ${billingAdress}
                                              ...    ${DPDdelivery}
                                              ...    ${inPostPickUp}
                                              ...    ${marketingConsent}
                                              ...    ${country}
    Connect As A Guest
    Shipping Info
                                              ...    ${adress}
                                              ...    ${postalCode}
                                              ...    ${city}
                                              ...    ${billingAdress}
                                              ...    ${DPDdelivery}
                                              ...    ${inPostPickUp}
                                              ...    ${marketingConsent}
                                              ...    ${country}
    Payment Form           ${country}

Shipping Info
         [Arguments]                                 ${adress}
                                              ...    ${postalCode}
                                              ...    ${city}
                                              ...    ${billingAdress}
                                              ...    ${DPDdelivery}
                                              ...    ${inPostPickUp}
                                              ...    ${marketingConsent}
                                              ...    ${country}


    ${return_status}=               Check If Element Is Visible And Warn If Not    ${deliveryForm_adress_input}

    IF    $return_status == 'PASS'
         ########normal transaction
         IF  $country not in @{no_salutation_countries}
            Click        ${deliveryForm_salutation_option}
         END
         Fill Text    ${deliveryForm_firstname_input}     ${canonical_form_contact_link_files.get('\${firstName}')}
         Fill Text    ${deliveryForm_lastname_input}      ${canonical_form_contact_link_files.get('\${lastName}')}
         Fill Text    ${deliveryForm_adress_input}        ${adress}
         IF  '${country}' != 'ARE'
            Fill Text    ${deliveryForm_postalCode_input}    ${postalCode}
            Fill Text    ${deliveryForm_city_input}          ${city}
         END
         IF  '${country}' == 'ARE'
            Fill Text    ${deliveryForm_are_district_input}         al oulaya
            Click    ${deliveryForm_are_city_select}
            Fill Text    ${deliveryForm_are_city_input}   ${city}
            Click    ${deliveryForm_are_city_choice.replace('$CITYVALUE$', '${city.upper()}')}


         END
         Fill Text    ${deliveryForm_phoneNumber_input}   ${canonical_form_contact_link_files.get('\${phoneNumber}')}

         ################Guest Transaction
         ${return_status_guest}=               Check If Element Is Visible And Warn If Not    ${deliveryForm_email_input}
         IF    $return_status_guest == 'PASS'
            Fill Text    ${deliveryForm_email_input}         ${canonical_form_contact_link_files.get('\${email}')}
         END

         ${return_status_guest}=               Check If Element Is Visible And Warn If Not    ${deliveryForm_newsletter_option}
         IF    $return_status_guest == 'PASS'
             Click        ${deliveryForm_newsletter_option}
         END

    END
     Click        ${deliveryForm_save_button}
     log          delivery infos saved

Payment Form
    [arguments]   ${country}


    IF    $country in ${credit_card_cybersource_countries}
        ${card_type}=   Set Variable    Cybersource
    ELSE IF   $country in ${credit_card_adyen_countries}
        ${card_type}=   Set Variable     Adyen
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


Connect As A Guest
    Click          ${deliveryForm_login_as_guest_user_link}

