*** Settings ***

Library    RequestsLibrary
Library    Collections
Library    JSONLibrary

*** Variables ***
${base_url}     https://maps.googleapis.com/maps
${Rel_url}      /api/place/nearbysearch/json?



*** Test Cases ***

API Key Test case
    create session      mysession       ${base_url}
    ${params}       create dictionary    location=-33.8670522,151.1957362       radius=500      types=food      name=harbour    key=AIzaSyCoMFAzQqsNsVBNgB4UdbgUWZ2nfZB1irk
    ${response}     get request    mysession    ${Rel_url}      params=${params}
    log to console    ${response.status_code}
    log to console    ${response.content}






*** Keywords ***



