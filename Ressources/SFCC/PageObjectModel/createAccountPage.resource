*** Keywords ***
Create A New Account
    [Arguments]
    ...    ${FirstName}
    ...    ${LastName}
    ...    ${Email}
    ...    ${mypassword}
    ...    ${BirthDate}
    ...    ${country}
    ...    ${emailOption}
    ...    ${isLoyaltyMember}
    ...    ${salutation}


    Generate And Fill Email Input



    # COUNTRY
    ${generated_country}=    Set Variable    ${country}




    # Decline welcome offer
    ${return_status}    ${return_value}=    Run Keyword And Warn On Failure    Wait For Elements State    ${welcome_offer_popup}    visible
    IF    $return_status == 'PASS'
        Log To Console    Waiting for welcome offer to appear
        Wait For Elements State    ${refuse_welcome_offer}    visible    timeout=30s
        Click    ${refuse_welcome_offer}
        Log To Console    Welcome offer refused
    END

    # SALUTATION
    IF  $country != 'USA' and $country != 'CAN'
        ${newsalutation}=    Choose Salutation    ${salutation}    ${country}
        ${generated_salutation}=    Set Variable    ${newsalutation}

        IF    $newsalutation == 'M'
            Click    ${M}
        ELSE IF    $newsalutation == 'Mme'
            Click    ${Mme}
        ELSE
            Click    ${Mlle}
        END
    END

    # FIRST NAME
    ${FirstName}=    Generate FirstName    ${FirstName}
    ${generated_FirstName}=    Set Variable    ${FirstName}
    Fill Text    ${First_Name_field}    ${FirstName}

    # LAST NAME
    ${LastName}=    Generate lastName    ${LastName}
    ${generated_LastName}=    Set Variable    ${LastName}
    Fill Text    ${last_name_field}    ${LastName}

    # CLICK ON EMAIL TO NOT CHANGE IT
    Click    ${email_div}

    # FILL THE PASSWORD
    FillPassword    ${mypassword}

    # FILL THE PHONE (GBR only)
     IF  $country == 'GBR'
        ${phone_number}=            Run Keyword    Faker_${TEST_NAME}.Phone Number
        ${phone_number}=            Replace String Using Regexp    ${phone_number[::-1]}    [^0-9]    ${EMPTY}

        IF  $country == 'GBR'
            Fill Text    ${phone_field}    ${phone_number[0:10][::-1]}
        END

    END

    ###FILL THE BIRTHDATE
    ${BirthDate}=    Generate BirthDate    ${BirthDate}
    ${generated_BirthDate}=    Set Variable    ${BirthDate}
    Fill Text    ${birthday}    ${BirthDate}
    Wait For Elements State    ${date_invalid}    hidden    timeout=10s

    ###CHOOSE THE COUNTRY IF THE USER IS FROM THE BNL
    IF    $country == 'BEL' or $country == 'LUX' or $country == 'NLD'
        Click    ${select_region}
        Click    ${newaccount_${country}}
    END
#

    ###CLICK ALL THE BUTTONS (LOYALTY, OPTIN ....) AND SUBMIT
    ${emailOption}=    Click Button emailOption    ${emailOption}
    ${generated_emailOption}=    Set Variable    ${emailOption}

    ${isLoyaltyMember}=    Click Button isLoyaltyMember    ${isLoyaltyMember}
    ${generated_isLoyaltyMember}=    Set Variable    ${isLoyaltyMember}

    Click Button agreeToTerms and privacypolicy    ${country}
    Click    ${submit_button}
    RETURN    ${generated_FirstName}    ${generated_LastName}    ${generated_Email}    ${generated_BirthDate}    ${generated_country}    ${generated_salutation}     ${generated_emailOption}    ${generated_isLoyaltyMember}





Fill Password
    [Arguments]    ${mypassword}
    ${mypassword}=    Generate Password    ${mypassword}
    Fill Secret    ${account_password}    $mypassword




Click Button emailOption
    [Arguments]    ${emailOption}
    # receive infos by Email
    IF    $emailOption == 'YES'
        Click    ${email_option_yes}
        RETURN    ${emailOption}
    ELSE
        Click    ${email_option_no}
        RETURN    ${emailOption}
    END

    RETURN    ${emailOption}

Click Button isLoyaltyMember
    [Arguments]    ${isLoyaltyMember}
    IF    $isLoyaltyMember == 'YES'
        Click    ${is_loyalty_member_yes}
        RETURN    ${isLoyaltyMember}
    ELSE
        Click    ${is_loyalty_member_no}
        RETURN    ${isLoyaltyMember}
    END

Click Button agreeToTerms and privacyPolicy
    [Arguments]    ${country}
    # additional buttons for usa and italy
    IF    $country == 'USA'    Click    ${agree_to_terms}
    IF    $country == 'ITA'    Click    ${privacy_policy}

Verify Creation
    [Arguments]    ${country}
    Wait For Elements State    ${dashboard}    visible
    ${text}=    Get Text    ${dashboard}
    Should Be Equal    ${creation_text.${country}}    ${text}