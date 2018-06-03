*** Settings ***
Library     Selenium2Library
Library     XvfbRobot
Suite Setup     Start Virtual Display    1920    1080
Force Tags      MediumStory

*** Test Cases ***
Check that presents is available in Amazon
    Given user is in amazon web page
    When user searches for "Apple iPad Pro 10.5 Smart Keyboard German"
    Then there are results containing the item
    And the user can add the item to the basket
    And the user can proceed with the Checkout

*** Keywords ***
user is in amazon web page
    Open Chrome Browser
    Go To       https://www.amazon.de 

user searches for "${present_name}"
    Input Text      twotabsearchtextbox     ${present_name}
    Press Key       twotabsearchtextbox     \\13

there are results containing the item
    Wait Until Page Contains     3 Ergebnisse für "Apple iPad Pro 10.5 Smart Keyboard German"   timeout=10

the user can add the item to the basket
    Click Link      Apple iPad Pro 10.5 Smart Keyboard German
    Click Link      In den Einkaufswagen

the user can proceed with the Checkout
    Click Element      hlb-ptc-btn-native
    Capture Page Screenshot

Open Chrome Browser
    ${options}  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    Call Method  ${options}  add_argument  --no-sandbox
    ${prefs}    Create Dictionary    download.default_directory=/tmp
    Call Method    ${options}    add_experimental_option    prefs    ${prefs}
    Create Webdriver    Chrome    chrome_options=${options}