*** Settings ***
Library    SeleniumLibrary
Variables    ../Resources/Variables.py
Variables    ../Resources/Configurations.py
*** Keywords ***
Open_pocin
    click element   xpath://span[normalize-space()='LInO Portál']
    sleep   1
    click element   xpath://span[contains(text(),'Počiny')]
    sleep   1
    click element   ${seznamPocinu}
    sleep   1
    loadingbike
    input text      ${search_pole_pocin}    ${hledany_pocin}
    Press Keys      ${search_pole_pocin}    ENTER
    loadingbike
    double click element    xpath://div[normalize-space()='${NAZEV_POCINU}']    #ORIGINAL xpath://*[@id="3604962200166_ObjectList"]/div[1]/div[1]/table/tbody/tr[1]/td[5]
    loadingbike
    wait until page contains    Editace objektu Počin
#    ${id_pocinu} =    Get_ID_pocinu_value
#    ${id_pocinu} =    Get_ID_pocinu_text
#    ${id_pocinu} =    Get_ID_pocinu_webelement

Open_etapu
    click element    xpath://a[normalize-space()='Etapa']
#    Otevře první záznam etapy dvojklikutím na její název etapy
#    double click element    xpath://tbody/tr/td[4]/app-textarea-cell[1]
    loadingbike
    #Vyhledá etapu a otevře
    input text    ${SEARCH_POLE_ETAPA_DETAIL_POCINU}    ${HLEDANA_ETAPA}
    Press Keys  ${SEARCH_POLE_ETAPA_DETAIL_POCINU}    ENTER
    loadingbike
    double click element    xpath://div[normalize-space()='${HLEDANA_ETAPA}']        #idk    xpath://div[normalize-space()='${HLEDANA_ETAPA}']
    loadingbike

Get_ID_pocinu_text
    get text    //app-text[@id='3604942200166_ContainerL_LP_POCIN_ID_Field']//input[@type='search']        #//*[@id="3604962200166_ObjectList"]/div[1]/div[1]/table/tbody/tr[1]/td[2]/app-text-cell/div
Get_ID_pocinu_value
    GET VALUE    //app-text[@id='3604942200166_ContainerL_LP_POCIN_ID_Field']//input[@type='search']
Get_ID_pocinu_webelement
    get element attribute   //app-text[@id='3604942200166_ContainerL_LP_POCIN_ID_Field']//input[@type='search']

