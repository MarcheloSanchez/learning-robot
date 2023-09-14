*** Settings ***
Library  SeleniumLibrary
Variables    ../Resources/Variables.py
Variables    ../Resources/Configurations.py
Resource    ../Resources/CommonKeywords.robot
Resource    ../Resources/SearchKeywords.robot
#Spouštěcí skript on personal
#robot AutomatizaceTestu/Tests/TestLogin.robot
*** Test Cases ***
Login
    #Prozatím to tu je duplikátně(Resources-CommonKeywords) Je potřeba nalinkovat soubor a zjistit jestli je potřeba zavírat prohlížeč
    Open browser                ${url}      ${browser}          options=add_experimental_option("detach", True);add_extension('${EXECDIR}\\AutomatizaceTestu\\ChromeExtension\\SelectorsHubExtension.crx')
    Maximize Browser Window
    sleep   1
#    run keyword and continue on failure     kontrola obrazovky prihlaseni page
#    run keyword and continue on failure     kontrola diakritiky obrazovky prihlaseni page

    input text  xpath://*[@id="username"]     ${username}
#    run keyword and continue on failure     kontrola username prihlaseni page

    input text  xpath://*[@id="password"]     ${password}
#    run keyword and continue on failure     kontrola password prihlaseni page

    click button    xpath://button[contains(text(),'Přihlásit')]
    loadingbike
#    run keyword and continue on failure     kontrola prihlaseni do aplikace

#Login
#    CommonKeywords.Login

*** Keywords ***

Kontrola Obrazovky Prihlaseni page
    page should contain     Přihlášení do aplikace

Kontrola Username Prihlaseni page
    page should contain element     xpath://*[@id="username"]     ${username}

Kontrola Password Prihlaseni page
    page should contain element     xpath://*[@id="password"]    ${password}

Kontrola diakritiky Obrazovky Prihlaseni page
    page should contain     Prihlaseni do aplikace

Kontrola Prihlaseni do aplikace
    page should contain    GEO Admin (pro zapis)
