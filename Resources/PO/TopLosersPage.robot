*** Settings ***
Documentation    Elements and interactions for the Top Losers page
Library    SeleniumLibrary
Library    String
Library    Collections


*** Variables ***
${topLosersHeadingTxt} =   css=h2[class='eenlft UC']
${loserTableLink} =          //th//a/b[text()='% Loss']
${tableBody} =      //div[starts-with(@class,'bsr_table')]/table/tbody
${shareLow} =       //div[starts-with(@class,'bsr_table')]//tbody//td[3]
${shareLoss} =      //div[starts-with(@class,'bsr_table')]//tbody//td[7]
@{listPercent} =
@{listName} =
@{listHigh} =
@{listLow} =


*** Keywords ***
Verify The Top Losers Page Loaded
    Wait Until Element Is Visible    ${topLosersHeadingTxt}
    ${headingTxt} =     Get Text     ${topLosersHeadingTxt}
    Should Contain   ${headingTxt}        NSE - Top Losers        ignore_case=True
    Scroll Element Into View    ${loserTableLink}


Capture List Of Shares With More Than One Percent Loss
    ${countGain}       Get Element Count       ${shareLow}
    ${intList}         Convert To Integer      ${countGain}

    FOR    ${i}     IN RANGE    1   ${intList}+1
        Scroll Element Into View    (${shareLoss})[${i}]
        ${gainValue}    Get Text    (${shareLoss})[${i}]
        ${gainValueNum} =   Convert To Number   ${gainValue}

        IF    ${gainValueNum} < -1
            Append To List      ${listPercent}    ${gainValue}
            ${name} =           Get Text          ${tableBody}/tr[${i}]/td[2]/preceding-sibling::td
            Append To List      ${listName}       ${name}
            ${highValue} =      Get Text          ${tableBody}/tr[${i}]/td[2]
            Append To List      ${listHigh}       ${highValue}
            ${lowValue} =       Get Text          (${shareLow})[${i}]
            Append To List      ${listLow}        ${lowValue}
        END
    END

    RETURN      ${listPercent}      ${listName}     ${listHigh}     ${listLow}
    

Capture List Of Five Shares With Top Loss
    FOR    ${i}     IN RANGE    1   6
        Scroll Element Into View    (${shareLoss})[${i}]
        ${lossValue}    Get Text    (${shareLoss})[${i}]
        ${lossValueNum} =   Convert To Number   ${lossValue}

        IF    ${lossValueNum} < 0
            Append To List      ${listPercent}    ${lossValue}
            ${name} =           Get Text          ${tableBody}/tr[${i}]/td[2]/preceding-sibling::td
            Append To List      ${listName}       ${name}
            ${highValue} =      Get Text          ${tableBody}/tr[${i}]/td[2]
            Append To List      ${listHigh}       ${highValue}
            ${lowValue} =       Get Text          (${shareLow})[${i}]
            Append To List      ${listLow}        ${lowValue}

        ELSE
            Log To Console    This Share has not booked any loss today
        END

    END

    RETURN      ${listPercent}      ${listName}     ${listHigh}     ${listLow}