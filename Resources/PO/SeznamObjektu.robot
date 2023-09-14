*** Settings ***
Library                             SeleniumLibrary
Variables                           ../Variables.py
Variables                           ../Configurations.py
Resource                            ../CommonKeywords.robot
Resource                            ../SearchKeywords.robot
Resource                            ../TPIApp.robot
#Nalinkovat na TPIapp a napsat to podle funkcionality

*** Variables ***
${SEZNAM_ETAP} =                DOPLNIT xpath
${SEZNAM_POCINU} =              xpath://span[contains(text(),'Seznam počinů')]
${STROM_LINO_PORTAL} =          xpath://span[normalize-space()='LInO Portál']
${STROM_POCINY} =               xpath://span[contains(text(),'Počiny')]
${STROM_NAVRH_ZMENY} =          xpath://span[contains(text(),'Návrh Změny')]
${ZALOZKA_ETAPA} =              xpath://a[normalize-space()='Etapa']
${CESTA_PRO_PRVNI_ZAZNAM} =     xpath://*[@id="3604962200166_ObjectList"]/div[1]/div[1]/table/tbody/tr[1]/td[5]
#${SEARCH_POLE_ETAPA_DETAIL_POCINU} =    PODLE PROSTREDI, JAK ZAIMPLEMENTOVAT TADY?
#${SEACRH_POLE_POCIN} =          PODLE PROSTREDI, JAK ZAIMPLEMENTOVAT TADY?
*** Keywords ***
Otevrit_pocin
    click element               ${STROM_LINO_PORTAL}
    sleep   1
    click element               ${STROM_POCINY}
    sleep   1
    click element               ${SEZNAM_POCINU}
    loadingbike

Otevrit_etapu
    click element               ${STROM_LINO_PORTAL}
    sleep   1
    click element               ${STROM_NAVRH_ZMENY}                            #neotestované
    sleep   1
    click element               ${SEZNAM_ETAP}                                  #neotestované
    loadingbike

Otevrit_etapu_pres_zalozku_na_pocinu
    click element               ${ZALOZKA_ETAPA}
#    Otevře první záznam etapy dvojklikutím na její název etapy
#    double click element    xpath://tbody/tr/td[4]/app-textarea-cell[1]
#    loadingbike
    #Vyhledá etapu a otevře
    input text                  ${SEARCH_POLE_ETAPA_DETAIL_POCINU}    ${HLEDANA_ETAPA}
    Press Keys                  ${SEARCH_POLE_ETAPA_DETAIL_POCINU}    ENTER
    loadingbike
    double click element        xpath://div[normalize-space()='${HLEDANA_ETAPA}']
    loadingbike

Vyhledat_pocin
    input text                  ${search_pole_pocin}    ${hledany_pocin}
    Press Keys                  ${search_pole_pocin}    ENTER
    loadingbike
    double click element        ${CESTA_PRO_PRVNI_ZAZNAM}
    loadingbike
    wait until page contains    Editace objektu Počin

Vyhledat_etapu
    input text                  ${SEARCH_POLE_ETAPA_DETAIL_POCINU}    ${HLEDANA_ETAPA}
    Press Keys                  ${SEARCH_POLE_ETAPA_DETAIL_POCINU}    ENTER
    loadingbike
    double click element        xpath://div[normalize-space()='${HLEDANA_ETAPA}']
    loadingbike