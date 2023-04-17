*** Settings ***
Documentation    This file holds the common resources
Library  SeleniumLibrary
Library  OperatingSystem
Library  ../Library/webdriversync.py

*** Keywords ***
Start Test Suite
    Log To Console      This is the start of NSE India test suite
    Remove Files        ${output_dir}/*.png
    Remove Files        ${screenshot_dir}/*.png
    Set Global Variable        ${screenshot_dir}
    Set Global Variable        ${excelPath}

Begin Test
    [Arguments]    ${browser}   ${baseUrl}
    IF    "${browser}"== "chrome"
        ${webdriver_path}=   webdriversync.get chromedriver
#    ELSE IF    "${browser}"== "edge"
#        ${webdriver_path}=   webdriversync.get edgedriver
    ELSE
        log    Stay tuned! More browser support coming soon.
    END
    Open Browser        about:blank     browser=${browser}    executable_path=${webdriver_path}
    Maximize Browser Window
    Go To    ${baseUrl}

End Test
    Register Keyword To Run On Failure     capture page screenshot
    Run Keyword If Test Failed      log    Test has failed. Please check detailed log.
    Run Keyword If Test Passed      log    Test passed successfully.
    Delete All Cookies
    Close Browser

End Test Suite
    Log To Console    This is the end of all tests.