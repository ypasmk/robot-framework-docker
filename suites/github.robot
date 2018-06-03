*** Settings ***
Library         HttpLibrary.HTTP
Force Tags      MediumStoryApi

*** Variables ***
${token}        ?
${requestUri}   /user
${API_TOKEN}    %{ACCESS_TOKEN}

*** Test Cases ***
Access an api request as unauthorized user
    Given users fullname "Ipatios Asmanidis"
    When is fetching his profile from api
    Then request is forbidden

Access an api request as authorized user
    Given users fullname "Ipatios Asmanidis"
      And user is authorized
    When is fetching his profile from api
    Then users profile is retrieved

*** Keywords ***
users fullname "${fullname}"
    Set Suite Variable      ${fullname}     ${fullname}

is fetching his profile from api
    Create Http Context     api.github.com      scheme=https
    Set Request Header      User-Agent          Robot-Testing
    Next Request May Not Succeed
    Log                     ${requestUri}
    GET                     ${requestUri}${token}
    
request is forbidden
    Response Status Code Should Equal          401
    Response Body Should Contain        Requires authentication

user is authorized
    Set Suite Variable      ${token}       ?access_token=${API_TOKEN}            
    Log     ${token}

users profile is retrieved
    Log Response Body	
    Response Status Code Should Equal          200
    Response Body Should Contain        ${fullname}