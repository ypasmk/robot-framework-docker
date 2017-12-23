*** Settings ***
Library     Selenium2Library
Library     XvfbRobot

*** Variables ***
${TMP_PATH}                 /tmp

*** Test Cases ***
Open Google
    Start Virtual Display    1920    1080
    Open Chrome Browser
    GoTo    http://google.com
    ${title}=       Get Title
    Should Be Equal    Google    ${title}

*** Keywords ***
Open Chrome Browser
    ${options}  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    Call Method  ${options}  add_argument  --no-sandbox
    ${prefs}    Create Dictionary    download.default_directory=${TMP_PATH}
    Call Method    ${options}    add_experimental_option    prefs    ${prefs}
    Create Webdriver    Chrome    chrome_options=${options}


