*** Settings ***

Documentation  single test for login
Library  SeleniumLibrary

*** Variables ***

${tokenName}   akmalmohd


*** Keywords ***

Login
    Open Browser  https://app.deriv.com/  chrome
    Set Window Size    1280    1024
    Wait Until Page Contains Element    dt_login_button
    Click Element    dt_login_button
    Wait Until Page Contains Element  txtEmail
    Input Text    txtEmail    mohamad.akmal@besquare.com.my
    Input Password    txtPass   55113366Aa*.+
    Click Element    //button[@name="login"]

CloseAccountSettings
    Wait Until Element Is Visible  //*[@class="dc-icon"]
    Wait Until Element Is Visible  //*[@href="/account/personal-details"]
    Click Element  //*[@href="/account/personal-details"]
    Sleep  3
    Wait Until Element Is Visible  //*[@href="/account/closing-account"]
    Click Element  //*[@href="/account/closing-account"]
    Sleep  3
    Wait Until Element Is Visible  //*[@class="dc-btn dc-btn--primary dc-btn__large closing-account__button--close-account"]
    Wait Until Element Is Visible  //*[contains(text(),"If you close your account:")]
    Wait Until Element Is Visible  //*[contains(text(),"Before closing your account:")]

CheckDocumentPdf
    Wait Until Element Is Visible   //*[@href="https://deriv.com/tnc/security-and-privacy.pdf"]
    Click Element  //*[@href="https://deriv.com/tnc/security-and-privacy.pdf"]
    Switch Window  url=https://deriv.com/tnc/security-and-privacy.pdf
    Location Should Be  url=https://deriv.com/tnc/security-and-privacy.pdf
    Sleep  10

    

*** Test Cases ***
 TestCase3:Verify that link to Security and privacy policy redirect to the correct document
     Login
     CloseAccountSettings
     CheckDocumentPdf
        
