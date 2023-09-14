*** Settings ***
Library                             SeleniumLibrary
Variables                           ../Variables.py
Variables                           ../Configurations.py
Resource                            ../CommonKeywords.robot
Resource                            ../SearchKeywords.robot
#Nalinkovat na TPIapp a napsat to podle funkcionality

*** Variables ***
${SEZNAM_POCINU} =                      xpath://span[contains(text(),'Seznam počinů')]
${POLE_NAZEV_POCINU} =                  xpath://body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[2]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[2]/div[1]/app-layout[1]/div[1]/as-split[1]/as-split-area[1]/app-layout[1]/div[1]/app-layout[1]/div[1]/app-layout[3]/div[1]/app-layout[1]/div[1]/app-layout[3]/div[1]/app-layout[2]/div[1]/app-text[1]/app-user-editable[1]/input[1]
${NAZEV_POCINU} =                       AUTO_MM_0706
${POLE_PRIPRAVAR} =                     xpath://body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[2]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[2]/div[1]/app-layout[1]/div[1]/as-split[1]/as-split-area[1]/app-layout[1]/div[1]/app-layout[1]/div[1]/app-layout[3]/div[1]/app-layout[1]/div[1]/app-layout[4]/div[1]/app-layout[2]/div[1]/app-assigner[1]/app-user-editable[1]/input[1]
${POLE_CHARAKTER_POCINU} =              xpath://app-combobox[@id='3604944000166_ContainerL_LP_POCIN_LP_CI_POCIN_CHAR_KOD_Field']//input[@type='search']
${VYBER_CHARAKTER_POCINU} =             xpath://td[contains(text(),'Nestavební')]
${POLE_TYP_POCINU} =                    xpath://app-combobox[@id='3604943700166_ContainerL_LP_POCIN_PTS_CIS_POCIN_TYP_KOD_Field']//input[@type='search']
${VYBER_TYP_POCINU} =                   xpath://td[contains(text(),'Administrativní')]
${MENU_SOUBOR} =                        xpath://body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[2]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[1]/div[1]/app-menu[1]/div[1]/div[1]/button[1]
${ULOZIT_SOUBOR} =                      xpath://body//app-root//div[@role='group']//div//div[1]
${TLACITKO_ZALOZENI_POCINU} =           xpath://*[@id="3604962200166_ObjectList"]/div[1]/app-toolbar/div/div[2]/span
${TLACITKO_MAPOVEHO_OKNA} =             xpath://button[contains(text(),'Otevřít mapové okno')]
${TLACITKO_ZAKRESLIT} =                 xpath://button[@class='draw-polygon-btn clean-btn ng-star-inserted']
${ZAVRIT_TAB_MAP_OKNA} =                xpath://div[@class='docker-tab active']//button[@title='Zavřít']
${VYBER_PRIPRAVARE} =                   xpath://tbody/tr/td[2]/app-textarea-cell[1]
${TLACITKO_PREDAT_POCIN} =              xpath://button[@type='button'][contains(text(),'Vytvořit počin a předat')]
#${SEARCH_POLE_PRIPRAVAR} =             PODLE PROSTREDI, JAK ZAIMPLEMENTOVAT TADY?

*** Keywords ***
Zalozit_novy_pocin
#Sekce pro SeznamObjektu - Otevrit_Pocin X->
    #Tlačítko pro založení
    click element                       ${TLACITKO_ZALOZENI_POCINU}
    loadingbike

Vyplnit_pocin
    #POLE Název počinu - Je potřeba vytvořit vždy unikátní název
    input text                          ${POLE_NAZEV_POCINU}        ${NAZEV_POCINU}

    #POLE Přípravář
    double click element                ${POLE_PRIPRAVAR}
    loadingbike
    input text                          ${SEARCH_POLE_PRIPRAVAR}    ${PRIPRAVAR}
    Press Keys                          ${SEARCH_POLE_PRIPRAVAR}    ENTER
    loadingbike
    double click element                ${VYBER_PRIPRAVARE}
    loadingbike

    #POLE Charakter počinu
    click button                        ${POLE_CHARAKTER_POCINU}
#    click element                      ${VYBER_CHARAKTER_POCINU}                      #ORIGINAL
    click element using javascript      //td[contains(text(),'Nestavební')]       #FIX headless chrome
    loadingbike
    #POLE Typ počinu
    click button                        ${POLE_TYP_POCINU}
#    click element                      ${VYBER_TYP_POCINU}                                #ORIGINAL
    click element using javascript      //td[contains(text(),'Administrativní')]      #FIX headless chrome
    #Předání jinému vlastníkovi     Administrativní
#    wait until element contains    xpath://app-combobox[@id='3604943700166_ContainerL_LP_POCIN_PTS_CIS_POCIN_TYP_KOD_Field']//input[@type='search']     Administrativní
    loadingbike
    #POLE poznámky
#   Uložení vyplněného počinu
    click button                        ${MENU_SOUBOR}
    click element                       ${ULOZIT_SOUBOR}
    loadingbike


Zakreslit_polygon
    #Kliknout na Otevřít mapové okno
    click button                        ${TLACITKO_MAPOVEHO_OKNA}
    loadingbike
    #Čekačka pro načtení a zoom mapového okna
    sleep    2
    #Kliknout na funkci pro zakreslení
    click element                       ${TLACITKO_ZAKRESLIT}
    #Namířit myší
    Wait Until Page Contains Element    ${MAP_ELEMENT}
    CLICK ELEMENT AT COORDINATES        ${MAP_ELEMENT}  0     100
    CLICK ELEMENT AT COORDINATES        ${MAP_ELEMENT}  100     100
    CLICK ELEMENT AT COORDINATES        ${MAP_ELEMENT}  100     0
    CLICK ELEMENT AT COORDINATES        ${MAP_ELEMENT}  0     100
    loadingbike
    click button                        ${ZAVRIT_TAB_MAP_OKNA}
    loadingbike
#   Uložení zakresleného polygonu
    click button                        ${MENU_SOUBOR}
    click element                       ${ULOZIT_SOUBOR}
    loadingbike

Predat_pocin
    click button                        ${TLACITKO_PREDAT_POCIN}
    loadingbike

Kontrola_aktivniho_pocinu
#   Předpokládá se, že seznam objektů už je rozkliknutý
#    click element   ${seznamPocinu}
#    sleep   1
#    loadingbike
    input text                          ${search_pole_pocin}    ${hledany_pocin}
    Press Keys                          ${search_pole_pocin}    ENTER
    loadingbike
    double click element                xpath://*[@id="3604962200166_ObjectList"]/div[1]/div[1]/table/tbody/tr[1]/td[5]
    loadingbike
    RUN KEYWORD AND CONTINUE ON FAILURE  page should contain    Aktivní