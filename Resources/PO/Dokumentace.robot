*** Settings ***
Library                             SeleniumLibrary
Variables                           ../Variables.py
Variables                           ../Configurations.py
Resource                            ../CommonKeywords.robot
Resource                            ../SearchKeywords.robot
Resource                            ../TPIApp.robot
#Nalinkovat na TPIapp a napsat to podle funkcionality
*** Variables ***
${TLACITKO_ZALOZIT_DOKUMENTACI} =   xpath://body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[3]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[2]/div[1]/app-layout[1]/div[1]/as-split[1]/as-split-area[2]/app-layout[1]/div[1]/app-layout[1]/div[1]/app-tab[1]/div[1]/div[2]/div[1]/app-layout[1]/div[1]/app-layout[1]/div[1]/app-table[1]/div[1]/app-toolbar[1]/div[1]/div[1]/span[1]
${DROPDOWN_MILNIK} =                xpath://button[@id='6979000300166']
${VYBER_MILNIK} =                   xpath://td[normalize-space()='Nabytí právní moci územního rozhodnutí']
${DROPDOWN_UKON} =                  xpath://button[@id='6979000700166']
${VYBER_UKON} =                     xpath://td[normalize-space()='Skutečný termín nabytí právní moci']
${NAZEV_DOKUMENTU} =                xpath://body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[4]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[2]/div[1]/app-layout[1]/div[1]/app-layout[1]/div[1]/app-layout[1]/div[1]/app-layout[3]/div[1]/app-layout[2]/div[1]/app-layout[2]/div[1]/app-layout[3]/div[1]/app-text[1]/app-user-editable[1]/input[1]
${INPUT_NAZEV_DOKUMENTU} =          Testovaci Dokument
${POLE_DATUM_VYTVORENI} =           xpath://app-picker[@id='7436940900166_ContainerL_LP_DOKUMENTACE_DATUM_VYTVORENI_Field']//app-user-editable//div//input
${INPUT_DATUM_VYTVORENI} =          10.10.2023 01:01:01
${POLE_DATUM_ZMENY} =               xpath://app-picker[@id='3600644400166_ContainerL_LP_DOKUMENTACE_DATUM_POSL_ZMENY_Field']//app-user-editable//div//input
${INPUT_DATUM_ZMENY} =              10.10.2023 08:06:39
${XPATH_PRILOHA} =                  xpath://input[@type='file']
${CESTA_SOUBORU} =                  ${EXECDIR}\\AutomatizaceTestu\\Data\\Testfile.txt       #FUNGUJE?
${MENU_SOUBOR_DOKUMENTACE} =                    xpath://app-menu[@id='1399151300166_MainMenu']//button[@class='btn btn-light dropdown-toggle'][normalize-space()='Soubor']
${ULOZIT_ZAVRIT} =                  xpath://body//app-root//div[@role='group']//div//div[2]

*** Keywords ***
Zalozit_dokumentaci
    click element                   ${TLACITKO_ZALOZIT_DOKUMENTACI}
    loadingbike

Vyplnit_Dokumentaci
    #Milník
    click button                    ${DROPDOWN_MILNIK}
#    click element                   ${VYBER_MILNIK}                                                    #ORIGINAL
    click element using javascript    //td[normalize-space()='Nabytí právní moci územního rozhodnutí']  #FIX headless chrome
    #Úkon
    click button                    ${DROPDOWN_UKON}
#    click element                   ${VYBER_UKON}                                                      #ORIGINAL
    click element using javascript    //td[normalize-space()='Skutečný termín nabytí právní moci']      #FIX headless chrome
    #Název dokumentu
    input text                      ${NAZEV_DOKUMENTU}     ${INPUT_NAZEV_DOKUMENTU}
    #Datum vytvoření - Nejde mi lokalizovat xpath na button Kalendáře
    input text                      ${POLE_DATUM_VYTVORENI}     ${INPUT_DATUM_VYTVORENI}
    #Aktuální den zobrazovaný modře v kalendářiclick element   xpath://div[@class='btn-light ng-star-inserted bg-primary text-white']
    #Datum poslední změny
    input text                      ${POLE_DATUM_ZMENY}   ${INPUT_DATUM_ZMENY}
    #ID přílohy
    #Tohle označi pole Přílohy, ale neotevře nabídku - double click element    xpath://*[@id="7144716900166_ContainerL_LP_DOKUMENTACE_TPI_ATTACHMENT_ID_Field"]/div/input[2]
#   double click element    xpath://span[@class='fa fa-upload']
    #input text    xpath://span[@class='fa fa-upload']        testtext.txt
    Choose file                     ${XPATH_PRILOHA}       ${CESTA_SOUBORU}
    loadingbike
    #ULOZIT_SOUBOR -
    click element                   ${MENU_SOUBOR_DOKUMENTACE}
    click element                   ${ULOZIT_ZAVRIT}
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