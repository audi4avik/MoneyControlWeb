*** Settings ***
Documentation    Custom keywords specific to Equity Market Watch Page
Resource    ./PO/HomePage.robot
Resource    ./PO/MainNavSection.robot
Resource    ./PO/TopGainersPage.robot

*** Keywords ***
User Is On The MoneyControl Website
    HomePage.Validate Home Page Is Loaded

User Proceeds To See Top Gainers
    HomePage.User Proceeds To Top Gainers Section
    TopGainersPage.Capture List Of Shares With Top Gains

User Should Be Able To Capture The Data In Excel
    TopGainersPage.Write Top Gainers Data Into Excel Sheet