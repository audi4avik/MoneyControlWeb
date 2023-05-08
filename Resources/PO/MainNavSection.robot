*** Settings ***
Documentation    Elements and interactions for the website main navigation
Library     SeleniumLibrary

*** Variables ***
${mutualFundLink} =             //li[@cid='2']
${performanceTrackerLink} =     //ul[@class='market_listmenu']//a[@title='Performance Tracker']

*** Keywords ***
Go To Performance Tracker Link
    Wait Until Element Is Enabled    ${mutualFundLink}
    Mouse Over      ${mutualFundLink}
    Click Element   ${performanceTrackerLink}


