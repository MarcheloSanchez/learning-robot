*** Settings ***
Library  SeleniumLibrary
Variables    ../Resources/Variables.py
Variables    ../Resources/Configurations.py
Resource    ../Resources/CommonKeywords.robot
Resource    ../Resources/SearchKeywords.robot
Variables   ../Resources/AdditionalVariables.py

*** Test Cases ***
Vytvořeni Navrhu Zmeny
    login
    open_pocin
    open_etapu
#    open_nz
    Prijmout_etapuNZ
    Zalozit_NZ
    Fill_in_NZ
    Fill_in_zalozky_NZ
    Vytvorit_NZ
#    Predat_NZ
*** Keywords ***
Prijmout_etapuNZ
    click button    xpath:(//button[@type='button'][contains(text(),'Přijmout')])[2]
    loadingbike

Zalozit_NZ
#Click on zalozka
    click element    xpath:(//a[contains(text(),'Návrh změny')])[1]
    #Založit etapu
    click element    xpath:(//span[@class='fas fa-plus-square'])[5]
    loadingbike


Fill_in_NZ
    loadingbike
    #input text    xpath: //body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[4]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[2]/div[1]/app-layout[1]/div[1]/as-split[1]/as-split-area[1]/app-layout[1]/div[1]/app-layout[1]/div[1]/app-layout[3]/div[1]/app-layout[1]/div[1]/app-layout[5]/div[1]/app-layout[1]/div[1]/app-combobox[1]/app-user-editable[1]/div[1]/div[1]/input[1]       Standardní
    click element    xpath://body//app-root//app-layout[@class='ng-star-inserted']//app-layout[@class='ng-star-inserted']//app-layout[@class='ng-star-inserted']//app-layout[@class='ng-star-inserted']//app-layout[@class='ng-star-inserted']//app-layout[@class='ng-star-inserted']//app-layout[5]//div[1]//app-layout[1]//div[1]//app-combobox[1]//app-user-editable[1]//div[1]//div[1]//button[1]
    Click Element Using JavaScript    //td[normalize-space()='Standardní']
    #sleep    1
    input text      xpath://app-text[@id='3609852300166_ContainerL_LP_NAVRH_ZMENY_POPIS_Field']//input[@type='search']      ${nazev_etapy}

    #${item1} =  Get Table Cell   xpath://div[@class='show dropdown-menu ng-star-inserted']//table  2   2  # you don't need this for what you're doing
    #${item2} =  Get Table Cell   xpath://div[@class='show dropdown-menu ng-star-inserted']//table  2   2
    #Click Link      ${item2}


    #click element    xpath://td[contains(text(),'Standardní')]
    loadingbike

    double click element    xpath://app-assigner[@id='3609852600166_ContainerL_LP_NAVRH_ZMENY_RESITEL_ZAM_ID_Field']//app-user-editable//input[@placeholder='[nevyplneno]']    #Zpracovatel
    loadingbike
    sleep    1
    input text    ${SEARCH_POLE_ZPRACOVATEL}    ${ZPRACOVATEL}
    Press Keys    ${SEARCH_POLE_ZPRACOVATEL}    ENTER
    loadingbike
    double click element    xpath://body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[5]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[2]/div[1]/app-table[1]/div[1]/div[1]/table[1]/tbody[1]/tr[1]/td[2]/app-textarea-cell[1]
    loadingbike
    double click element    xpath://body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[4]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[2]/div[1]/app-layout[1]/div[1]/as-split[1]/as-split-area[1]/app-layout[1]/div[1]/app-layout[1]/div[1]/app-layout[3]/div[1]/app-layout[1]/div[1]/app-layout[6]/div[1]/app-layout[1]/div[1]/app-assigner[1]/app-user-editable[1]/input[1]    #Zpracovatel
    loadingbike
    input text    ${SEARCH_POLE_SCHVALOVATEL}    ${SCHVALOVATEL}
    Press Keys    ${SEARCH_POLE_SCHVALOVATEL}    ENTER
    loadingbike
    double click element    xpath://body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[5]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[2]/div[1]/app-table[1]/div[1]/div[1]/table[1]/tbody[1]/tr[1]/td[2]/app-textarea-cell[1]
    loadingbike
    #Ulozeni
    click button    xpath:(//button[@class='btn btn-light dropdown-toggle'][normalize-space()='Soubor'])[4]
    click element   xpath:(//div[@class='menu-child-item ng-star-inserted'][contains(text(),'Uložit')])[1]
    loadingbike
    #Mapové okno
    click element   xpath:(//button[@type='button'][contains(text(),'Otevřít mapové okno')])[3]
    loadingbike
    sleep    2
    #Kliknout na funkci pro zakreslení
    click element   xpath://div[@id='map-theme-container']//div//div//div//button//span
    loadingbike
    #Namířit myší
    Wait Until Page Contains Element  ${MAP_ELEMENT}
    CLICK ELEMENT AT COORDINATES    ${MAP_ELEMENT}  0     100
    CLICK ELEMENT AT COORDINATES    ${MAP_ELEMENT}  100     100
    CLICK ELEMENT AT COORDINATES    ${MAP_ELEMENT}  100     0
    CLICK ELEMENT AT COORDINATES    ${MAP_ELEMENT}  0     100
    loadingbike
    click button    xpath://div[@class='docker-tab active']//button[@title='Zavřít']
    loadingbike
#   Uložení zakresleného polygonu
    click button    xpath:(//button[@class='btn btn-light dropdown-toggle'][normalize-space()='Soubor'])[4]
    click element   xpath:(//div[@class='menu-child-item ng-star-inserted'][contains(text(),'Uložit')])[1]
    loadingbike


Fill_in_zalozky_NZ
    loadingbike
    #Predmet navrhu zmeny
    click element    xpath://a[contains(text(),'Předmět návrhu změny')]
    #Pridat predmet
    click element    xpath://body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[4]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[2]/div[1]/app-layout[1]/div[1]/as-split[1]/as-split-area[2]/app-layout[1]/div[1]/app-layout[1]/div[1]/app-tab[1]/div[1]/div[2]/div[1]/app-layout[1]/div[1]/app-layout[1]/div[1]/app-table[1]/div[1]/app-toolbar[1]/div[1]/div[1]/span[1]
    loadingbike
    click element    xpath://div[@class='ng-star-inserted']//button[@class='form-control dropdown-toggle']
    sleep    1
    #vybrat predmet
    click element    xpath://td[normalize-space()='Linka osy koleje']
    loadingbike
    #Nepovolene
    click element    xpath://a[contains(text(),'Nepovolené změny')]
    click element    xpath://body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[4]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[2]/div[1]/app-layout[1]/div[1]/as-split[1]/as-split-area[2]/app-layout[1]/div[1]/app-layout[1]/div[1]/app-tab[1]/div[1]/div[2]/div[1]/app-layout[1]/div[1]/app-layout[1]/div[1]/app-table[1]/div[1]/app-toolbar[1]/div[1]/div[1]/span[1]
    loadingbike
    click element    xpath://div[@class='ng-star-inserted']//button[@class='form-control dropdown-toggle']
    sleep    1
    #vybrat zmeny
    click element    xpath://td[normalize-space()='Objekty mimo PTS']
    click button    xpath:(//button[@class='btn btn-light dropdown-toggle'][normalize-space()='Soubor'])[4]
    click element   xpath:(//div[@class='menu-child-item ng-star-inserted'][contains(text(),'Uložit')])[1]
    loadingbike

Open_NZ

    click element    xpath:(//a[contains(text(),'Návrh změny')])[1]
    sleep    1
    double click element    xpath://body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[3]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[2]/div[1]/app-layout[1]/div[1]/as-split[1]/as-split-area[2]/app-layout[1]/div[1]/app-layout[1]/div[1]/app-tab[1]/div[1]/div[2]/div[1]/app-layout[1]/div[1]/app-layout[1]/div[1]/app-table[1]/div[1]/div[1]/table[1]/tbody[1]/tr[1]/td[5]

Vytvorit_NZ
    loadingbike
    click element    xpath://button[contains(text(),'Vytvořit návrh změny')]

Predat_NZ
    loadingbike
    click element    xpath://app-button[@id='18740435500166_BTN_PREDAT_KE_SCHVALENI']//button[@type='button'][contains(text(),'Předat')]

LoadingBike
    sleep    2
    Wait Until Page Does Not Contain element 	xpath://div[@class='ngx-spinner-overlay ng-tns-c15-0 ng-trigger ng-trigger-fadeIn ng-star-inserted']    60

