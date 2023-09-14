*** Settings ***
Library  SeleniumLibrary
Variables    ../Resources/Variables.py
Variables    ../Resources/Configurations.py
Resource    ../Resources/CommonKeywords.robot
Resource    ../Resources/SearchKeywords.robot

#Připojit Resource jeden pro Keywords -Resource     ../Resources/TPIApp.robot
*** Test Cases ***
[Test - Zpracování počinu]
    [Documentation]    Tento testovací scénář obsahuje založení a vyplnění počinu(včetně zakreslení polygonu), fáze počinu, dokumentace, statistické skupiny. Po vyplnění se zkontroluje zda záznam je vytvořený.
    login
    #Pro test s už vytvořeným počinem vyměnit open_pocin s Create_pocin(Stačí od/za komentovat)
#    OPEN_POCIN


    Create_pocin
    fill_in_pocin
    Kontrola_pro_zalozeni_pocinu
    #Logovat ID počinu
    fill_in_faze_pocinu
#    #Kontrola_pro_fazi_pocinu - DO IT?
    Fill_in_Dokumentace
#    #Kontrola_pro_dokumentaci -> DO IT?
    Fill_in_Statisticka_skupina
    #Kontrola_pro_statistickou_skupinu -> DO IT?
    #Uložit a zavřít fázi po vyplnění Dokumentace a stat.skupiny.
    click element    xpath://app-menu[@id='1398976000166_MainMenu']//button[@class='btn btn-light dropdown-toggle'][normalize-space()='Soubor']
    click element    xpath://body//app-root//div[@role='group']//div//div[2]
    loadingbike
    #Bug - Po uložit a zavřít se nezavře fáze - temporary fix manual step
#    execute manual step    Do so it works to Vytvořit a předat  It failed!
    click button    xpath://button[@type='button'][contains(text(),'Vytvořit počin a předat')]
    loadingbike
    loadingbike
    Kontrola_aktivniho_pocinu

*** Keywords ***
X_PROCES_X
    login
    #Pro test s už vytvořeným počinem vyměnit open_pocin s Create_pocin(Stačí od/za komentovat)
#    OPEN_POCIN

    Create_pocin
    fill_in_pocin
    Kontrola_pro_zalozeni_pocinu
    #Logovat ID počinu
    fill_in_faze_pocinu
#    #Kontrola_pro_fazi_pocinu - DO IT?
    Fill_in_Dokumentace
#    #Kontrola_pro_dokumentaci -> DO IT?
    Fill_in_Statisticka_skupina
    #Kontrola_pro_statistickou_skupinu -> DO IT?
    #Uložit a zavřít fázi po vyplnění Dokumentace a stat.skupiny.
    click element    xpath://app-menu[@id='1398976000166_MainMenu']//button[@class='btn btn-light dropdown-toggle'][normalize-space()='Soubor']
    click element    xpath://body//app-root//div[@role='group']//div//div[2]
    loadingbike
    click button    xpath://button[@type='button'][contains(text(),'Vytvořit počin a předat')]
    loadingbike
    Kontrola_aktivniho_pocinu

Create_pocin
    click element   xpath://span[normalize-space()='LInO Portál']
    sleep   1
    click element   xpath://span[contains(text(),'Počiny')]
    sleep   1
    click element   ${seznamPocinu}
    loadingbike
    #Tlačítko pro založení
    click element    xpath://*[@id="3604962200166_ObjectList"]/div[1]/app-toolbar/div/div[2]/span
    loadingbike

Fill_in_pocin
    #POLE Název počinu - Je potřeba vytvořit vždy unikátní název
    input text    xpath://body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[2]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[2]/div[1]/app-layout[1]/div[1]/as-split[1]/as-split-area[1]/app-layout[1]/div[1]/app-layout[1]/div[1]/app-layout[3]/div[1]/app-layout[1]/div[1]/app-layout[3]/div[1]/app-layout[2]/div[1]/app-text[1]/app-user-editable[1]/input[1]        ${nazev_pocinu}

    #POLE Přípravář
    double click element    xpath://body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[2]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[2]/div[1]/app-layout[1]/div[1]/as-split[1]/as-split-area[1]/app-layout[1]/div[1]/app-layout[1]/div[1]/app-layout[3]/div[1]/app-layout[1]/div[1]/app-layout[4]/div[1]/app-layout[2]/div[1]/app-assigner[1]/app-user-editable[1]/input[1]
    loadingbike
    input text    ${SEARCH_POLE_PRIPRAVAR}    ${PRIPRAVAR}
    Press Keys    ${SEARCH_POLE_PRIPRAVAR}    ENTER
    loadingbike
    double click element    xpath://tbody/tr/td[2]/app-textarea-cell[1]
    loadingbike

    #POLE Charakter počinu
    click button    xpath://app-combobox[@id='3604944000166_ContainerL_LP_POCIN_LP_CI_POCIN_CHAR_KOD_Field']//input[@type='search']
    #click element   xpath://td[contains(text(),'Nestavební')]
    click element using javascript    //td[contains(text(),'Nestavební')]
    loadingbike
    #POLE Typ počinu
    click button    xpath://app-combobox[@id='3604943700166_ContainerL_LP_POCIN_PTS_CIS_POCIN_TYP_KOD_Field']//input[@type='search']
    #click element   xpath://td[contains(text(),'Administrativní')]
    click element using javascript    //td[contains(text(),'Administrativní')]
    loadingbike
    #POLE poznámky
#   Uložení vyplněného počinu
    click button    xpath://body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[2]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[1]/div[1]/app-menu[1]/div[1]/div[1]/button[1]
    click element   xpath://body//app-root//div[@role='group']//div//div[1]
    loadingbike
    #Zakreslení polygonu
    #Kliknout na Otevřít mapové okno
    click button    xpath://button[contains(text(),'Otevřít mapové okno')]
    loadingbike
    #Čekačka pro načtení a zoom obrazovky kam má
    sleep    2
    #Kliknout na funkci pro zakreslení
    click element   xpath://button[@class='draw-polygon-btn clean-btn ng-star-inserted']
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
    click button    xpath://body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[2]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[1]/div[1]/app-menu[1]/div[1]/div[1]/button[1]
    click element   xpath://body//app-root//div[@role='group']//div//div[1]
    loadingbike

Fill_in_faze_pocinu
#Click on add Faze počinu
    click element   xpath://div[@role='tabpanel']//span[@class='fas fa-plus-square']
    loadingbike
#Vybirani statusu
    click button    xpath://button[@id='3601842800166']
    #click element   xpath://td[contains(text(),'Probíhá')]
    click element using javascript    //td[contains(text(),'Probíhá')]
#Vybirani Název fáze
    click button    xpath://button[@id='3601843700166']
    #click element   xpath://td[contains(text(),'Územní rozhodnutí')]
    click element using javascript    //td[contains(text(),'Územní rozhodnutí')]
#Vybirani Datumu zahájeni
    input text  xpath://body//app-root//app-layout[@class='ng-star-inserted']//app-layout[@class='ng-star-inserted']//app-layout[@class='ng-star-inserted']//app-layout[@class='ng-star-inserted']//app-layout[@class='ng-star-inserted']//app-layout[@class='ng-star-inserted']//app-layout[@class='ng-star-inserted']//app-layout[@class='ng-star-inserted']//app-layout[@class='ng-star-inserted']//app-layout[@class='ng-star-inserted']//app-layout[1]//div[1]//app-picker[1]//app-user-editable[1]//div[1]//input[1]  1.1.2024 00:00:01
#Vybirani Plánovaného Datumu ukončení
    input text  xpath://body//app-root//app-layout[@class='ng-star-inserted']//app-layout[@class='ng-star-inserted']//app-layout[@class='ng-star-inserted']//app-layout[@class='ng-star-inserted']//app-layout[@class='ng-star-inserted']//app-layout[@class='ng-star-inserted']//app-layout[@class='ng-star-inserted']//app-layout[@class='ng-star-inserted']//app-layout[@class='ng-star-inserted']//app-layout[@class='ng-star-inserted']//app-layout[2]//div[1]//app-picker[1]//app-user-editable[1]//div[1]//input[1]  1.7.2024 00:00:01
#Vybirani Datumu ukončení - Vyplňuje se do Špatného pole(Datumu zahájení)
#POLE poznamka
#Nepovinné ---------Níže-------
##Vyplnit investor externí
#    double click element    xpath://body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[3]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[2]/div[1]/app-layout[1]/div[1]/as-split[1]/as-split-area[1]/app-layout[1]/div[1]/app-layout[1]/div[1]/app-layout[3]/div[1]/app-layout[2]/div[1]/app-layout[1]/div[1]/app-layout[3]/div[1]/app-layout[1]/div[1]/app-assigner[1]/app-user-editable[1]/input[1]
#    loadingbike
#    double click element   xpath://div[normalize-space()='EKOHYDRO s.r.o.']
#    loadingbike
##Odpovědná osoba (investor) - ext
#    double click element    xpath://body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[3]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[2]/div[1]/app-layout[1]/div[1]/as-split[1]/as-split-area[1]/app-layout[1]/div[1]/app-layout[1]/div[1]/app-layout[3]/div[1]/app-layout[2]/div[1]/app-layout[1]/div[1]/app-layout[3]/div[1]/app-layout[2]/div[1]/app-assigner[1]/app-user-editable[1]/input[1]
#    loadingbike
#    double click element    xpath://div[normalize-space()='Michal']
#    loadingbike
##CKAIT odpovědná osoba (investor) - ext
#    double click element    xpath://body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[3]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[2]/div[1]/app-layout[1]/div[1]/as-split[1]/as-split-area[1]/app-layout[1]/div[1]/app-layout[1]/div[1]/app-layout[3]/div[1]/app-layout[2]/div[1]/app-layout[1]/div[1]/app-layout[3]/div[1]/app-layout[3]/div[1]/app-assigner[1]/app-user-editable[1]/input[1]
#    loadingbike
#    double click element    xpath://div[normalize-space()='Michal']
#    loadingbike
##UOZI odpovědná osoba (investor) - ext
#    double click element    xpath://body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[3]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[2]/div[1]/app-layout[1]/div[1]/as-split[1]/as-split-area[1]/app-layout[1]/div[1]/app-layout[1]/div[1]/app-layout[3]/div[1]/app-layout[2]/div[1]/app-layout[1]/div[1]/app-layout[3]/div[1]/app-layout[4]/div[1]/app-assigner[1]/app-user-editable[1]/input[1]
#    loadingbike
#    double click element    xpath://div[normalize-space()='Michal']
#    loadingbike
##Investiční geodet - ext
#    double click element    xpath://body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[3]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[2]/div[1]/app-layout[1]/div[1]/as-split[1]/as-split-area[1]/app-layout[1]/div[1]/app-layout[1]/div[1]/app-layout[3]/div[1]/app-layout[2]/div[1]/app-layout[1]/div[1]/app-layout[3]/div[1]/app-layout[5]/div[1]/app-assigner[1]/app-user-editable[1]/input[1]
#    loadingbike
#    double click element    xpath://div[normalize-space()='Michal']
#    loadingbike
#   Ulozeni
    click element    xpath://app-menu[@id='1398976000166_MainMenu']//button[@class='btn btn-light dropdown-toggle'][normalize-space()='Soubor']
    click element   xpath://body//app-root//div[@role='group']//div//div[1]
    loadingbike

Fill_in_Statisticka_skupina
    #Klik na záložku Statisticka skupina
    click element    xpath://a[normalize-space()='Statistická skupina']
    #Klik pro založení nového záznamu
    click element    xpath://app-table[@id='3601879400166_child_LP_STAT_SKUP']//span[@class='fas fa-plus-square']
    loadingbike
    #Input nazvu
    input text    xpath://app-text[@id='3609410700166_ContainerL_LP_STAT_SKUP_NAZEV_Field']//input[@type='search']    ${NAZEV_STATISTICKE_SKUPINY}
    #Ulozeni
    click element    xpath://app-menu[@id='2886576900166_MainMenu']//button[@class='btn btn-light dropdown-toggle'][normalize-space()='Soubor']
    click element    xpath://body//app-root//div[@role='group']//div//div[2]
    loadingbike

Fill_in_Dokumentace
    #Add dokumentace
    click element    xpath://body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[3]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[2]/div[1]/app-layout[1]/div[1]/as-split[1]/as-split-area[2]/app-layout[1]/div[1]/app-layout[1]/div[1]/app-tab[1]/div[1]/div[2]/div[1]/app-layout[1]/div[1]/app-layout[1]/div[1]/app-table[1]/div[1]/app-toolbar[1]/div[1]/div[1]/span[1]
    loadingbike
    #Milník
    click button    xpath://button[@id='6979000300166']
    #click element    xpath://td[normalize-space()='Nabytí právní moci územního rozhodnutí']
    click element using javascript    //td[normalize-space()='Nabytí právní moci územního rozhodnutí']
    #Úkon
    click button    xpath://button[@id='6979000700166']
    #click element    xpath://td[normalize-space()='Skutečný termín nabytí právní moci']
    click element using javascript    //td[normalize-space()='Skutečný termín nabytí právní moci']
    #Název dokumentu
    input text    xpath://body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[4]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[2]/div[1]/app-layout[1]/div[1]/app-layout[1]/div[1]/app-layout[1]/div[1]/app-layout[3]/div[1]/app-layout[2]/div[1]/app-layout[2]/div[1]/app-layout[3]/div[1]/app-text[1]/app-user-editable[1]/input[1]     Testovaci Dokument
    #Datum vytvoření - Nejde mi lokalizovat xpath na button Kalendáře
    input text    xpath://app-picker[@id='7436940900166_ContainerL_LP_DOKUMENTACE_DATUM_VYTVORENI_Field']//app-user-editable//div//input    5.4.2023 10:13:49
    #Aktuální den zobrazovaný modře v kalendářiclick element   xpath://div[@class='btn-light ng-star-inserted bg-primary text-white']
    #Datum poslední změny
    input text    xpath://app-picker[@id='3600644400166_ContainerL_LP_DOKUMENTACE_DATUM_POSL_ZMENY_Field']//app-user-editable//div//input   5.4.2023 10:13:49
    #ID přílohy
    #Tohle označi pole Přílohy, ale neotevře nabídku - double click element    xpath://*[@id="7144716900166_ContainerL_LP_DOKUMENTACE_TPI_ATTACHMENT_ID_Field"]/div/input[2]
#   double click element    xpath://span[@class='fa fa-upload']
    #input text    xpath://span[@class='fa fa-upload']        testtext.txt
    Choose file     xpath://input[@type='file']       ${EXECDIR}/Data/Testfile.txt
    loadingbike
    #Časové prodleva pro vybrání souboru pro dokumentaci do pole Příloha
    sleep    5
    #ULOZIT_SOUBOR
    click element    xpath://app-menu[@id='1399151300166_MainMenu']//button[@class='btn btn-light dropdown-toggle'][normalize-space()='Soubor']
    click element    xpath://body//app-root//div[@role='group']//div//div[2]
    loadingbike

    #Položky níže nejsou povinné k vyplnění
    #Poznámka
    #Objednatel
    #Firma (objednatel) - EXT
    #Odpovědná oprávněná osoba (objednatel) - EXT
    #Zhotovitel
    #Firma (zhotovitel) - EXT
    #Odpovědná oprávněná osoba (zhotovitel) - EXT
    #CKAIT odpovědná osoba (zhotovitel) - EXT
    #UOZI odpovědná osoba (zhotovitel) - EXT

Kontrola_pro_zalozeni_pocinu
#Předpokládá se, že už je rozkliknutý strom v Seznamu objektů, přistupuje rovnou na Seznam počinů
#    Nedá se rozkliknout další SeznamPočinů, musí se zjistit jak kliknout na záložku Přehled počinů( Na DEV je z textovou chybou)
#    click element   ${seznamPocinu}
#    sleep   1
#    loadingbike
#    input text      ${search_pole_pocin}    ${hledany_pocin}
#    Press Keys      ${search_pole_pocin}    ENTER
#    loadingbike
#    double click element    xpath://*[@id="3604962200166_ObjectList"]/div[1]/div[1]/table/tbody/tr[1]/td[5]
#    loadingbike
    RUN KEYWORD AND CONTINUE ON FAILURE  page should contain    Nový

Kontrola_aktivniho_pocinu
#   Předpokládá se, že seznam objektů už je rozkliknutý - Rozkliknutí Seznamu počinů(Pokud není už otevřený)
#    click element   ${seznamPocinu}
#    sleep   1
#    loadingbike

    #${search_pole_pocin}
    #DEVTPI //body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[1]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[2]/div[1]/app-table[1]/div[1]/div[1]/table[1]/thead[1]/tr[1]/th[5]/div[1]/div[1]/input[1]
    input text      xpath://body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[1]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[2]/div[1]/app-table[1]/div[1]/div[1]/table[1]/thead[1]/tr[1]/th[5]/div[1]/div[1]/input[1]    ${hledany_pocin}
    Press Keys      xpath://body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[1]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[2]/div[1]/app-table[1]/div[1]/div[1]/table[1]/thead[1]/tr[1]/th[5]/div[1]/div[1]/input[1]    ENTER
    loadingbike
    double click element    xpath://*[@id="3604962200166_ObjectList"]/div[1]/div[1]/table/tbody/tr[1]/td[5]
    loadingbike
    RUN KEYWORD AND CONTINUE ON FAILURE  page should contain    Aktivní


