*** Settings ***
Library                             SeleniumLibrary
Variables                           ../Variables.py
Variables                           ../Configurations.py
Resource                            ../CommonKeywords.robot
Resource                            ../SearchKeywords.robot
Resource                            ../TPIApp.robot
#Nalinkovat na TPIapp a napsat to podle funkcionality

*** Variables ***
${ZALOZKA_ZADOST} =                 xpath://a[contains(text(),'Žádosti na IS SPPK')]
${TLACITKO_ZALOZENI_ZADOSTI} =      xpath://app-table[@id='7098973200166_child_LP_ZADOST_NA_SPPK']//span[@class='fas fa-plus-square']
${POLE_NAZEV_ZADOSTI} =             xpath://app-text[@id='7365896900166_ContainerL_LP_ZADOST_NA_SPPK_POPIS_Field']//input[@type='search']
${INPUT_NAZEV_ZADOSTI} =            AutoTestZadost
${POLE_POZNAMKA_ZADOSTI} =          xpath://app-textarea[@id='3606010400166_ContainerL_LP_ZADOST_NA_SPPK_POZNAMKA_Field']//textarea[@class='form-control ng-untouched ng-pristine ng-valid']
${INPUT_POZNAMKA_ZADOSTI} =         AutoTestPoznamkaZadosti
${MENU_SOUBOR_ZADOST} =                    xpath://app-menu[@id='2794607200166_MainMenu']//button[@class='btn btn-light dropdown-toggle'][normalize-space()='Soubor']
${ULOZIT} =                         xpath://body//app-root//div[@role='group']//div//div[1]
${ULOZIT_ZAVRIT} =                  xpath://body//app-root//div[@role='group']//div//div[2]
${TLACITKO_ZASLAT_ZADOST} =         xpath://button[normalize-space()='Zaslat na IS SPPK']

*** Keywords ***
Zalozit_ZadostISSPPK
    #Kliknout na záložku Žádost
    click element                   ${ZALOZKA_ZADOST}
    #Tlačítko pro založení žádosti
    click element                   ${TLACITKO_ZALOZENI_ZADOSTI}
    loadingbike

Vyplnit_ZadostISSPPK
    #Název žádosti
    input text                      ${POLE_NAZEV_ZADOSTI}   ${INPUT_NAZEV_ZADOSTI}
    #Poznamka žádosti
    input text                      ${POLE_POZNAMKA_ZADOSTI}  ${INPUT_POZNAMKA_ZADOSTI}
    #Uložit
    click button                    ${MENU_SOUBOR}
    click element                   ${ULOZIT}
    loadingbike

Odeslat_ZadostISSPPK
    #Zaslat žádost
    click button                    ${TLACITKO_ZASLAT_ZADOST}
#    loadingbike
    #Dát delší loading kvůli DEVTPI
    sleep    2
    Wait Until Page Does Not Contain element 	xpath://div[@class='ngx-spinner-overlay ng-tns-c15-0 ng-trigger ng-trigger-fadeIn ng-star-inserted']    ${WAITING_TIME_ZADOST}

    #Uložit a zavřít
    click button                    ${MENU_SOUBOR_ZADOST}
    click element                   ${ULOZIT_ZAVRIT}
    loadingbike
