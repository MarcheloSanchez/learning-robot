*** Settings ***
Library  SeleniumLibrary
Variables    ../Resources/Variables.py
Variables    ../Resources/Configurations.py
Resource    ../Resources/CommonKeywords.robot
Resource    ../Resources/SearchKeywords.robot
*** Test Cases ***
Zalozeni Pocinu
    login
#    open_pocin
    create_počin
#    fill_in_počin
    #Uložit počin
    click button    xpath://body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[2]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[1]/div[1]/app-menu[1]/div[1]/div[1]/button[1]
    click element   xpath://body//app-root//div[@role='group']//div//div[1]
    loadingbike
    sleep    5
*** Keywords ***
Create_počin
    click element   xpath://span[normalize-space()='LInO Portál']
    sleep   1
    click element   xpath://span[contains(text(),'Počiny')]
    sleep   1
    click element   ${SEZNAM_POCINU}
    loadingbike
    click element    xpath://*[@id="3604962200166_ObjectList"]/div[1]/app-toolbar/div/div[2]/span      #Tlačítko pro založení
    loadingbike

Fill_in_počin
    #POLE Název počinu - Je potřeba vytvořit vždy unikátní název
    input text    xpath://body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[2]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[2]/div[1]/app-layout[1]/div[1]/as-split[1]/as-split-area[1]/app-layout[1]/div[1]/app-layout[1]/div[1]/app-layout[3]/div[1]/app-layout[1]/div[1]/app-layout[3]/div[1]/app-layout[2]/div[1]/app-text[1]/app-user-editable[1]/input[1]        ${nazev_pocinu}

    #POLE Přípravář
    #WITHOUT ID - CHECKED = xpath://body//app-root//app-layout[@class='ng-star-inserted']//app-layout[@class='ng-star-inserted']//app-layout[@class='ng-star-inserted']//app-layout[@class='ng-star-inserted']//app-layout[@class='ng-star-inserted']//app-layout[@class='ng-star-inserted']//app-layout[@class='ng-star-inserted']//app-layout[1]//div[1]//app-layout[1]//div[1]//app-combobox[1]//app-user-editable[1]//div[1]//div[1]//button[1]
    double click element    xpath://body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[2]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[2]/div[1]/app-layout[1]/div[1]/as-split[1]/as-split-area[1]/app-layout[1]/div[1]/app-layout[1]/div[1]/app-layout[3]/div[1]/app-layout[1]/div[1]/app-layout[4]/div[1]/app-layout[2]/div[1]/app-assigner[1]/app-user-editable[1]/input[1]
    loadingbike
    # Vezme na určitém řádku záznam - click element   xpath://body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[3]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[2]/div[1]/app-table[1]/div[1]/div[1]/table[1]/tbody[1]/tr[18]/td[2]/app-textarea-cell[1]/div[1]
    input text    xpath://th[@id='4593312900159']//input[@type='search']    GEO admin
    Press Keys    xpath://th[@id='4593312900159']//input[@type='search']    ENTER
    loadingbike
    double click element    xpath://tbody/tr/td[2]/app-textarea-cell[1]
    loadingbike
#    click button    xpath://button[contains(text(),'Vybrat a zavřít')]
#    loadingbike

    #POLE Charakter počinu
    click button    xpath://app-combobox[@id='3604944000166_ContainerL_LP_POCIN_LP_CI_POCIN_CHAR_KOD_Field']//input[@type='search']
    click element   xpath://td[contains(text(),'Nestavební')]
    loadingbike
    #POLE Typ počinu
    click button    xpath://app-combobox[@id='3604943700166_ContainerL_LP_POCIN_PTS_CIS_POCIN_TYP_KOD_Field']//input[@type='search']
    loadingbike
    click element   xpath://td[contains(text(),'Administrativní')]
    loadingbike
    #POLE poznámky
    #input text    //body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[3]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[2]/div[1]/app-layout[1]/div[1]/as-split[1]/as-split-area[1]/app-layout[1]/div[1]/app-layout[1]/div[1]/app-layout[3]/div[1]/app-layout[1]/div[1]/app-layout[5]/div[1]/app-layout[2]/div[1]/app-textarea[1]/app-user-editable[1]/textarea[1]     "Test poznámka"
#   Uložení vyplněného počinu
    click button    xpath://body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[2]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[1]/div[1]/app-menu[1]/div[1]/div[1]/button[1]
    click element   xpath://body//app-root//div[@role='group']//div//div[1]
    loadingbike
    #Zakreslení polygonu
    #Kliknout na Otevřít mapové okno
    click button    xpath://button[contains(text(),'Otevřít mapové okno')]
    loadingbike
    #Kliknout na funkci pro zakreslení
    click element   xpath://button[@class='draw-polygon-btn clean-btn ng-star-inserted']
    #Namířit myší
    Wait Until Page Contains Element  ${MAP_ELEMENT}
    CLICK ELEMENT AT COORDINATES    ${MAP_ELEMENT}  100     200
    CLICK ELEMENT AT COORDINATES    ${MAP_ELEMENT}  110     210
    CLICK ELEMENT AT COORDINATES    ${MAP_ELEMENT}  105     200
    CLICK ELEMENT AT COORDINATES    ${MAP_ELEMENT}  105     200
    loadingbike
    click button    xpath://div[@class='docker-tab active']//button[@title='Zavřít']
    loadingbike
#   Uložení zakresleného polygonu
    click button    xpath://body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[2]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[1]/div[1]/app-menu[1]/div[1]/div[1]/button[1]
    click element   xpath://body//app-root//div[@role='group']//div//div[1]
    loadingbike


