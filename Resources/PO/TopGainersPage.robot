*** Settings ***
Documentation    Elements and interactions for the Top Gainers page
Library     SeleniumLibrary

*** Variables ***
${topGainersHeadingTxt} =   css=h2[class='eenlft UC']

*** Keywords ***
TopGainersPage.Capture List Of Shares With Top Gains
    wait until element is visible    ${topGainersHeadingTxt}
    ${headingTxt} =     get text     ${topGainersHeadingTxt}
    should contain    ${headingTxt}        NSE - Top Gainers        ignore_case=True

TopGainersPage.Write Top Gainers Data Into Excel Sheet