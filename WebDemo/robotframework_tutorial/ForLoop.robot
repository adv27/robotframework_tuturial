*** Settings ***
Force Tags        for-loop
Library           String

*** Test Cases ***
For-Loop-In-Range
    [Tags]    for-in-range
    : FOR    ${INDEX}    IN RANGE    1    3
    \    Log    ${INDEX}
    \    ${RANDOM_STRING}=    Generate Random String    ${INDEX}    [LETTERS]
    \    Log    ${RANDOM_STRING}

For-Loop-Elements:
    [Tags]    for-each-element
    @{ITEMS}=    Create List    Dinh Anh    Hoang Hiep    Lax Trung
    : FOR    ${ELEMENT}    IN    @{ITEMS}
    \    Log    ${ELEMENT}
    \    ${ELEMENT}=    Replace String    ${ELEMENT}    ${SPACE}    ${EMPTY}
    \    Log    ${ELEMENT}

For-Loop-Exiting
    [Tags]    for-exit
    @{ITEMS}=    Create List    Good Element 1    Break On Me    Good Element 2
    : FOR    ${ITEM}    IN    @{ITEMS}
    \    Log    ${ITEM}
    \    Run Keyword If    '${ITEM}' == 'Break On Me'    Exit For Loop
    \    Log    Do more action here . . .

Repeat-Action
    [Tags]    repeat-action
    Repeat Keyword    2    Log    Repeating this . . .
