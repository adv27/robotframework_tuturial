*** Settings ***
Library             Selenium2Library
Suite Setup         Open browser using Webdriver
Suite Teardown      Close All Browsers

*** Variables ***
&{PATH DICT}            edge=./Webdriver/MicrosoftWebDriver.exe
...                     chrome=./Webdriver/chromedriver.exe
${BROWSER}              Chrome
${HOMEPAGE}             http://google.com.vn
${DELAY}                0.5s

*** Test Cases ***
Google search then find
    [Template]      Google and check result
    evolable asia       vn.evolableasia.com/
    python              python.org
    facebook            facebook.com

*** Keywords ***
Google and check result
    [Arguments]     ${search key}   ${result}
    Go to homepage
    Input text      id=lst-ib       ${search key}
    Press Key       id=lst-ib       \\13
    Wait Until Page Contains        ${result}

Open browser using Webdriver
    Create Webdriver    ${BROWSER}    executable_path=${PATH DICT["${BROWSER.lower()}"]}
    Maximize Browser Window
    Set Selenium Speed      ${DELAY}

Go to homepage
    Go To               ${HOMEPAGE}
