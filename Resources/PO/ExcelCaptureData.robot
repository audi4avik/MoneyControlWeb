*** Settings ***
Documentation    Keywords for writing captured data into excel sheet
Library    ExcelLibrary


*** Keywords ***
Write Captured Data Into Excel Sheet
    [Arguments]    ${sheetName}
    Open Excel Document    filename=${excelPath}       doc_id=docid
    Write Excel Column     col_num=1     col_data=${listName}       row_offset=1    sheet_name=${sheetName}
    Write Excel Column     col_num=2     col_data=${listHigh}       row_offset=1    sheet_name=${sheetName}
    Write Excel Column     col_num=3     col_data=${listLow}        row_offset=1    sheet_name=${sheetName}
    Write Excel Column     col_num=4     col_data=${listPercent}    row_offset=1    sheet_name=${sheetName}
    Save Excel Document    filename=${excelPath}
    Close Current Excel Document