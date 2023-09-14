*** Settings ***
Library                             SeleniumLibrary
Variables                           ../Variables.py
Variables                           ../Configurations.py
Resource                            ../CommonKeywords.robot
Resource                            ../SearchKeywords.robot
Resource                            ../TPIApp.robot
#Nalinkovat na TPIapp a napsat to podle funkcionality
*** Variables ***
${TLACITKO_ZALOZIT_FAZI} =              xpath://div[@role='tabpanel']//span[@class='fas fa-plus-square']
${DROPDOWN_STATUS} =                    xpath://button[@id='3601842800166']
${VYBER_STATUSU} =                      xpath://td[contains(text(),'Probíhá')]
${DROPDOWN_NAZEV_FAZE} =                xpath://button[@id='3601843700166']
${VYBER_NAZEV_FAZE} =                   xpath://td[contains(text(),'Územní rozhodnutí')]
${XPATH_DATUM_ZAHAJENI} =               xpath://body//app-root//app-layout[@class='ng-star-inserted']//app-layout[@class='ng-star-inserted']//app-layout[@class='ng-star-inserted']//app-layout[@class='ng-star-inserted']//app-layout[@class='ng-star-inserted']//app-layout[@class='ng-star-inserted']//app-layout[@class='ng-star-inserted']//app-layout[@class='ng-star-inserted']//app-layout[@class='ng-star-inserted']//app-layout[@class='ng-star-inserted']//app-layout[1]//div[1]//app-picker[1]//app-user-editable[1]//div[1]//input[1]
${INPUT_DATUM_ZAHAJENI} =               1.1.2024 00:00:01
${XPATH_DATUM_PLANOVANEHO_UKONCENI} =   xpath://body//app-root//app-layout[@class='ng-star-inserted']//app-layout[@class='ng-star-inserted']//app-layout[@class='ng-star-inserted']//app-layout[@class='ng-star-inserted']//app-layout[@class='ng-star-inserted']//app-layout[@class='ng-star-inserted']//app-layout[@class='ng-star-inserted']//app-layout[@class='ng-star-inserted']//app-layout[@class='ng-star-inserted']//app-layout[@class='ng-star-inserted']//app-layout[2]//div[1]//app-picker[1]//app-user-editable[1]//div[1]//input[1]
${INPUT_DATUM_PLANOVANEHO_UKONCENI} =   1.7.2024 00:00:01
${MENU_SOUBOR_FAZE} =                        xpath://app-menu[@id='1398976000166_MainMenu']//button[@class='btn btn-light dropdown-toggle'][normalize-space()='Soubor']
${ULOZIT} =                             xpath://body//app-root//div[@role='group']//div//div[1]
${XPATH_INVESTOR_EXTERNI} =             xpath://body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[3]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[2]/div[1]/app-layout[1]/div[1]/as-split[1]/as-split-area[1]/app-layout[1]/div[1]/app-layout[1]/div[1]/app-layout[3]/div[1]/app-layout[2]/div[1]/app-layout[1]/div[1]/app-layout[3]/div[1]/app-layout[1]/div[1]/app-assigner[1]/app-user-editable[1]/input[1]
${VYBER_INVESTOR_EXTERNI} =             xpath://div[normalize-space()='EKOHYDRO s.r.o.']
${XPATH_ODPOVEDNA_OSOBA} =              xpath://body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[3]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[2]/div[1]/app-layout[1]/div[1]/as-split[1]/as-split-area[1]/app-layout[1]/div[1]/app-layout[1]/div[1]/app-layout[3]/div[1]/app-layout[2]/div[1]/app-layout[1]/div[1]/app-layout[3]/div[1]/app-layout[2]/div[1]/app-assigner[1]/app-user-editable[1]/input[1]
${INPUT_ODPOVEDNA_OSOBA} =              xpath://div[normalize-space()='Michal']
${XPATH_ODPOVEDNA_OSOBA_CKAIT} =        xpath://body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[3]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[2]/div[1]/app-layout[1]/div[1]/as-split[1]/as-split-area[1]/app-layout[1]/div[1]/app-layout[1]/div[1]/app-layout[3]/div[1]/app-layout[2]/div[1]/app-layout[1]/div[1]/app-layout[3]/div[1]/app-layout[3]/div[1]/app-assigner[1]/app-user-editable[1]/input[1]
${INPUT_ODPOVEDNA_OSOBA_CKAIT} =        xpath://div[normalize-space()='Michal']
${XPATH_ODPOVEDNA_OSOBA_UOZI} =         xpath://body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[3]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[2]/div[1]/app-layout[1]/div[1]/as-split[1]/as-split-area[1]/app-layout[1]/div[1]/app-layout[1]/div[1]/app-layout[3]/div[1]/app-layout[2]/div[1]/app-layout[1]/div[1]/app-layout[3]/div[1]/app-layout[4]/div[1]/app-assigner[1]/app-user-editable[1]/input[1]
${INPUT_ODPOVEDNA_OSOBA_UOZI} =         xpath://div[normalize-space()='Michal']
${XPATH_INVESTICNI_GEODET} =            xpath://body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[3]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[2]/div[1]/app-layout[1]/div[1]/as-split[1]/as-split-area[1]/app-layout[1]/div[1]/app-layout[1]/div[1]/app-layout[3]/div[1]/app-layout[2]/div[1]/app-layout[1]/div[1]/app-layout[3]/div[1]/app-layout[5]/div[1]/app-assigner[1]/app-user-editable[1]/input[1]
${INPUT_INVESTICNI_GEODET} =            xpath://div[normalize-space()='Michal']
*** Keywords ***
Zalozit_fazi_pocinu
#Click on add Faze počinu
    click element                       ${TLACITKO_ZALOZIT_FAZI}
    loadingbike

Vyplnit_fazi_pocinu
#Vybirani statusu
    click button                        ${DROPDOWN_STATUS}
#    click element                       ${VYBER_STATUSU}                   #ORIGINAL
    click element using javascript    //td[contains(text(),'Probíhá')]      #FIX headless chrome
#Vybirani Název fáze
    click button                        ${DROPDOWNNAZEV_FAZE}
#    click element                       ${VYBER_NAZEV_FAZE}                         #ORIGINAL
    click element using javascript    //td[contains(text(),'Územní rozhodnutí')]     #FIX headless chrome
#Vybirani Datumu zahájeni
    input text                          ${XPATH_DATUM_ZAHAJENI}  ${INPUT_DATUM_ZAHAJENI}
#Vybirani Plánovaného Datumu ukončení
    input text                          ${XPATH_DATUM_PLANOVANEHO_UKONCENI}  ${INPUT_DATUM_PLANOVANEHO_UKONCENI}
#Vybirani Datumu ukončení - Vyplňuje se do Špatného pole(Datumu zahájení)
#POLE poznamka
#Nepovinné ---------Níže-------
##Vyplnit investor externí
#    double click element               ${XPATH_INVESTOR_EXTERNI}
#    loadingbike
#    double click element               ${VYBER_INVESTOR_EXTERNI}
#    loadingbike
##Odpovědná osoba (investor) - ext
#    double click element               ${XPATH_ODPOVEDNA_OSOBA}
#    loadingbike
#    double click element               ${INPUT_ODPOVEDNA_OSOBA}
#    loadingbike
##CKAIT odpovědná osoba (investor) - ext
#    double click element               ${XPATH_ODPOVEDNA_OSOBA_CKAIT}
#    loadingbike
#    double click element               ${INPUT_ODPOVEDNA_OSOBA_CKAIT}
#    loadingbike
##UOZI odpovědná osoba (investor) - ext
#    double click element               ${XPATH_ODPOVEDNA_OSOBA_UOZI}
#    loadingbike
#    double click element               ${INPUT_ODPOVEDNA_OSOBA_UOZI}
#    loadingbike
##Investiční geodet - ext
#    double click element               ${XPATH_INVESTICNI_GEODET}
#    loadingbike
#    double click element               ${INPUT_INVESTICNI_GEODET}
#    loadingbike
#   Ulozeni
    click element                       ${MENU_SOUBOR_FAZE}
    click element                       ${ULOZIT}
    loadingbike

Ulozit_zavrit
    click element                       ${MENU_SOUBOR_FAZE}
    click element                       ${ULOZIT_ZAVRIT}
    loadingbike