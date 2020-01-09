*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections
Resource  ../../Resources/UserKeyword.robot

*** Variables ***
${Base_URl}   https://thetestingworldapi.com/

*** Test Cases ***
TC_005_PostRequest
    create session  AddData  ${Base_URl}
    ${header}=  create dictionary    Content-Type=application/json
    ${body}=  Fetch Request Content

    ${response}=  post request  AddData  api/studentsDetails  data=${body}  headers=${header}
    log to console  ${response.status_code}
    log to console  ${response.content}
    ${actual_code}=  convert to string  ${response.status_code}
    should be equal  ${actual_code}  201