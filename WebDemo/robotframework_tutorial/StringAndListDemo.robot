*** Settings ***
Library           String
Library           Collections

*** Variables ***
@{MY_SIMPLE_LIST}    Gossip Girl    Game of Thrones    Mahattan Love Story    Selfie

*** Test Cases ***
String And Lists
    [Tags]    string-and-list
    ${SOME_VALUE}=    Set Variable    This Is A Test Value
    Log    ${SOME_VALUE}
    @{WORDS}=    Split String    ${SOME_VALUE}    ${SPACE}
    ${FIRST}=    Get From List    ${WORDS}    0
    Log    ${FIRST}
    : FOR    ${WORD}    IN    @{WORDS}
    \    Log    ${WORD}

Checking List Length
    [Tags]    list-test    list-length
    ${LEN}=    Get Length    ${MY_SIMPLE_LIST}
    Should Be Equal As Integers    ${LEN}    4

Check List Test
    [Tags]    list-test    check-list
    List Should Contain Value    ${MY_SIMPLE_LIST}    Game of Thrones
    List Should Not Contain Duplicates    ${MY_SIMPLE_LIST}

Process List Test
    [Tags]    list-test    process-list-test
    ${ELEMENT}=    Remove From List    ${MY_SIMPLE_LIST}    0
    Should be equal    ${ELEMENT}    Gossip Girl

Further Process List Test
    [Tags]    list-test    further-process-list-test
    ${NUM}=    Get Length    ${MY_SIMPLE_LIST}
    Should Be Equal As Integers    ${NUM}    3
    Append To List    ${MY_SIMPLE_LIST}    The Flash
    @{TEMP_LIST}=    Create List    The Flash    Selfie
    List Should Contain Sub List    ${MY_SIMPLE_LIST}    ${TEMP_LIST}
