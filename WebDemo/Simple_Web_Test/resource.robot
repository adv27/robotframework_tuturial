*** Settings ***
Library           Selenium2Library
Library           Collections

*** Variables ***
&{PATH_DICT}            Firefox=./webdriver/geckodriver
...                     Chrome=./webdriver/chromedriver
${BROWSER}              Firefox
${TITLE}                Google
${HOME_URL}             https://www.google.com

*** Keywords ***
Open Browser
    Create Webdriver    ${BROWSER}    executable_path=${PATH_DICT["${BROWSER}"]}
    Maximize Browser Window

Go to homepage
    Go To    ${HOME_URL}

Google page should be open
    Title Should Be     ${TITLE}
    Page Should Contain Element     xpath=//*[@id="lst-ib"]


