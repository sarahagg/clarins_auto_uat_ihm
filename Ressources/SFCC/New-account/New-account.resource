*** Settings ***
Documentation       all the keywords needed to login to the website and accept the cookies

Resource            ..${/}..${/}..${/}Ressources${/}SFCC${/}Common${/}common.resource


*** Keywords ***
Create account
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
    ...    ${regions}
    sleep    1s
    Import FakerLibrary    ${country}
    # COUNTRY
    ${generated_country}=    Set Variable    ${country}
    Connection Button

    # EMAIL
    ${Email}=    Generate Email    ${Email}
    ${generated_Email}=    Set Variable    ${Email}
    Fill text    ${insert_email}    ${Email}
    Click    ${remember}
    Click    ${continuer}

    # SALUTATION
    ${newsalutation}=    choose salutation    ${salutation}    ${country}
    ${generated_salutation}=    set variable    ${newsalutation}
    IF    $country != 'USA'
        IF    $newsalutation == 'M'
            click    ${M}
        ELSE IF    $newsalutation == 'Mme'
            click    ${Mme}
        ELSE
            click    ${Mlle}
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

    ###FILL THE BIRTHDATE
    ${BirthDate}=    Generate BirthDate    ${BirthDate}
    ${generated_BirthDate}=    Set Variable    ${BirthDate}
    Fill Text    ${birthday}    ${BirthDate}
    Wait For Elements State    ${date_invalide}    hidden    timeout=1s

    ###CHOOSE THE COUNTRY IF THE USER IS FROM THE BNL
    IF    $country == 'BNL'
        Click    ${region}
        ${regions}=    Generate Region    ${regions}
        IF    $regions == 'BEL'
            Click    ${NewAcc_Belgique}
        ELSE IF    $regions == 'LUX'
            Click    ${NewAcc_Luxembourg}
        ELSE IF    $regions == 'NLD'
            Click    ${NewAcc_Nederland}
        ELSE
            Log To Console    BNL country not authorized
        END
    END
    ${generated_regions}=    Set Variable    ${regions}

    ###CLICK ALL THE BUTTONS (LOYALTY, OPTIN ....) AND SUBMIT
    ${emailOption}=    FillButton emailOption    ${emailOption}    ${country}
    ${generated_emailOption}=    Set Variable    ${emailOption}

    ${isLoyaltyMember}=    FillButton isLoyaltyMember    ${isLoyaltyMember}    ${country}
    ${generated_isLoyaltyMember}=    Set Variable    ${isLoyaltyMember}

    FillButton agreeToTerms and privacypolicy    ${country}
    Click    ${submit}
    RETURN    ${generated_FirstName}    ${generated_LastName}    ${generated_Email}    ${generated_BirthDate}    ${generated_country}    ${generated_salutation}    ${regions}    ${generated_emailOption}    ${generated_isLoyaltyMember}
