*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections

*** Variables ***
${Base_URl}   https://thetestingworldapi.com/
${original_first_name}  AgaSayHelloE2E_2
${update_first_name}    AgaUpdatingE2E_2
*** Test Cases ***
TC_007_E2E
    create session  E2E  ${Base_URl}
    ${header}=  create dictionary    Content-Type=application/json
    ${body}=  create dictionary    first_name= ${original_first_name}, middle_name= middlenameaga, last_name= lastaga, date_of_birth =12/12/1998

    ${post_response}=  post request  E2E  api/studentsDetails  headers=${header}  data=${body}
    log to console  ${post_response.status_code}
    log to console  ${post_response.content}
    ${actual_code_post}=  convert to string  ${post_response.status_code}
    should be equal  ${actual_code_post}  201
    #id fetching
    ${json_response_post}  to json  ${post_response.content}
    ${id_list}=  get value from json  ${json_response_post}  id
    log to console  ${id_list}
    ${id}=  get from list  ${id_list}  0

    ${put_body}=  create dictionary    id=${id}  first_name=${update_first_name}  middle_name= middlenameaga  last_name= lastaga  date_of_birth =12/12/1990
    ${put_response}=  put request  E2E  api/studentsDetails/${id}  headers=${header}  data=${put_body}
    log to console  ${put_response.status_code}
    ${actual_code_put}=  convert to string  ${put_response.status_code}
    should be equal  ${actual_code_put}  200
    log to console  ${put_response.content}

    ${get_response}=  get request  E2E  api/studentsDetails/${id}
    log to console  ${get_response.content}
    #parser
    ${json_response_get}=  to json  ${get_response.content}
    @{first_name_list}=  get value from json  ${json_response_get}  data.first_name
    ${first_name}=  get from list  ${first_name_list}  0
    should be equal  ${first_name}  ${update_first_name}

    ${delete_response}=  delete request  E2E  api/studentsDetails/${id}
    ${json_delete}=  to json  ${delete_response.content}
    @{message}=  get value from json  ${json_delete}  status
    ${status_message}=  get from list  ${message}  0
    should be equal  ${status_message}  true


