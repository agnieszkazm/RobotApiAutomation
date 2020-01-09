*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections

*** Variables ***
${Base_URl}   https://thetestingworldapi.com/
${StudentID}  153774

*** Test Cases ***
TC_006_PutRequest
    create session  AddData  ${Base_URl}
    ${body}=  create dictionary    id=${StudentID}  first_name= NameAgaChange1   middle_name= middleAga  last_name= lastAga  date_of_birth =12/12/1990
    ${header}=  create dictionary    Content-Type=application/json

    ${response}=  put request  AddData  api/studentsDetails/${StudentID}  data=${body}  headers=${header}
    log to console  ${response.status_code}
    log to console  ${response.content}
    ${actual_code}=  convert to string  ${response.status_code}
    should be equal  ${actual_code}  200
    #check
    ${responseGet_Check}=  get request  AddData  api/studentsDetails/${StudentID}
    log to console  ${responseGet_Check.content}

