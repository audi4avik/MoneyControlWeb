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
    [Tags]    gainers
    Given User Is On The MoneyControl Website
    And User Proceeds To See Top Gainers
    When User Views The Top One Percent Gainers
    Then User Should Be Able To Capture The Data In Excel   ${sheetNames}[0]


TC02_Validate And Capture Top 5 Gainers
    [Documentation]    Capture the top five shares with gain
    [Tags]    top5
    Given User Is On The MoneyControl Website
    And User Proceeds To See Top Gainers
    When User Views The Top Five Gainers
    Then User Should Be Able To Capture The Data In Excel   ${sheetNames}[1]


TC03_Validate And Capture Top Losers From Market List
    [Documentation]    Capture the list of shares where %Loss is > 1%
    [Tags]    losers
    Given User Is On The MoneyControl Website
    And User Proceeds To See Top Losers
    When User Views The Top One Percent Losers
    Then User Should Be Able To Capture The Data In Excel   ${sheetNames}[2]


TC04_Validate And Capture Top 5 Losers
    [Documentation]    Capture the top five shares with loss
    [Tags]    bottom5
    Given User Is On The MoneyControl Website
    And User Proceeds To See Top Losers
    When User Views The Top Five Losers
    Then User Should Be Able To Capture The Data In Excel   ${sheetNames}[3]