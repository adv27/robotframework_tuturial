*** Settings ***
Resource        resource.robot

*** Test Cases ***
Go to Google test
    Open Browser
    Go to homepage
    Google page should be open
    [Teardown]      Close All Browsers