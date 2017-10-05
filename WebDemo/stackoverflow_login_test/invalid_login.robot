*** Settings ***
Library             Selenium2Library
Library             String
Suite Setup         Run Keywords    Open Browser to home page
...                                 Home page should be open
...                                 Go to login page from home page
...                                 Login page should be open
Suite Teardown      Close All Browsers

*** Variables ***
#Path to webdriver. Override when tested on other computer
&{PATH_DICT}            firefox=/home/anhvd/Downloads/Webdriver/geckodriver
...                     chrome=/home/anhvd/Downloads/chromedriver
${BROWSER}              Chrome
${HOME_PAGE_URL}        https://stackoverflow.com/
${HOME_PAGE_TITLE}      Stack Overflow - Where Developers Learn, Share, & Build Careers
${LOGIN_PAGE_TITLE}     Log In - Stack Overflow

*** Test Cases ***
Login with random username and password
    ${random_string}=    Get Random String
    Input username    ${random_string}
    ${random_string}=    Get Random String
    Input password    ${random_string}
    Submit Credentials

    Login should have failed

*** Keywords ***
Open Browser to home page
    Create Webdriver    ${BROWSER}    executable_path=${PATH_DICT["${BROWSER.lower()}"]}
    Maximize Browser Window
    Go to home page

Go to login page from home page
    Click element    xpath=/html/body/header/div/div[2]/div/a[1]

Go to home page
    Go To    ${HOME_PAGE_URL}

Home page should be open
    Title Should Be    ${HOME_PAGE_TITLE}

Login page should be open
    Title Should Be    ${LOGIN_PAGE_TITLE}

Login should have failed
    Wait Until Page Contains Element   xpath=/html/body/div[3]/div[2]

Input username
    [Arguments]     ${username}
    Input Text    name=email        ${username}

Input password
    [Arguments]     ${password}
    Input Text    name=password     ${password}

Submit Credentials
    Click Element    id=submit-button

Get random string
    ${random_string}=    Generate Random String    8    [LETTERS]
    [Return]    ${random_string}
