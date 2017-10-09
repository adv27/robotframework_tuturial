*** Settings ***
Library           Selenium2Library
Library           Collections

*** Variables ***
&{PATH DICT}            Edge=./webdriver/MicrosoftWebDriver.exe
...                     Chrome=./webdriver/chromedriver.exe
${BROWSER}              Edge
${DELAY}                0
${SLEEP TIME}           1s
${LOGIN URL}            https://www.facebook.com/

*** Keywords ***
Open Browser To Login Page
    Create Webdriver    ${BROWSER}    executable_path=${PATH DICT["${BROWSER}"]}
    Maximize Browser Window
    Go To    ${LOGIN URL}
    Set Selenium Speed    ${DELAY}

Go To Login Page
    Go To    ${LOGIN URL}

Do Login
    [Arguments]     ${username}     ${password}
    Input Username  ${username}
    Input Password                  ${password}
    Submit Credentials

Input Username
    [Arguments]    ${username}
    Input Text    email    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    pass    ${password}

Submit Credentials
    Click Element    loginbutton
