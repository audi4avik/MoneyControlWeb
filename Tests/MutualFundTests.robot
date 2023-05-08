*** Settings ***
Documentation   This is the test suite for testing Mutual Fund Listing capturing 1 week change
Resource    ../Input/InputData.robot
Resource    ../Resources/CommonKeywords.robot
Resource    ../Resources/MutualFundKeywords.robot

Suite Setup     CommonKeywords.Start Test Suite
Test Setup      CommonKeywords.Begin Test   ${browser}    ${baseUrl}
Test Teardown   CommonKeywords.End Test
Suite Teardown  CommonKeywords.End Test Suite

#ToDo: Setup Bitbucket & Jenkins
#ToDo: Connect Sourcetree
#ToDo: Manage dependencies with poetry
#ToDo: Docker & Kubernetes

*** Test Cases ***
TC04_Capture List Of Large Cap Funds Based On 1W % Change
    [Documentation]    Retrieve List of Large Cap Funds Where 1W % Change Is Between 1% And 2%
    [Tags]    mflarge
    MutualFundKeywords.User Is On The MoneyControl Website
    MutualFundKeywords.User Proceeds To Mutual Fund Performance Tracker
    MutualFundKeywords.User Captures The List of Mutual Funds For 1W Change

#TC05_Capture List Of Mid Cap Funds Based On 1W % Change
#TC06_Capture List Of Small Cap Funds Based On 1W % Change