*** Settings ***
Force Tags        condition

*** Test Cases ***
Run-Keyword
    [Tags]    run-keyword
    ${MY_KEYWORD}=    Set Variable    Log
    Run Keyword    ${MY_KEYWORD}    This is a Log

Run-Keyword-If
    [Tags]    run-keyword-if
    ${TYPE}=    Set Variable    Type 1
    Run Keyword If    '${TYPE}' == 'Type 1'    Log    Type 1
    Run Keyword If    '${TYPE}' == 'Type 2'    Log    Type 2
    Run Keyword If    '${TYPE}' == 'Type 3'    Log    Type 3

Run-Keyword-Ignore-Error
    [Tags]    run-keyword-ignore-error
    @{CAPTAINS}=    Create List    Hook    Picard    Jamie
    Run Keyword And Ignore Error    Should Be Empty    ${CAPTAINS}
    Log    Reached this point despite of error
