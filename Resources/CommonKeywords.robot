*** Settings ***
Documentation    This file holds the common resources
Library  SeleniumLibrary
Library  OperatingSystem
Library  ../Library/webdriversync.py

*** Keywords ***
Start Test Suite
    log to console    This is the start of NSE India test suite
    remove files     ${output_dir}/*.png
    remove files      ${screenshot_dir}/*.png
    set global variable    ${screenshot_dir}

Begin Test
    [Arguments]    ${browser}   ${baseUrl}
     IF    "${browser}"== "chrome"
        ${webdriver_path}=   webdriversync.get chromedriver
#    ELSE IF    "${browser}"== "edge"
#        ${webdriver_path}=   webdriversync.get edgedriver
    ELSE
        log    Stay tuned! More browser support coming soon.
    END
    open browser    about:blank     browser=${browser}    executable_path=${webdriver_path}
    maximize browser window
    go to    ${baseUrl}

End Test
    register keyword to run on failure    capture page screenshot
    run keyword if test failed      log    Test has failed. Please check detailed log.
    run keyword if test passed      log    Test passed successfully.
    delete all cookies
    close browser

End Test Suite
    log to console    This is the end of all tests.