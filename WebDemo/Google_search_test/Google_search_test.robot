*** Settings ***
Library             Selenium2Library
Suite Setup         Open browser using Webdriver
Suite Teardown      Close All Browsers

*** Variables ***
&{PATH DICT}            firefox=/home/anhvd/Downloads/Webdriver/geckodriver
...                     chrome=/home/anhvd/Downloads/chromedriver
${BROWSER}              Chrome
${EXECUTEABLE PATH}     /home/anhvd/Downloads/chromedriver
${HOMEPAGE}             http://google.com.vn

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

Go to homepage
    Go To               ${HOMEPAGE}
