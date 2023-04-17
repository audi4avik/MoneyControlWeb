*** Settings ***
Documentation   This is the test suite for testing various features of MoneyControl web portal
Resource    ../Input/InputData.robot
Resource    ../Resources/CommonKeywords.robot
Resource    ../Resources/TopGainerLoserKeywords.robot

Suite Setup     CommonKeywords.Start Test Suite
Test Setup      CommonKeywords.Begin Test   ${browser}    ${baseUrl}
Test Teardown   CommonKeywords.End Test
Suite Teardown  CommonKeywords.End Test Suite

*** Test Cases ***
TC01_Validate And Capture Top Gainers From Market List
    [Documentation]    Capture the list of shares where %Gain is > 1%
    [Tags]    top1
    Given User Is On The MoneyControl Website
    When User Proceeds To See Top Gainers
    Then User Should Be Able To Capture The Data In Excel

# TC02_Validate And Capture Top 5 Losers
#    [Documentation]    Capture the top five shares with loss
#    [Tags]    top5

#ToDo: Setup Bitbucket & Jenkins
#ToDo: Connect Sourcetree
#ToDo: Manage dependencies with poetry
#ToDo: Docker & Kubernetes

