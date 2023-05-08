*** Settings ***
Documentation    Elements and interactions for the website Home Page
Library     SeleniumLibrary
Library     DateTime

*** Variables ***
${skipToHomeLink} =      //span[@class='textlik']//a[text()='moneycontrol.com']
${pageUrl} =             https://www.moneycontrol.com/
${mcLogo} =              //div[contains(@class,'logo_home ')]//img[@title='Moneycontrol']
${notifyDiv} =           //div[@class='wzrk-alert wiz-show-animate']
${notifyCancel} =        css=button[id='wzrk-cancel']
${videoPlayer} =         //div[@class='avp-content']
${playerCloseBtn} =      css=[class^='avp-close-button avp-button']
${topGainersSection} =   id=in_tgNifty
${topGainersLink} =      link=See all Top Gainers
${topLosersSection} =    id=in_tlNifty
${topLosersLink} =       link=See all Top Losers



*** Keywords ***
Validate Home Page Is Loaded
    # Check if Intro page is loaded
    ${skipLinkVisible}      Run Keyword And Return Status        Element Should Be Visible      ${skipToHomeLink}
    IF    ${skipLinkVisible} == True
        Click Element    ${skipToHomeLink}
    END

    Wait Until Element Is Visible       ${mcLogo}      timeout=10s
    Location Should Be      ${pageUrl}

    # try closing home page notification pop up
    TRY
        Wait Until Element Is Visible       ${notifyDiv}      timeout=10s
        Mouse Over      ${notifyCancel}
        Click Element   ${notifyCancel}
    EXCEPT
        Log To Console      Notification is not visible
    END

    # try closing home page video overlay
    TRY
        Wait Until Element Is Visible       ${videoPlayer}     timeout=10s
        Mouse Over      ${playerCloseBtn}
        Click Element   ${playerCloseBtn}
    EXCEPT
        Log To Console      Video player is not visible
    END

    ${timestamp}    Get Current Date        result_format=%Y%m%d%H%M%S      exclude_millis=yes
    Capture Page Screenshot         ${screenshot_dir}${/}Screenshot_${timestamp}.png


User Proceeds To Top Gainers Section
    Scroll Element Into View        ${topGainersSection}
    Wait Until Element Is Enabled        ${topGainersLink}
    Click Element       ${topGainersLink}


User Proceeds To Top Losers Section
    Scroll Element Into View        ${topLosersSection}
    Wait Until Element Is Enabled        ${topLosersLink}
    Click Element       ${topLosersLink}