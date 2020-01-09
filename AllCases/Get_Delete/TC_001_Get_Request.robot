*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections
Resource  ../../Resources/UserKeyword.robot
Documentation  This test Case is for Making Ge Request
Test Setup  Welcome User
Test Teardown  End TestCase
#Force Tags  Hello
Default Tags  Hello
test timeout  2s


*** Variables ***
${Base_URl}   https://thetestingworldapi.com/


*** Test Cases ***
TC_001_Get_Request
    [Tags]  Smoke  Sanity
    #log to console  ${Base_URl}
    #create session  Get_Student_Details  ${Base_URl}
    #${response}=  get request  Get_Student_Details  api/studentsDetails
    #log to console  ${response.status_code}
    #log to console  ${response.content}


    Fetch and Validate Get Status Code  151414  200
    ${response}=  Fetch and Return Get Response   151414
    log to console  ${response.status_code}
    log to console  ${response.content}
