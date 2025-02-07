*** Settings ***
Force Tags        file-processing
Library           OperatingSystem
Library           String
Library           Collections

*** Test Cases ***
Process Data File
    [Tags]    file-reading
    ${FILE_CONTENT}=    Get File    testdata.csv
    Log    ${FILE_CONTENT}
    @{LINES}=    Split to Lines and Remove Header    ${FILE_CONTENT}
    Log    ${LINES}
    ${RESULT}=    Calculate Sum From The List    ${LINES}
    Log    ${RESULT}

*** Keywords ***
Split to Lines and Remove Header
    [Arguments]    ${FILE_CONTENT}
    @{LINES}=    Split To Lines    ${FILE_CONTENT}
    Remove From List    ${LINES}    0
    [Return]    @{LINES}

Calculate Sum From The List
    [Arguments]    ${LIST}
    ${RESULT}=    Set Variable    0
    : FOR    ${LINE}    IN    @{LIST}
    \    Log    ${LINE}
    \    @{COLUMNS}=    Split String    ${LINE}    separator=,
    \    ${VALUE}=    Get From List    ${COLUMNS}    2
    \    Log    ${VALUE}
    \    ${RESULT}=    Evaluate    ${RESULT}+${VALUE}
    [Return]    ${RESULT}
