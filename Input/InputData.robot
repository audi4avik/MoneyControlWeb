*** Settings ***
Documentation    Input data for MoneyControl Tests

*** Variables ***
${browser} =            chrome
${baseUrl} =            https://www.moneycontrol.com/
${screenshot_dir} =     ${EXECDIR}/Output/Screenshots
${excelPath} =          ${EXECDIR}/Output/MoneyControlResult.xlsx
@{sheetNames} =         TopGainers     FiveGainers      TopLosers     FiveLosers