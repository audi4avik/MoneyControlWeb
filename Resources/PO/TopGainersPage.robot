*** Settings ***
Documentation    Elements and interactions for the Top Gainers page
Library    SeleniumLibrary
Library    String
Library    Collections


*** Variables ***
${topGainersHeadingTxt} =   css=h2[class='eenlft UC']
${gainTableLink} =          //th//a/b[text()='% Gain']
${tableBody} =      //div[starts-with(@class,'bsr_table')]/table/tbody
${shareLow} =       //div[starts-with(@class,'bsr_table')]//tbody//td[3]
${shareGain} =      //div[starts-with(@class,'bsr_table')]//tbody//td[7]
@{listPercent} =
@{listName} =
@{listHigh} =
@{listLow} =


*** Keywords ***
Verify The Top Gainers Page Loaded
    Wait Until Element Is Visible    ${topGainersHeadingTxt}
    ${headingTxt} =     Get Text     ${topGainersHeadingTxt}
    Should Contain   ${headingTxt}        NSE - Top Gainers        ignore_case=True
    Scroll Element Into View    ${gainTableLink}


Capture List Of Shares With More Than One Percent Gain
    ${countGain}       Get Element Count       ${shareGain}
    ${intList}         Convert To Integer      ${countGain}

    FOR    ${i}     IN RANGE    1   ${intList}+1
        Scroll Element Into View    (${shareGain})[${i}]
        ${gainValue}    Get Text    (${shareGain})[${i}]
        ${gainValueNum} =   Convert To Number   ${gainValue}

        IF    ${gainValueNum} > 1
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


Capture List Of Five Shares With Top Gain
    FOR    ${i}     IN RANGE    1   6
        Scroll Element Into View    (${shareGain})[${i}]
        ${gainValue}    Get Text    (${shareGain})[${i}]
        ${gainValueNum} =   Convert To Number   ${gainValue}

        IF    ${gainValueNum} > 0
            Append To List      ${listPercent}    ${gainValue}
            ${name} =           Get Text          ${tableBody}/tr[${i}]/td[2]/preceding-sibling::td
            Append To List      ${listName}       ${name}
            ${highValue} =      Get Text          ${tableBody}/tr[${i}]/td[2]
            Append To List      ${listHigh}       ${highValue}
            ${lowValue} =       Get Text          (${shareLow})[${i}]
            Append To List      ${listLow}        ${lowValue}

        ELSE
            Log To Console    This Share has not booked any profit today
        END

    END

    RETURN      ${listPercent}      ${listName}     ${listHigh}     ${listLow}