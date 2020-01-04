*** Settings ***
Library  RequestsLibrary

*** Variables ***
${Base_URl}   https://thetestingworldapi.com/


*** Test Cases ***
TC_001_Get_Request
    #log to console  ${Base_URl}
    create session  Get_Student_Details  ${Base_URl}
    ${response}=  get request  Get_Student_Details  api/studentsDetails
    log to console  ${response.status_code}
    log to console  ${response.content}


