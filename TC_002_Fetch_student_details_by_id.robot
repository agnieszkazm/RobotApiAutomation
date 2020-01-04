*** Settings ***
Library  RequestsLibrary

*** Variables ***
${Base_URl}   https://thetestingworldapi.com/
${StudentID}  151411

*** Test Cases ***
TC_002_Fetch_student_details_by_id.robot
    create session  FetchStudentDetails  ${Base_URl}
    ${response}=  get request  FetchStudentDetails  api/studentsDetails/${StudentID}
    ${actual_code}=  convert to string  ${response.status_code}
    should be equal  ${actual_code}  200
    #log to console  ${response.content}


