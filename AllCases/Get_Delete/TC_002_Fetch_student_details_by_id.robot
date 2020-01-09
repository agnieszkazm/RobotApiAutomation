*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections

*** Variables ***
${Base_URl}   https://thetestingworldapi.com/
${StudentID}  151411

*** Test Cases ***
TC_002_Fetch_student_details_by_id.robot
    create session  FetchStudentDetails  ${Base_URl}
    ${response}=  get request  FetchStudentDetails  api/studentsDetails/${StudentID}
    ${actual_code}=  convert to string  ${response.status_code}
    should be equal  ${actual_code}  200
    log to console  ${response.content}
    ${json_response}=  to json  ${response.content}
    @{first_name_list}=  get value from json  ${json_response}  data.first_name
    log to console  @{first_name_list}

    ${first_name}=  get from list  ${first_name_list}  0
    log to console   ${first_name}
    should be equal  ${first_name}  Littin Jomon

