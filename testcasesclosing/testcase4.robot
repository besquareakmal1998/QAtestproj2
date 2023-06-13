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

NavigatetoDeletionPage
    Wait Until Element Is Visible   //*[@class="dc-btn dc-btn--primary dc-btn__large closing-account__button--close-account"]
    Click Element   //*[@class="dc-btn dc-btn--primary dc-btn__large closing-account__button--close-account"]

CheckBox
    Wait Until Element Is Visible  //label[@class="dc-checkbox closing-account-reasons__checkbox"]//span[@class="dc-text dc-checkbox__label" and contains(text(),"I have other financial priorities.")]
    Click Element  //label[@class="dc-checkbox closing-account-reasons__checkbox"]//span[@class="dc-text dc-checkbox__label" and contains(text(),"I have other financial priorities.")]
    Sleep  5

dc-checkbox__input
*** Test Cases ***
 TestCase4:Verify that user are able to select more than one reason in the checkbox
     Login
     CloseAccountSettings
     NavigatetoDeletionPage
     CheckBox


 
        
