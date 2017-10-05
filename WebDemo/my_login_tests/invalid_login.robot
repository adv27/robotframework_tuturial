*** Settings ***
Documentation     A test suite containing tests related to invalid login.
Force Tags        invalid-login
Test Setup        Open Browser To Login Page
Test Teardown     Close Browser
Test Template     Login With Invalid Credentials Should Fail
Resource          resource.robot
Resource          login.robot    #for valid, invalid Username or Password value

*** Variables ***
${ERROR URL}                https://www.facebook.com/login.php?login_attempt=1&lwv=110
${REGISTER URL}             https://www.facebook.com/r.php
${FORGET PASSWORD URL}      https://www.facebook.com/recover/initiate?lwv=120&lwc=1348092

*** Test Cases ***                  USERNAME          PASSWORD
Invalid Username
    [Tags]      invalid-username
                                    ${INVALID USER}    ${VALID PASSWORD}

Invalid Password
                                    ${VALID USER}      ${INVALID PASSWORD}

Invalid Username And Password
                                    ${INVALID USER}    ${INVALID PASSWORD}

Empty Username
                                    ${EMPTY}           ${VALID PASSWORD}

Empty Password
                                    ${VALID USER}      ${EMPTY}

Empty Username And Password
                                    ${EMPTY}           ${EMPTY}

*** Keywords ***
Login With Invalid Credentials Should Fail
    [Arguments]                 ${username}     ${password}
    # Input Username              ${username}
    # Input Password                              ${password}
    # Submit Credentials
    ${DO_LOGIN}=    Set Variable    Do Login
    Run Keyword   ${DO_LOGIN}  ${username}      ${password}
    Set Test Variable           ${username}
    Set Test Variable           ${password}
    #Login Should Have Failed    ${username}     ${password}
    Login Should Have Failed
    Sleep    ${SLEEP TIME}

Login Should Have Failed
    #[Arguments]    ${username}    ${password}
    Location Should Be    ${ERROR URL}
    Run Keyword If    "${username}"=="${INVALID USER}"          Alert URL Should Be Register URL
    ...    ELSE IF    "${username}"=="${EMPTY}"                 Alert URL Should Be Register URL
    ...    ELSE IF    "${password}"=="${INVALID PASSWORD}"      Alert URL Should Be Forget Password URL
    ...    ELSE IF    "${password}"=="${EMPTY}"                 Alert URL Should Be Forget Password URL

Alert URL Should Be Register URL
    ${alert url}=    Get Element Attribute    xpath=//*[@id="globalContainer"]/div[3]/div/div/div/a@href
    Should Be True    "${alert url}"=="${REGISTER URL}"

Alert URL Should Be Forget Password URL
    ${alert url}=    Get Element Attribute    xpath=//*[@id="globalContainer"]/div[3]/div/div/div/a@href
    Should Be True    "${alert url}"=="${FORGET PASSWORD URL}"

Get Random String
    [Return]    Generate Random String    8    [LETTERS]