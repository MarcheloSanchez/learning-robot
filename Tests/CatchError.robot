*** Settings ***
Library  SeleniumLibrary
Variables    ../Resources/Variables.py
Variables    ../Resources/Configurations.py
Resource    ../Resources/SearchKeywords.robot
*** Test Cases ***
Kontrola_zalozeni_pocinu
    login
    loadingbike
    open_pocin
    run keyword and continue on failure        page should contain   Nový
    sleep   2

#ErrorCatch
#    login
#    loadingbike
#    click element   xpath://span[normalize-space()='LInO Portál']
#    sleep   1
#    click element   xpath://span[contains(text(),'Počiny')]
#    sleep   1
#    click element   ${SEZNAM_POCINU}
#    sleep   1
#    loadingbike
#    click element    xpath://*[@id="3604962200166_ObjectList"]/div[1]/app-toolbar/div/div[2]/span      #Tlačítko pro založení
#    loadingbike
#    #Uložit
#    click button    xpath://body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[2]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[1]/div[1]/app-menu[1]/div[1]/div[1]/button[1]
#    click element   xpath://body//app-root//div[@role='group']//div//div[1]
#    loadingbike
##    RUN KEYWORD AND CONTINUE ON FAILURE  page should contain    Položka Název(7127100002) nemuže být prázdná
#    sleep    5

*** Keywords ***
Login
    Open browser    ${url}      ${browser}
    Maximize Browser Window
    sleep   1
    input text  xpath://*[@id="username"]     ${username}
    input text  xpath://*[@id="password"]     ${password}
    click button    xpath://button[contains(text(),'Přihlásit')]
    loadingbike

LoadingBike
    sleep    2
    Wait Until Page Does Not Contain element 	xpath://div[@class='ngx-spinner-overlay ng-tns-c15-0 ng-trigger ng-trigger-fadeIn ng-star-inserted']    60
