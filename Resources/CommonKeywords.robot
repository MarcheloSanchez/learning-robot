*** Settings ***
Library    SeleniumLibrary
Variables   ../Resources/Variables.py
Variables    ../Resources/Configurations.py
#Přejmenovat tohoto robota na TPIApp.robot ? + Udělat jeden soubor pro testy kde budou sepsany všechny testy volané podle jednotlivých předefinovaných metod.
*** Keywords ***
Click Element Using JavaScript
   [Arguments]             ${xpath}
   ${var}=          Execute Javascript      var xPathRes = document.evaluate("${xpath}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null); xPathRes.singleNodeValue.click();

Login
    #Nezavře prohlížeč a dá se v něm klikat i po failu
    Open browser                ${url}      ${browser}          #options=add_experimental_option("detach", True);add_extension('${EXECDIR}\\AutomatizaceTestu\\ChromeExtension\\SelectorsHubExtension.crx')      #IDK FOR WHAT add_experimental_option('excludeSwitches', ['enable-logging'])
    #Maximize Browser Window
    set window size    1920     1080
    sleep   1
    input text                  xpath://*[@id="username"]     ${username}
    input text                  xpath://*[@id="password"]     ${password}
    click button                xpath://button[contains(text(),'Přihlásit')]
    loadingbike

LoadingBike
    sleep    2
    Wait Until Page Does Not Contain element 	xpath://div[@class='ngx-spinner-overlay ng-tns-c15-0 ng-trigger ng-trigger-fadeIn ng-star-inserted']    ${WAITING_TIME}

Přihlášení
    sleep   1       #Čekačka na loading načtené stránky ; Funguje???
    input text                  xpath://*[@id="username"]     ${username}
    input text                  xpath://*[@id="password"]     ${password}
    click button                xpath://button[contains(text(),'Přihlásit')]
    loadingbike

Begin Web Test
    Open Browser                about:blank  firefox   options=add_experimental_option("detach", True)     #Plugin pro SelectorsHub- options=add_extension('C:\extension_4_7_2_0.crx')
    go to                       ${url}
    #Maximize Browser Window

End Web Test
    Close Browser