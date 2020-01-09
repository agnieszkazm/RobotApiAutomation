*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections

*** Variables ***
${Base_URl}   https://thetestingworldapi.com/
${StudentID}  151414


*** Test Cases ***
TC_004_DeleteRequest
    create session  AppAccess  ${Base_URl}
    ${response}=  delete request  AppAccess  api/studentsDetails/${StudentID}
    ${actual_code}=  convert to string  ${response.status_code}
    should be equal  ${actual_code}  200
    ${json_response}=  to json  ${response.content}
    @{status_list}=  get value from json  ${json_response}  status
    ${status}=  get from list  ${status_list}  0
    log to console   ${status}
    should be equal  ${status}  true