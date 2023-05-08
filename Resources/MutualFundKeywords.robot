*** Settings ***
Documentation    Custom keywords specific to Equity Market Watch Page
Resource    ./PO/HomePage.robot
Resource    ./PO/MainNavSection.robot
Resource    ./PO/MutualFundListingPage.robot
Resource    ./PO/ExcelCaptureData.robot

*** Keywords ***
User Is On The MoneyControl Website
    HomePage.Validate Home Page Is Loaded

User Proceeds To Mutual Fund Performance Tracker
    MainNavSection.Go To Performance Tracker Link

User Captures The List of Mutual Funds For 1W Change
    MutualFundListingPage.Capture List Of Large Cap Funds
    MutualFundListingPage.Capture List Of Mid Cap Funds
    MutualFundListingPage.Capture List Of Small Cap Funds

User Should Be Able To Capture The Data In Excel
    [Arguments]    ${sheetName}
    ExcelCaptureData.Write Captured Data Into Excel Sheet    ${sheetName}