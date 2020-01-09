*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections
Library  ../ReadContent/ReadJsonContent.py

*** Variables ***
${Base_URl}   https://thetestingworldapi.com/

*** Keywords ***
Fetch and Validate Get Status Code
    [Arguments]  ${studentId}  ${expectedStatusCode}
    [Documentation]  This keyword is for validating status code of given student
    create session  AppAccess  ${Base_URl}
    ${response}=  get request  AppAccess  api/studentsDetails/${studentId}
    ${actual_code}=  convert to string  ${response.status_code}
    should be equal  ${actual_code}  ${expectedStatusCode}

Fetch and Return Get Response
    [Arguments]  ${studentId}
    create session  AppAccess  ${Base_URl}
    ${response}=  get request  AppAccess  api/studentsDetails/${studentId}
    return from keyword  ${response}

Fetch Request Content
    ${jsonBody}=  read request content
    return from keyword  ${jsonBody}

Welcome User
    [Documentation]  Executing New Test Case
    log to console  This ist starting of Test Case

End TestCase
    [Documentation]  TestCase Completed
    log to console  This ist end of Test Case