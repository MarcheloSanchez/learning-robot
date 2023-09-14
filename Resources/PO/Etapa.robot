*** Settings ***
Library                             SeleniumLibrary
Variables                           ../Variables.py
Variables                           ../Configurations.py
Resource                            ../CommonKeywords.robot
Resource                            ../SearchKeywords.robot
Resource                            ../TPIApp.robot
#Nalinkovat na TPIapp a napsat to podle funkcionality

*** Variables ***
${TLACITKO_PRIJMOUT} =          xpath://button[contains(text(),'Přijmout')]
${ZALOZKA_ETAPA} =              xpath://a[normalize-space()='Etapa']
${TLACITKO_ZALOZENI_ETAPY} =    xpath://app-table[@id='6954883300166_child_LP_ETAPA']//div[@title='Přidat řádek']//span
${POLE_NAZVU_ETAPY} =           xpath://app-text[@id='3596950200166_ContainerL_LP_ETAPA_NAZEV_Field']//input[@type='search']
${NAZEV_ETAPY} =                AUTO_DV_0506A
${DATUM_DO_PROVOZU} =           xpath://app-picker[@id='3596951100166_ContainerL_LP_ETAPA_PREDP_TERMIN_UV_PR_Field']//input[@class='form-control picker-input ng-untouched ng-pristine ng-valid']
${INPUT_DATUM_DO_PROVOZU} =     1.1.2026 00:00:01
${POLE_STATISTICKE_SKUPINY} =   xpath://app-assigner[@id='3596953400166_ContainerL_LP_ETAPA_LP_STAT_SKUP_ID_Field']//app-user-editable//input[@placeholder='[nevyplneno]']
#${INPUT_STATISTICKE_SKUPINY} = xpath://div[@autocomplete='off'][normalize-space()='${NAZEV_STATISTICKE_SKUPINY}']
${POLE_ROZDELOVATEL} =          xpath://app-assigner[@id='7098923400166_ContainerL_LP_ETAPA_ROZDELOVATEL_ZAM_ID_Field']//app-user-editable//input[@placeholder='[nevyplneno]']
${ROZDELOVATEL} =               GEO Admin
${VYBER_ROZDELOVATELE} =        xpath://body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[4]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[2]/div[1]/app-table[1]/div[1]/div[1]/table[1]/tbody[1]/tr[1]/td[2]/app-textarea-cell[1]/div[1]
${MENU_SOUBOR} =                xpath://app-menu[@id='1398934800166_MainMenu']//button[@class='btn btn-light dropdown-toggle'][normalize-space()='Soubor']
${ULOZIT} =                     xpath://body//app-root//div[@role='group']//div//div[1]
${FUNKCE_ZAKRESLOVAT} =         xpath://div[@id='map-theme-container']//div//div//div//button//span
${TAB_ZAVRIT} =                 xpath://div[@class='docker-tab active']//button[@title='Zavřít']
${MENU_FUNKCE} =                xpath://app-menu[@id='1398934800166_MainMenu']//button[contains(text(),'Funkce')]
${FIKTIVNI_TABELARNI_TUDU} =    xpath://div[contains(text(),'Fiktivní doručení dat M12 Tabelární Tudu')]
${FIKTIVNI_PLOCHY_TUDU} =       xpath://div[contains(text(),'Fiktivní doručení dat M12 Plochy Tudu')]
${FIKTIVNI_TSK} =               //div[contains(text(),'Fiktivní doručení dat IS TSK')]
${TLACITKO_PRIDANI_TUDU} =      xpath://app-table[@id='8504850300166_child_M12A_TUDU']//div[@title='Přidat řádek']//span
#${VYBRANE_TUDU} =               010102      #ID_TUDU #Název konce tohoto TUDU = Praha Dejvice
#${SEARCH_POLE_TUDU} =           PODLE PROSTREDI, JAK ZAIMPLEMENTOVAT TADY?
${VYBER_TUDU} =                 xpath://tbody/tr[2]/td[3]/app-text-cell[1]
${TLACITKO_PREDAT_ETAPU} =      xpath://button[contains(text(),'Předat')]
${TLACITKO_VYTVORIT_ETAPU} =    xpath://button[contains(text(),'Vytvořit etapu')]

*** Keywords ***
#--------------NEW keywords pro TPIApp----------------------

Prijmout_etapu
    click button                ${TLACITKO_PRIJMOUT}
    loadingbike

Zalozit_etapu
    #Click on zalozka
    click element               ${ZALOZKA_ETAPA}
    #Založit etapu
    click element               ${TLACITKO_ZALOZENI_ETAPY}
    loadingbike
    wait until page contains    Editace objektu Etapa

Vyplnit_etapu
#Nazev etapy
    input text                  ${POLE_NAZVU_ETAPY}  ${NAZEV_ETAPY}
    #Předp. termín uved. do provozu
    input text                  ${DATUM_DO_PROVOZU}   ${INPUT_DATUM_DO_PROVOZU}
    #Statisticka skupina
    double click element        ${POLE_STATISTICKE_SKUPINY}
    loadingbike
    double click element        xpath://div[@autocomplete='off'][normalize-space()='${NAZEV_STATISTICKE_SKUPINY}']
    loadingbike
    #Rozdělovatel
    double click element        ${POLE_ROZDELOVATEL}
    loadingbike
    input text                  ${search_pole_etapa_rozdelovatel}  ${ROZDELOVATEL}
    Press Keys                  ${search_pole_etapa_rozdelovatel}  ENTER
    loadingbike
    double click element        ${VYBER_ROZDELOVATELE}
    loadingbike
    #Uložení Rozdělovatele
    click element               ${MENU_SOUBOR}
    click element               ${ULOZIT}
    loadingbike

Zakreslit_Polygon
    #Mapové okno
    click element               ${MAPOVE_OKNO_ETAPA}    #xpath://app-button[@id='17244452800166_button_ZAKRESLIT_POLYGON']//button[@type='button'][contains(text(),'Otevřít mapové okno')]   #DEVTPI xpath://app-button[@id='17244452800166_button_ZAKRESLIT_POLYGON']//button[@type='button'][contains(text(),'Otevřít mapové okno')]           #IDK xpath://body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[5]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[2]/div[1]/app-layout[1]/div[1]/as-split[1]/as-split-area[1]/app-layout[1]/div[1]/app-layout[1]/div[1]/app-layout[3]/div[1]/app-layout[2]/div[1]/app-layout[3]/div[1]/app-button[1]/button[1]
    loadingbike
    #Kliknout na funkci pro zakreslení
    click element               ${FUNKCE_ZAKRESLOVAT}
    #Namířit myší
    Wait Until Page Contains Element    ${MAP_ELEMENT}
    CLICK ELEMENT AT COORDINATES        ${MAP_ELEMENT}  100     200
    CLICK ELEMENT AT COORDINATES        ${MAP_ELEMENT}  110     210
    CLICK ELEMENT AT COORDINATES        ${MAP_ELEMENT}  105     200
    CLICK ELEMENT AT COORDINATES        ${MAP_ELEMENT}  105     200
    loadingbike
    click button                ${TAB_ZAVRIT}
    loadingbike
#   Uložení zakresleného polygonu
    click element               ${MENU_SOUBOR}
    click element               ${ULOZIT}
    loadingbike

Vytvorit_Etapu
    click button    ${TLACITKO_VYTVORIT_ETAPU}
    loadingbike

Fiktivni_Tabelarni_TUDU
#    Fiktivni Tabelární TUDU, jsou povinné pro přidání TUDU
    click element               ${MENU_FUNKCE}
    click element               ${FIKTIVNI_TABELARNI_TUDU}
    loadingbike
#    Nepovinné - Plochy TUDU a TSK
#    open_etapu
#    click element              ${MENU_FUNKCE}
#    click element              ${FIKTIVNI_PLOCHY_TUDU}
#    loadingbike
#    open_etapu
#    click element              ${MENU_FUNKCE}
#    click element              ${FIKTIVNI_TSK}
#    loadingbike

Pridani_TUDU
    click element               ${TLACITKO_PRIDANI_TUDU}              #PREPROD: xpath:////app-table[@id='8504850300166_child_M12A_TUDU']//div[@title='Přidat řádek']//span     TPIDB?: xpath://app-table[@id='8504850300166_child_M12A_TUDU']//div[@title='Přidat řádek']//span
    loadingbike
    input text                  ${search_pole_tudu}     ${VYBRANE_TUDU}
    Press Keys                  ${search_pole_tudu}     ENTER
    loadingbike
    double click element        ${VYBER_TUDU}     #Brainstorm vybírání TUDU - Jaké? Počet?
    loadingbike
#    Uložit
    click button                ${MENU_SOUBOR}    #BYLO TAM TOHLE: xpath://app-menu[@id='1398934800166_MainMenu']//button[contains(text(),'Soubor')]      #IDK xpath://app-menu[@id='2794607200166_MainMenu']//button[@class='btn btn-light dropdown-toggle'][normalize-space()='Soubor']          #PREPROD xpath://app-menu[@id='1398934800166_MainMenu']//button[contains(text(),'Soubor')]
    click element               ${ULOZIT}     #PREPROD        xpath://body//app-root//div[@role='group']//div//div[1]      IDK    xpath://body//app-root//div[@role='group']//div//div[1]
    loadingbike

Predani_Etapy
    click element               ${TLACITKO_PREDAT_ETAPU}
    loadingbike

Kontrola_Predane_Etapy
    #Použitelné pouze pro ADMIN_účet - Tlačítko přijmout neuvidí Rozdelovatel_fat
    wait until page contains    Přijmout

##--------------OLD keywords z TestEtapa----------------------
#Prijmout_etapu
#    click button    xpath://button[contains(text(),'Přijmout')]
#    loadingbike
#
#Zalozit_etapu
##Click on zalozka
#    click element    xpath://a[normalize-space()='Etapa']
#    #Založit etapu
#    click element    xpath://app-table[@id='6954883300166_child_LP_ETAPA']//div[@title='Přidat řádek']//span
#    loadingbike
#    wait until page contains    Editace objektu Etapa
#
#Fill_in_etapa   #Nazev, Termín pro uvedeni do provozu, Stat. skup, Rozdelovatel
#    #Vyplnit etapu
#    #Nazev etapy
#    input text    xpath://app-text[@id='3596950200166_ContainerL_LP_ETAPA_NAZEV_Field']//input[@type='search']  ${nazev_etapy}
#    #Předp. termín uved. do provozu
#    input text  xpath://app-picker[@id='3596951100166_ContainerL_LP_ETAPA_PREDP_TERMIN_UV_PR_Field']//input[@class='form-control picker-input ng-untouched ng-pristine ng-valid']   1.1.2026 00:00:01
#    #Statisticka skupina
#    double click element    xpath://app-assigner[@id='3596953400166_ContainerL_LP_ETAPA_LP_STAT_SKUP_ID_Field']//app-user-editable//input[@placeholder='[nevyplneno]']
#    loadingbike
#    double click element    xpath://div[@autocomplete='off'][normalize-space()='${NAZEV_STATISTICKE_SKUPINY}']
#    loadingbike
#    #Uložit
#    click element    xpath://app-menu[@id='1398934800166_MainMenu']//button[@class='btn btn-light dropdown-toggle'][normalize-space()='Soubor']
#    click element    xpath://body//app-root//div[@role='group']//div//div[1]
#    loadingbike
#    sleep    2
#    #Mapové okno
#    click element   ${MAPOVE_OKNO_ETAPA}    #xpath://app-button[@id='17244452800166_button_ZAKRESLIT_POLYGON']//button[@type='button'][contains(text(),'Otevřít mapové okno')]   #DEVTPI xpath://app-button[@id='17244452800166_button_ZAKRESLIT_POLYGON']//button[@type='button'][contains(text(),'Otevřít mapové okno')]           #IDK xpath://body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[5]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[2]/div[1]/app-layout[1]/div[1]/as-split[1]/as-split-area[1]/app-layout[1]/div[1]/app-layout[1]/div[1]/app-layout[3]/div[1]/app-layout[2]/div[1]/app-layout[3]/div[1]/app-button[1]/button[1]
#    loadingbike
#    #Kliknout na funkci pro zakreslení
#    click element   xpath://div[@id='map-theme-container']//div//div//div//button//span
#    #Namířit myší
#    Wait Until Page Contains Element  ${MAP_ELEMENT}
#    CLICK ELEMENT AT COORDINATES    ${MAP_ELEMENT}  100     200
#    CLICK ELEMENT AT COORDINATES    ${MAP_ELEMENT}  110     210
#    CLICK ELEMENT AT COORDINATES    ${MAP_ELEMENT}  105     200
#    CLICK ELEMENT AT COORDINATES    ${MAP_ELEMENT}  105     200
#    loadingbike
#    click button    xpath://div[@class='docker-tab active']//button[@title='Zavřít']
#    loadingbike
##   Uložení zakresleného polygonu
#    click element    xpath://app-menu[@id='1398934800166_MainMenu']//button[@class='btn btn-light dropdown-toggle'][normalize-space()='Soubor']
#    click element    xpath://body//app-root//div[@role='group']//div//div[1]
#    loadingbike
#    #Rozdělovatel - je rozděleno z důvodu toho, že rozdělovatel není povinný parametr pro zalozeni etapy, ale pro pokračující proces ano.
#    double click element    xpath://app-assigner[@id='7098923400166_ContainerL_LP_ETAPA_ROZDELOVATEL_ZAM_ID_Field']//app-user-editable//input[@placeholder='[nevyplneno]']
#    loadingbike
#    input text  ${search_pole_etapa_rozdelovatel}  ${rozdelovatel}
#    Press Keys  ${search_pole_etapa_rozdelovatel}  ENTER
#    loadingbike
#    double click element    xpath://body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[4]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[2]/div[1]/app-table[1]/div[1]/div[1]/table[1]/tbody[1]/tr[1]/td[2]/app-textarea-cell[1]/div[1]
#    loadingbike
#    #Uložení Rozdělovatele
#    click element    xpath://app-menu[@id='1398934800166_MainMenu']//button[@class='btn btn-light dropdown-toggle'][normalize-space()='Soubor']
#    click element    xpath://body//app-root//div[@role='group']//div//div[1]
#    loadingbike
#
#Fill_in_zalozky
##   Žádost na IS SPPK
#    click element    xpath://a[contains(text(),'Žádosti na IS SPPK')]
#    #Tlačítko pro založení žádosti
#    click element    xpath://app-table[@id='7098973200166_child_LP_ZADOST_NA_SPPK']//span[@class='fas fa-plus-square']
#    loadingbike
#    #Název žádosti
#    input text  xpath://app-text[@id='7365896900166_ContainerL_LP_ZADOST_NA_SPPK_POPIS_Field']//input[@type='search']   ${nazev_zadosti}
#    #Poznamka žádosti
#    input text    xpath://app-textarea[@id='3606010400166_ContainerL_LP_ZADOST_NA_SPPK_POZNAMKA_Field']//textarea[@class='form-control ng-untouched ng-pristine ng-valid']  TestPoznamkaZadosti
#    #Uložit
#    click button    xpath://app-menu[@id='2794607200166_MainMenu']//button[@class='btn btn-light dropdown-toggle'][normalize-space()='Soubor']
#    click element    xpath://body//app-root//div[@role='group']//div//div[1]
#    loadingbike
#    #Zaslat žádost
#    click button    xpath://button[normalize-space()='Zaslat na IS SPPK']
#    loadingbike
#    #Uložit a zavřít
#    click button    xpath://app-menu[@id='2794607200166_MainMenu']//button[@class='btn btn-light dropdown-toggle'][normalize-space()='Soubor']
#    click element    xpath://body//app-root//div[@role='group']//div//div[2]
#    loadingbike
#
#Fill_in_etapu_nepovinne
#    #Predp. termín zahájení
#    input text    xpath://app-picker[@id='3596951400166_ContainerL_LP_ETAPA_PREDP_TERMIN_ZAHAJENI_Field']//input[@class='form-control picker-input ng-untouched ng-pristine ng-valid']  1.3.2025 10:47:03
#    #Poznámka
#    input text    xpath://app-textarea[@id='3596950800166_ContainerL_LP_ETAPA_POZNAMKA_Field']//app-user-editable//textarea     Autotest_poznamka
#    #Uložení
#    click element    xpath://app-menu[@id='1398934800166_MainMenu']//button[@class='btn btn-light dropdown-toggle'][normalize-space()='Soubor']
#    click element    xpath://body//app-root//div[@role='group']//div//div[1]
#    loadingbike
#
#Fiktivne_TUDU
##    Fiktivni Tabelární TUDU, jsou povinné pro přidání TUDU
#    click element    xpath://app-menu[@id='1398934800166_MainMenu']//button[contains(text(),'Funkce')]
#    click element    xpath://div[contains(text(),'Fiktivní doručení dat M12 Tabelární Tudu')]
#    loadingbike
##    Nepovinné - Plochy TUDU a TSK
##    open_etapu
##    click element    xpath://app-menu[@id='1398934800166_MainMenu']//button[contains(text(),'Funkce')]
##    click element    xpath://div[contains(text(),'Fiktivní doručení dat M12 Plochy Tudu')]
##    loadingbike
##    open_etapu
##    click element    xpath://app-menu[@id='1398934800166_MainMenu']//button[contains(text(),'Funkce')]
##    click element    //div[contains(text(),'Fiktivní doručení dat IS TSK')]
##    loadingbike
#
#Add_TUDU
#    click element    xpath://app-table[@id='8504850300166_child_M12A_TUDU']//div[@title='Přidat řádek']//span              #PREPROD: xpath:////app-table[@id='8504850300166_child_M12A_TUDU']//div[@title='Přidat řádek']//span     TPIDB?: xpath://app-table[@id='8504850300166_child_M12A_TUDU']//div[@title='Přidat řádek']//span
#    loadingbike
#    input text  ${search_pole_tudu}     ${VYBRANE_TUDU}
#    Press Keys  ${search_pole_tudu}     ENTER
#    loadingbike
#    double click element    xpath://tbody/tr[2]/td[3]/app-text-cell[1]     #Brainstorm vybírání TUDU - Jaké? Počet?
#    loadingbike
##    Uložit
#    click button    xpath://app-menu[@id='1398934800166_MainMenu']//button[contains(text(),'Soubor')]      #IDK xpath://app-menu[@id='2794607200166_MainMenu']//button[@class='btn btn-light dropdown-toggle'][normalize-space()='Soubor']          #PREPROD xpath://app-menu[@id='1398934800166_MainMenu']//button[contains(text(),'Soubor')]
#    click element   xpath://body//app-root//div[@role='group']//div//div[1]     #PREPROD        xpath://body//app-root//div[@role='group']//div//div[1]      IDK    xpath://body//app-root//div[@role='group']//div//div[1]
#    loadingbike
#
#Predat_etapu
#    click element    xpath://button[contains(text(),'Předat')]
#    loadingbike