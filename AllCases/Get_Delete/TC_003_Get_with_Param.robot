*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections

*** Variables ***
${Base_URl}   https://regres.in


*** Test Cases ***
TC_003_Get_with_Param
    create session  GetParams  ${Base_URl}
    &{param}=  create dictionary  page=2
    ${response}=  get request  GetParams  api/users  params=${param}
    log to console  ${response.status_code}
    log to console  ${response.content}