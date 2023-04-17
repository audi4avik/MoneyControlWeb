*** Settings ***
Documentation    Elements and interactions for the Top Gainers page
Library    SeleniumLibrary
Library    String
Library    Collections
Library    ExcelLibrary


*** Variables ***
${topGainersHeadingTxt} =   css=h2[class='eenlft UC']
${gainTableLink} =          //th//a/b[text()='% Gain']
${shareLow} =       //div[starts-with(@class,'bsr_table')]//tbody//td[3]
${shareGain} =      //div[starts-with(@class,'bsr_table')]//tbody//td[7]
@{listGainers} =
@{listName} =
@{listHigh} =
@{listLow} =


*** Keywords ***
TopGainersPage.Capture List Of Shares With Top Gains
    Wait Until Element Is Visible    ${topGainersHeadingTxt}
    ${headingTxt} =     Get Text     ${topGainersHeadingTxt}
    Should Contain   ${headingTxt}        NSE - Top Gainers        ignore_case=True

    #change the sorting to descending gainers
    Scroll Element Into View    ${gainTableLink}
    ${countGain}       Get Element Count       ${shareGain}
    ${intList}     Convert To Integer      ${countGain}

    FOR    ${i}     IN RANGE    1   ${intList}+1
        Scroll Element Into View    (${shareGain})[${i}]
        ${gainValue}    Get Text    (${shareGain})[${i}]
        ${gainValueNum} =   Convert To Number   ${gainValue}

        IF    ${gainValueNum} > 1
            Append To List      ${listGainers}    ${gainValue}
            ${name} =           Get Text          //div[starts-with(@class,'bsr_table')]/table/tbody/tr[${i}]/td[2]/preceding-sibling::td
            Append To List      ${listName}       ${name}
            ${highValue} =      Get Text          //div[starts-with(@class,'bsr_table')]/table/tbody/tr[${i}]/td[2]
            Append To List      ${listHigh}       ${highValue}
            ${lowValue} =       Get Text          (${shareLow})[${i}]
            Append To List      ${listLow}        ${lowValue}
        END
    END

    RETURN      ${listGainers}      ${listName}     ${listHigh}     ${listLow}


TopGainersPage.Write Top Gainers Data Into Excel Sheet
    Open Excel Document    filename=${excelPath}       doc_id=docid
    Write Excel Column     col_num=1     col_data=${listName}       row_offset=1    sheet_name=Gainers
    Write Excel Column     col_num=2     col_data=${listHigh}       row_offset=1    sheet_name=Gainers
    Write Excel Column     col_num=3     col_data=${listLow}        row_offset=1    sheet_name=Gainers
    Write Excel Column     col_num=4     col_data=${listGainers}    row_offset=1    sheet_name=Gainers
    Save Excel Document    filename=${excelPath}
    Close Current Excel Document