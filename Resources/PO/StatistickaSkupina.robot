*** Settings ***
Library                             SeleniumLibrary
Variables                           ../Variables.py
Variables                           ../Configurations.py
Resource                            ../CommonKeywords.robot
Resource                            ../SearchKeywords.robot
Resource                            ../TPIApp.robot
#Nalinkovat na TPIapp a napsat to podle funkcionality
*** Variables ***
${NAZEV_STATISTICKE_SKUPINY} =              MM_test_stat
${ZALOZKA_STATISTICKE_SKUPINY} =            xpath://a[normalize-space()='Statistická skupina']
${TLACITKO_ZALOZIT_STATISTICKOU_SKUPINU} =  xpath://app-table[@id='3601879400166_child_LP_STAT_SKUP']//span[@class='fas fa-plus-square']
${POLE_NAZEV_STATISCKE_SKUPINY} =           xpath://app-text[@id='3609410700166_ContainerL_LP_STAT_SKUP_NAZEV_Field']//input[@type='search']
${MENU_SOUBOR_STATISCKE_SKUPINY} =                            xpath://app-menu[@id='2886576900166_MainMenu']//button[@class='btn btn-light dropdown-toggle'][normalize-space()='Soubor']
${ULOZIT_A_ZAVRIT} =                        xpath://body//app-root//div[@role='group']//div//div[2]

*** Keywords ***
Zalozit_statistickou_skupinu
    #Klik na záložku Statisticka skupina
    click element                           ${ZALOZKA_STATISTICKE_SKUPINY}
    #Klik pro založení nového záznamu
    click element                           ${TLACITKO_ZALOZIT_STATISTICKOU_SKUPINU}
    loadingbike
Vyplnit_Statistickou_skupinu
    #Input nazvu
    input text                              ${POLE_NAZEV_STATISCKE_SKUPINY}    ${NAZEV_STATISTICKE_SKUPINY}
    #Ulozeni
    click element                           ${MENU_SOUBOR_STATISCKE_SKUPINY}
    click element                           ${ULOZIT_A_ZAVRIT}
    loadingbike