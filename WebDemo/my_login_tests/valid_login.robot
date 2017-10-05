*** Settings ***
Resource          resource.robot
Resource          login.robot		#for valid, invalid Username or Password value

*** Variables ***
${NEWS FEED URL}      	https://www.facebook.com/
${TITLE PATTERN}		Facebook$

*** Keywords ***
Newfeed Page Should Be Open
	Location Should Be 		${NEWS FEED URL}
	${title}=	Get Title
	Should Match Regexp   	${title}	${TITLE PATTERN}
	Page Should Contain Element		id=stream_pagelet	#stream_pagelet is the id of news feed stream's div

*** Test cases ***
Login With Valid Username And Password
	Open Browser To Login Page
	Input Username		${VALID USER}
	Input Password		${VALID PASSWORD}
	Submit Credentials
	Newfeed Page Should Be Open
	Sleep               ${SLEEP TIME}
	[Teardown]    Close Browser