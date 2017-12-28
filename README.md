# robot-framework-docker

Quick Start
===========

Clone this repository

    git clone git@github.com:ypasmk/robot-framework-docker.git

Pull the image.

    docker pull ypasmk/robot-framework
    
Run the tests

    cd robot-framework-docker && ./run_tests.sh
    

Contents
========

This image contains the following to facilitate robot testing

Xvfb
----

You can use it to start a visual display and fire up a browser for UI testing.
 
Example (suites/virtual_display.robot):

    Start Virtual Display    1920    1080
    

Selenium2Library
----------------

More details here  http://robotframework.org/Selenium2Library/Selenium2Library.html

Also have a look at **suites/virtual_display.robot**

HttpLibrary.HTTP
----------------

More details here https://github.com/peritus/robotframework-httplibrary

Example:

    Create Http Context     api.some-end-point.com
    GET                     /some/service/that/supports/get
    Verify Status           200
    ${response}=            Get Response Body
    [return]                ${response}
    
robotframework-sshlibrary
-------------------------

More details here http://robotframework.org/SSHLibrary/latest/SSHLibrary.html


robotframework-excellibrary
---------------------------

More details here http://navinet.github.io/robotframework-excellibrary/ExcelLibrary-KeywordDocumentation.html




**ENJOY**


*For any requests or changes please open issues or create pull requests :)*

