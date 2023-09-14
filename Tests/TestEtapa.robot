*** Settings ***
Library  SeleniumLibrary
Variables    ../Resources/Variables.py
Variables    ../Resources/Configurations.py
Resource    ../Resources/CommonKeywords.robot
Resource    ../Resources/SearchKeywords.robot

*** Test Cases ***
Vytvořeni etapy     #UPDATE - Zapracované až po předání etapy. Nejde mi jen automatizovat přidání TUDU. Problém s vybráním záznamu.
    [Documentation]    Tento testovací scénář obsahuje založení a vyplnění etapy společně s povinnými atributy pro předání etapy. Což je mít zakreslený polygon, vytvořenou žádost(Odesílá se taky, ale to je podmínkou až pro Vytvoření Návrhu změny), prozatím řešeno fiktivně - Platné Tabelární TUDU, Přidání TUDU.
    login
    open_pocin
#    open_etapu
    Prijmout_etapu
    Zalozit_etapu
    #Docasne, zavira pro headless seznam pocinu
#    click element    xpath://li[@title='Počin - přehled']//span[@aria-hidden='true'][normalize-space()='×']
#    LoadingBike
#    click element    xpath://div[normalize-space()='Etapa - editor']
    ###
    Fill_in_etapa
    Fill_in_zalozky
    loadingbike
    sleep    1
####    Fill_in_etapu_nepovinne
###    #Vytvořit etapu
    log to console      "Pred vytvorit etapu"
    click button    xpath://button[contains(text(),'Vytvořit etapu')]
    loadingbike
    log to console      "Pred fiktivnim Reload page"
    reload page
    LoadingBike
    log to console      "Po reload page"
    sleep    1
    #Kontrola, že je etapa Rozpracovaná
#    #DO IT?
    log to console      "Pred Otevreni etapy"
    open_etapu
    log to console      "Pred fiktivnim TUDU"
    Fiktivne_TUDU
    log to console      "Po fiktivnim TUDU"
    open_etapu
    Add_TUDU
    log to console      "Po Add TUDU"
    Predat_etapu
#    open_etapu
#    Kontrola_predane_etapy

*** Keywords ***
Prijmout_etapu
    click button    xpath://button[contains(text(),'Přijmout')]
    loadingbike

Zalozit_etapu
#Click on zalozka
    click element    xpath://a[normalize-space()='Etapa']
    #Založit etapu
    click element    xpath://app-table[@id='6954883300166_child_LP_ETAPA']//div[@title='Přidat řádek']//span
    loadingbike
    wait until page contains    Editace objektu Etapa

Fill_in_etapa   #Nazev, Termín pro uvedeni do provozu, Stat. skup, Rozdelovatel
    #Vyplnit etapu
    #Nazev etapy
    input text    xpath://app-text[@id='3596950200166_ContainerL_LP_ETAPA_NAZEV_Field']//input[@type='search']  ${nazev_etapy}
    #Předp. termín uved. do provozu
    input text  xpath://app-picker[@id='3596951100166_ContainerL_LP_ETAPA_PREDP_TERMIN_UV_PR_Field']//input[@class='form-control picker-input ng-untouched ng-pristine ng-valid']   1.1.2023 00:00:01
    #Statisticka skupina
    double click element    xpath://app-assigner[@id='3596953400166_ContainerL_LP_ETAPA_LP_STAT_SKUP_ID_Field']//app-user-editable//input[@placeholder='[nevyplneno]']
    loadingbike
    sleep    1
    #TODO- Dan- musel jsem menit na DEV, zkontrolovat u Marcela
    double click element        xpath://div[@autocomplete='off'][normalize-space()='${NAZEV_STATISTICKE_SKUPINY}']        #DEV xpath:(//div[@autocomplete='off'][normalize-space()='${NAZEV_STATISTICKE_SKUPINY}'])[3]                 #//div[@autocomplete='off'][normalize-space()='${NAZEV_STATISTICKE_SKUPINY}']            #xpath:(//div[@class='readonly'][normalize-space()='${NAZEV_STATISTICKE_SKUPINY}'])
    loadingbike
    #Uložit
    click element    xpath://app-menu[@id='1398934800166_MainMenu']//button[@class='btn btn-light dropdown-toggle'][normalize-space()='Soubor']
    click element    xpath://body//app-root//div[@role='group']//div//div[1]
    loadingbike
    sleep    2
    #Mapové okno
    click element   ${MAPOVE_OKNO_ETAPA}    #xpath://app-button[@id='17244452800166_button_ZAKRESLIT_POLYGON']//button[@type='button'][contains(text(),'Otevřít mapové okno')]   #DEVTPI xpath://app-button[@id='17244452800166_button_ZAKRESLIT_POLYGON']//button[@type='button'][contains(text(),'Otevřít mapové okno')]           #IDK xpath://body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[5]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[2]/div[1]/app-layout[1]/div[1]/as-split[1]/as-split-area[1]/app-layout[1]/div[1]/app-layout[1]/div[1]/app-layout[3]/div[1]/app-layout[2]/div[1]/app-layout[3]/div[1]/app-button[1]/button[1]
    loadingbike
    #Čekačka pro načtení a zoom obrazovky kam má
    sleep    2
    #Kliknout na funkci pro zakreslení
    click element   xpath://div[@id='map-theme-container']//div//div//div//button//span
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
    click element    xpath://app-menu[@id='1398934800166_MainMenu']//button[@class='btn btn-light dropdown-toggle'][normalize-space()='Soubor']
    click element    xpath://body//app-root//div[@role='group']//div//div[1]
    loadingbike
    sleep    1
    #Rozdělovatel - je rozděleno z důvodu toho, že rozdělovatel není povinný parametr pro zalozeni etapy, ale pro pokračující proces ano.
    double click element    xpath:(//input[@placeholder='[nevyplneno]'])[13]
    #original xpath://app-assigner[@id='7098923400166_ContainerL_LP_ETAPA_ROZDELOVATEL_ZAM_ID_Field']//app-user-editable//input[@placeholder='[nevyplneno]']
    loadingbike
    sleep    1
#    run keyword and continue on failure     click element    xpath://i[@class='fas fa-chevron-right']        #Klik na posun v tabech, Uzivatele nejde videt v headless               ORIGINAL HERE:xpath://div[@class='scroller ng-star-inserted']      #DEVTPI- xpath:/html/body/app-root/app-main/div[2]/as-split/as-split-area[2]/app-docker-tabs/div[1]/div[3]/i
#    run keyword and continue on failure     click element    xpath://i[@class='fas fa-chevron-right']
#    run keyword and continue on failure     click element    xpath://i[@class='fas fa-chevron-right']
#    click element    xpath://li[@title='Uživatelé - přehled']//div[@class='window-head']//div[1]
#    sleep    1
    LoadingBike
#    run keyword and continue on failure     click element    xpath:/html/body/app-root/app-main/div[2]/as-split/as-split-area[2]/app-docker-tabs/div[1]/div[3]  #DEVTPI
#    run keyword and continue on failure     click element    xpath:/html/body/app-root/app-main/div[2]/as-split/as-split-area[2]/app-docker-tabs/div[1]/div[3]  #twice because headless
#    click element    xpath:/html/body/app-root/app-main/div[2]/as-split/as-split-area[2]/app-docker-tabs/div[1]/div[3]
#    run keyword and continue on failure    click element    xpath://li[@title='Uživatelé - přehled']           #Klik na tab Uzivatele, v headless modu se neproklikne automatickz po predchozim double click        #DEVTPI Do not work - xpath://li[@title='Uživatelé - přehled']//div[@class='window-head']//div[1]   ORIGINAL - xpath://li[@title='Uživatelé - přehled']//div[2]
    input text  ${search_pole_etapa_rozdelovatel}  ${rozdelovatel}
    Press Keys  ${search_pole_etapa_rozdelovatel}  ENTER
    loadingbike
    log to console      \n
    log to console      "double click na rozdelovatele"
    double click element    xpath://tbody/tr/td[2]/app-textarea-cell[1]/div[1]             #DEV xpath:(//div[@autocomplete='off'][normalize-space()='GEO Admin'])[3]
    log to console      "proslo double click"
    loadingbike
    #Uložení Rozdělovatele
    click element    xpath://app-menu[@id='1398934800166_MainMenu']//button[@class='btn btn-light dropdown-toggle'][normalize-space()='Soubor']
    click element    xpath://body//app-root//div[@role='group']//div//div[1]
    loadingbike

Fill_in_zalozky
#   Žádost na IS SPPK
    log to console       "Zaklada Zadost ISSPPK"
    click element    xpath://a[contains(text(),'Žádosti na IS SPPK')]
    #Tlačítko pro založení žádosti
    click element    xpath://app-table[@id='7098973200166_child_LP_ZADOST_NA_SPPK']//span[@class='fas fa-plus-square']
    loadingbike
    #Název žádosti
    input text  xpath://app-text[@id='7365896900166_ContainerL_LP_ZADOST_NA_SPPK_POPIS_Field']//input[@type='search']   ${nazev_zadosti}
    #Poznamka žádosti
    input text    xpath://app-textarea[@id='3606010400166_ContainerL_LP_ZADOST_NA_SPPK_POZNAMKA_Field']//textarea[@class='form-control ng-untouched ng-pristine ng-valid']  TestPoznamkaZadosti
    #Uložit
    click button    xpath://app-menu[@id='2794607200166_MainMenu']//button[@class='btn btn-light dropdown-toggle'][normalize-space()='Soubor']
    click element    xpath://body//app-root//div[@role='group']//div//div[1]
    loadingbike
    #Zaslat žádost
    click button    xpath://button[normalize-space()='Zaslat na IS SPPK']
    #Dát delší loading
    sleep    2
    Wait Until Page Does Not Contain element 	xpath://div[@class='ngx-spinner-overlay ng-tns-c15-0 ng-trigger ng-trigger-fadeIn ng-star-inserted']    ${WAITING_TIME_ZADOST}

#    loadingbike

    #Uložit a zavřít
    click button    xpath:(//button[contains(text(),'Soubor')])[5]                    #ORIGINAL xpath://app-menu[@id='2794607200166_MainMenu']//button[@class='btn btn-light dropdown-toggle'][normalize-space()='Soubor']
    click element    xpath://div[@class='show dropdown-menu ng-star-inserted']//div[1]
    loadingbike
    #Misto manual step zavreni detailu zadosti
    sleep    1
    run keyword and ignore error    click element    xpath://button[contains(text(),'Přesto zavřít')]
    LoadingBike
    click element    xpath://div[@class='docker-tab active']//button[@title='Zavřít']
    LoadingBike
    click element    xpath://div[@class='docker-tab active']//button[@title='Zavřít']
    LoadingBike
    click element    xpath://button[contains(text(),'Přesto zavřít')]
    loadingbike
#stare
    #run keyword and ignore error    click element    xpath://button[contains(text(),'Přesto zavřít')]
    #LoadingBike
        #Uložit a zavřít
    #click button    xpath:(//button[contains(text(),'Soubor')])[5]                    #ORIGINAL xpath://app-menu[@id='2794607200166_MainMenu']//button[@class='btn btn-light dropdown-toggle'][normalize-space()='Soubor']
    #click element    xpath://div[@class='show dropdown-menu ng-star-inserted']//div[1]
        #Uložit a zavřít
    #click button    xpath:(//button[contains(text(),'Soubor')])[5]                    #ORIGINAL xpath://app-menu[@id='2794607200166_MainMenu']//button[@class='btn btn-light dropdown-toggle'][normalize-space()='Soubor']
    #click element    xpath://div[@class='show dropdown-menu ng-star-inserted']//div[1]
    
#    click element    xpath://div[@class='docker-tab active']//button[@title='Zavřít']
#    LoadingBike
#    click element    xpath://div[@class='docker-tab active']//button[@title='Zavřít']
#    LoadingBike
#    click element    xpath://button[contains(text(),'Přesto zavřít')]
    loadingbike
#stare
    log to console       "Zalozene ISSPPK"
    #execute manual step    Detail etapy je potřeba vidět    This is fail!
Fill_in_etapu_nepovinne
    #Predp. termín zahájení
    input text    xpath://app-picker[@id='3596951400166_ContainerL_LP_ETAPA_PREDP_TERMIN_ZAHAJENI_Field']//input[@class='form-control picker-input ng-untouched ng-pristine ng-valid']  1.3.2025 10:47:03
    #Poznámka
    input text    xpath://app-textarea[@id='3596950800166_ContainerL_LP_ETAPA_POZNAMKA_Field']//app-user-editable//textarea     Autotest_poznamka
    #Uložení
    click element    xpath://app-menu[@id='1398934800166_MainMenu']//button[@class='btn btn-light dropdown-toggle'][normalize-space()='Soubor']
    click element    xpath://body//app-root//div[@role='group']//div//div[1]
    loadingbike

Fiktivne_TUDU
#    Fiktivni Tabelární TUDU, jsou povinné pro přidání TUDU
    click element    xpath://app-menu[@id='1398934800166_MainMenu']//button[contains(text(),'Funkce')]
    click element    xpath://div[contains(text(),'Fiktivní doručení dat M12 Tabelární Tudu')]
    loadingbike
#    Nepovinné - Plochy TUDU a TSK
#    open_etapu
#    click element    xpath://app-menu[@id='1398934800166_MainMenu']//button[contains(text(),'Funkce')]
#    click element    xpath://div[contains(text(),'Fiktivní doručení dat M12 Plochy Tudu')]
#    loadingbike
#    open_etapu
#    click element    xpath://app-menu[@id='1398934800166_MainMenu']//button[contains(text(),'Funkce')]
#    click element    //div[contains(text(),'Fiktivní doručení dat IS TSK')]
#    loadingbike

Add_TUDU
    click element    xpath://app-table[@id='8504850300166_child_M12A_TUDU']//div[@title='Přidat řádek']//span
    loadingbike
    input text  ${search_pole_tudu}     ${VYBRANE_TUDU}
    Press Keys  ${search_pole_tudu}     ENTER
    loadingbike
    double click element    xpath://*[@id="6844421600166_ObjectList"]/div[1]/div[1]/table/tbody/tr/td[3]/app-text-cell/div                #xpath://div[normalize-space()='${VYBRANE_TUDU}}']        #Brainstorm vybírání TUDU - Jaké? Počet?
    loadingbike
#    Uložit
    click button    xpath://app-menu[@id='1398934800166_MainMenu']//button[contains(text(),'Soubor')]      #IDK xpath://app-menu[@id='2794607200166_MainMenu']//button[@class='btn btn-light dropdown-toggle'][normalize-space()='Soubor']          #PREPROD xpath://app-menu[@id='1398934800166_MainMenu']//button[contains(text(),'Soubor')]
    click element   xpath://body//app-root//div[@role='group']//div//div[1]     #PREPROD        xpath://body//app-root//div[@role='group']//div//div[1]      IDK    xpath://body//app-root//div[@role='group']//div//div[1]
    loadingbike

Predat_etapu
    click element    xpath://button[contains(text(),'Předat')]
    loadingbike

Kontrola_predane_etapy
#Pole - Přiřazená role, neobsahuje textový obsah a nejde na ní udělat kontrolu.
#    wait until page contains element    [xpath://app-text[@id='7098924200166_ContainerL_LP_ETAPA_PRIRAZENA_ROLE_Field']//input[@type='search'], ,Rozdelovatel,]
#    element should contain    xpath://app-text[@id='7098924200166_ContainerL_LP_ETAPA_PRIRAZENA_ROLE_Field']//input[@type='search']     Rozdelovatel

    #Použitelné pouze pro ADMIN_účet - Tlačítko přijmout neuvidí Rozdelovatel_fat
    wait until page contains    Přijmout
