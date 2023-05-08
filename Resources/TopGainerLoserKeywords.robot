*** Settings ***
Documentation    Custom keywords specific to Equity Market Watch Page
Resource    ./PO/HomePage.robot
Resource    ./PO/TopGainersPage.robot
Resource    ./PO/TopLosersPage.robot
Resource    ./PO/ExcelCaptureData.robot

*** Keywords ***
User Is On The MoneyControl Website
    HomePage.Validate Home Page Is Loaded

User Proceeds To See Top Gainers
    HomePage.User Proceeds To Top Gainers Section
    TopGainersPage.Verify The Top Gainers Page Loaded

User Proceeds To See Top Losers
    HomePage.User Proceeds To Top Losers Section
    TopLosersPage.Verify The Top Losers Page Loaded

User Views The Top One Percent Gainers
    TopGainersPage.Capture List Of Shares With More Than One Percent Gain

User Views The Top Five Gainers
    TopGainersPage.Capture List Of Five Shares With Top Gain

User Views The Top One Percent Losers
    TopLosersPage.Capture List Of Shares With More Than One Percent Loss

User Views The Top Five Losers
    TopLosersPage.Capture List Of Five Shares With Top Loss

User Should Be Able To Capture The Data In Excel
    [Arguments]    ${sheetName}
    ExcelCaptureData.Write Captured Data Into Excel Sheet    ${sheetName}