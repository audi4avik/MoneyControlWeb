*** Settings ***
Documentation    Elements and interactions for the website Home Page
Library     SeleniumLibrary
Library     DateTime

*** Variables ***
${skipToHomeLink} =     //span[@class='textlik']//a[text()='moneycontrol.com']
${pageUrl} =            https://www.moneycontrol.com/
${mcLogo} =             //div[contains(@class,'logo_home ')]//img[@title='Moneycontrol']
${notifyDiv} =      //div[@class='wzrk-alert wiz-show-animate']
${notifyCancel} =       css=button[id='wzrk-cancel']
${topGainersSection} =     id=in_tgNifty
${topGainersLink} =     link=See all Top Gainers


*** Keywords ***
Validate Home Page Is Loaded
    # Check if Intro page is loaded
    ${skipLinkVisible}      run keyword and return status    element should be visible    ${skipToHomeLink}
    IF    ${skipLinkVisible} == True
        click element     ${skipToHomeLink}
    END

    wait until element is visible    ${mcLogo}      timeout=10s
    location should be  ${pageUrl}

    # try closing home page notification pop up
    TRY
        wait until element is visible    ${notifyDiv}      timeout=10s
        mouse over      ${notifyCancel}
        click element    ${notifyCancel}
    EXCEPT
        log to console    Notification is not visible
    END

    ${timestamp}    get current date    result_format=%Y%m%d%H%M%S      exclude_millis=yes
    capture page screenshot     ${screenshot_dir}${/}Screenshot_${timestamp}.png


User Proceeds To Top Gainers Section
    scroll element into view    ${topGainersSection}
    wait until element is enabled    ${topGainersLink}
    click element    ${topGainersLink}