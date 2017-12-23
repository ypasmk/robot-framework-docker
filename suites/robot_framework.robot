*** Settings ***
Force Tags          RobotTestCase


*** Variables ***

${robotVar} =            FooBarBaz


*** Test Cases ***

Foo Test Case
    [tags]              RobotWebPage
    [Documentation]     Created by Ipatios Asmanidis
    Log     %{USERNAME}
