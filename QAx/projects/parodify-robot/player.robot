*** Settings ***
Library    Browser    jsextension=${EXECDIR}/resources/module.js

Test Setup        Start session
Test Tearddown    Finish session

*** Test Cases ***
Deve tocar uma musica
    ${song_name}    Set Variable    Smells Like Teen Spirit
    
    Mock My Song

    Go To    https://parodify.vercel.app

    Get Text    css=.logged-user    contains    Fernando Papito

    ${play}     Get play button     ${song_name}
    
    ${pause}    Get pause button    ${song_name}
    
    Click    ${play}

    Wait For Elements State    ${pause}    visible    2
    Wait For Elements State    ${play}    visible    175

*** Keywords ***
Start session
    New Page    about:black

Finish session
    Take Screenshot

Get play button
    [Arguments]        ${song_name}
    
    ${play}    Set Variable        xpath=//div[contains(@class,"song")]//h6[text()="Smells Like Test Script"]/..//button[contains(@class,"play")]

    RETURN    ${play}

Get pause button
    [Arguments]        ${song_name}
    
    ${pause}    Set Variable        xpath=//div[contains(@class,"song")]//h6[text()="Smells Like Test Script"]/..//button[contains(@class,"pause")]
    RETURN    ${pause}
