*** Settings ***
Documentation    Elements and interactions for mutual fund listing page
Library    SeleniumLibrary

*** Variables ***
${pgBreadcrumb} =       //ul[@class='bred_list']//h1
${largeCapFundRadio} =  //div[@id='common_accordion']//span[text()='Large Cap Fund']
${mftableItem} =        //table[@id='dataTableId']/tbody/tr

*** Keywords ***
Capture List Of Large Cap Funds
    Wait Until Element Is Visible    ${largeCapFundRadio}
    Element Should Contain    ${pgBreadcrumb}        Performance Tracker : large cap fund
    ${mfCount} =      Get Element Count    ${mftableItem}
    ${mfCount} =      Convert To Number    ${mfCount}

    FOR     ${i}    IN RANGE    ${mfCount}+1
        Scroll Element Into View   ${mftableItem}\[$i]/td/a
        ${mfName} =   Get Text     ${mftableItem}\[$i]/td/a
        ${weeklyChange} =     Get Text      ${mftableItem}\[$i]/td[$i+1]
        Log To Console    ${mfName}     ${weeklyChange}
    END


Capture List Of Mid Cap Funds


Capture List Of Small Cap Funds

