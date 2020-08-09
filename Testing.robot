*** Settings ***
Documentation    Suite description
Library          OperatingSystem
Library          Selenium2Library

*** Variable ***
${BROWSER}      chrome
${TITLE}        WorldTicket
${EMAIL}        tester@worldticket.net
${PASSWORD}     atm1234
${USERNAME}     Junior Tester


*** Test Cases ***
Open Web
    Open Browser                            https://ecom-test-dat.worldticket.net/      ${BROWSER}
Check Title
    Click Element                           //*[@id="v-cookielaw"]/div[2]/a[1]
    Element Text Should Be                  //title        ${TITLE}        "Title name not contain "WorldTicket""
Click Profile
    Click Element                           //*[@id="header-account"]
Insert Email And Password
    Wait Until Page Contains Element        //*[@id="email"]
    Input Text                              //*[@id="email"]        ${EMAIL}
    Input Password                          //*[@id="password"]     ${PASSWORD}
Click Button Login
    Click Button                            //*[@id="step-registered-customers"]/div[3]/div/button
Check Username
    Wait Until Page Contains Element        //*[@id="header-account"]/ul/li[1]/a
    Mouse Over                              //*[@id="header-account"]/a/i
    Element Text Should Be                  //*[@id="header-account"]/ul/li[1]/a        ${USERNAME}     "Username not contain "Junior Tester""
Click The Account Information Tab
    Click Element                           //*[@id="account_edit"]
Check Email Address Field
    Wait Until Page Contains Element        //*[@id="email"]
    Textfield Value Should Be               //*[@id="email"]        ${EMAIL}        "email address field is not equal to the login email"