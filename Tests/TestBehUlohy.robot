*** Settings ***
Library  SeleniumLibrary
Variables    ../Resources/Variables.py
Variables    ../Resources/Configurations.py
Resource    ../Resources/CommonKeywords.robot
Resource    ../Resources/SearchKeywords.robot
Variables   ../Resources/AdditionalVariables.py

*** Test Cases ***
Vytvořeni Navrhu Zmeny
    login
    open_pocin
    open_etapu
    open_nz
#    Prijmout_NZBeh
    Zalozit_BehUlohy
    Fill_in_BehUlohy_DBF
    Zalozit_BehUlohy
    Fill_in_BehUlohy_VFT
    Zalozit_BehUlohy
    Fill_in_BehUlohy_DGN
    Zalozit_BehUlohy
    Fill_in_BehUlohy_DWG
    Zalozit_BehUlohy
    Fill_in_BehUlohy_DXF
    Zalozit_BehUlohy
    Fill_in_BehUlohy_GML
    Zalozit_BehUlohy
    Fill_in_BehUlohy_SHP
    Zalozit_BehUlohy
    Fill_in_BehUlohy_XML
    Zalozit_BehUlohy
    Fill_in_BehUlohy_ANAL_OSY
    Zalozit_BehUlohy
    Fill_in_BehUlohy_CSV_POINt
    Zalozit_BehUlohy
    Fill_in_BehUlohy_CSV_POLY
    Zalozit_BehUlohy
    Fill_in_BehUlohy_CSV_XYZ
    Zalozit_BehUlohy
    Fill_in_BehUlohy_STANIC
    Predat_NZ_BehUlohy
    Schvalit_NZ

*** Keywords ***
Prijmout_NZBeh
    click button    xpath:(//button[@type='button'][contains(text(),'Přijmout')])[3]
    loadingbike

Zalozit_BehUlohy
#Click on zalozka
    click element    xpath://a[contains(text(),'Běh úlohy')]
    #Založit etapu
    click element    xpath://div[@class='tab-pane ng-star-inserted active show']//span[@class='fas fa-plus-square']
    loadingbike

Fill_in_BehUlohy_DBF
    loadingbike
    #Nazev
    input text    xpath://input[@class='form-control ng-pristine ng-valid ng-touched']      ${NAZEV_BEH_ULOHY}
    #Typ Ulohy
    click element    xpath://body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[5]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[2]/div[1]/app-layout[1]/div[1]/as-split[1]/as-split-area[1]/app-layout[1]/div[1]/app-layout[1]/div[1]/app-layout[3]/div[1]/app-layout[1]/div[1]/app-layout[3]/div[1]/app-layout[3]/div[1]/app-layout[2]/div[1]/app-combobox[1]/app-user-editable[1]/div[1]/div[1]/button[1]
    click element using javascript      //td[normalize-space()='lino_dbf_xy.fmw']     #DBF
    #TODO - lomitko na remote musi byt jinak, vyzkouset /Data/BehUlohy/ZASTAVKA.dxf
    Choose file     xpath://input[@type='file']       ${EXECDIR}\\Data\\BehUlohy\\osa_koleje.dbf
    loadingbike
    #Ulozit
    click element    xpath://body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[5]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[1]/div[1]/app-menu[1]/div[1]/div[1]/button[1]
    click element    xpath://div[@class='show dropdown-menu ng-star-inserted']//div[1]
    loadingbike
    #spusti Ulohu
    click button    xpath://button[normalize-space()='Spustit úlohu']
    LoadingBike
    #Ulozit a zavrit
    click element    xpath://body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[5]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[1]/div[1]/app-menu[1]/div[1]/div[1]/button[1]
    click element    xpath://div[@class='show dropdown-menu ng-star-inserted']//div[1]

Fill_in_BehUlohy_VFT
    loadingbike
    #Nazev
    input text    xpath://input[@class='form-control ng-pristine ng-valid ng-touched']      ${NAZEV_BEH_ULOHY}
    #Typ Ulohy
    click element    xpath://body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[5]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[2]/div[1]/app-layout[1]/div[1]/as-split[1]/as-split-area[1]/app-layout[1]/div[1]/app-layout[1]/div[1]/app-layout[3]/div[1]/app-layout[1]/div[1]/app-layout[3]/div[1]/app-layout[3]/div[1]/app-layout[2]/div[1]/app-combobox[1]/app-user-editable[1]/div[1]/div[1]/button[1]
    click element using javascript      //td[normalize-space()='Import VFT']        #VFT
    Choose file     xpath://input[@type='file']       ${EXECDIR}\\Data\\BehUlohy\\3.vft
    loadingbike
    #Ulozit
    click element    xpath://body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[5]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[1]/div[1]/app-menu[1]/div[1]/div[1]/button[1]
    click element    xpath://div[@class='show dropdown-menu ng-star-inserted']//div[1]
    loadingbike
    #spusti Ulohu
    click button    xpath://button[normalize-space()='Spustit úlohu']
    LoadingBike
    #Ulozit a zavrit
    click element    xpath://body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[5]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[1]/div[1]/app-menu[1]/div[1]/div[1]/button[1]
    click element    xpath://div[@class='show dropdown-menu ng-star-inserted']//div[1]

Fill_in_BehUlohy_DGN
    loadingbike
    #Nazev
    input text    xpath://input[@class='form-control ng-pristine ng-valid ng-touched']      ${NAZEV_BEH_ULOHY}
    #Typ Ulohy
    click element    xpath://body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[5]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[2]/div[1]/app-layout[1]/div[1]/as-split[1]/as-split-area[1]/app-layout[1]/div[1]/app-layout[1]/div[1]/app-layout[3]/div[1]/app-layout[1]/div[1]/app-layout[3]/div[1]/app-layout[3]/div[1]/app-layout[2]/div[1]/app-combobox[1]/app-user-editable[1]/div[1]/div[1]/button[1]
    click element using javascript      //td[normalize-space()='lino_dgn.fmw']
    Choose file     xpath://input[@type='file']       ${EXECDIR}\\Data\\BehUlohy\\dsps_hostivar_GG_crop.dgn
    loadingbike
    #Ulozit
    click element    xpath://body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[5]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[1]/div[1]/app-menu[1]/div[1]/div[1]/button[1]
    click element    xpath://div[@class='show dropdown-menu ng-star-inserted']//div[1]
    loadingbike
    #spusti Ulohu
    click button    xpath://button[normalize-space()='Spustit úlohu']
    LoadingBike
    #Ulozit a zavrit
    click element    xpath://body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[5]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[1]/div[1]/app-menu[1]/div[1]/div[1]/button[1]
    click element    xpath://div[@class='show dropdown-menu ng-star-inserted']//div[1]

Fill_in_BehUlohy_DWG
    loadingbike
    #Nazev
    input text    xpath://input[@class='form-control ng-pristine ng-valid ng-touched']      ${NAZEV_BEH_ULOHY}
    #Typ Ulohy
    click element    xpath://body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[5]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[2]/div[1]/app-layout[1]/div[1]/as-split[1]/as-split-area[1]/app-layout[1]/div[1]/app-layout[1]/div[1]/app-layout[3]/div[1]/app-layout[1]/div[1]/app-layout[3]/div[1]/app-layout[3]/div[1]/app-layout[2]/div[1]/app-combobox[1]/app-user-editable[1]/div[1]/div[1]/button[1]

    click element using javascript      //td[normalize-space()='lino_dwg.fmw']

    Choose file     xpath://input[@type='file']       ${EXECDIR}\\Data\\BehUlohy\\C.2-Koordinační_situace_stavby.dwg
    loadingbike
    #Ulozit
    click element    xpath://body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[5]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[1]/div[1]/app-menu[1]/div[1]/div[1]/button[1]
    click element    xpath://div[@class='show dropdown-menu ng-star-inserted']//div[1]
    loadingbike
    #spusti Ulohu
    click button    xpath://button[normalize-space()='Spustit úlohu']
    LoadingBike
    #Ulozit a zavrit
    click element    xpath://body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[5]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[1]/div[1]/app-menu[1]/div[1]/div[1]/button[1]
    click element    xpath://div[@class='show dropdown-menu ng-star-inserted']//div[1]

Fill_in_BehUlohy_DXF
    loadingbike
    #Nazev
    input text    xpath://input[@class='form-control ng-pristine ng-valid ng-touched']      ${NAZEV_BEH_ULOHY}
    #Typ Ulohy
    click element    xpath://body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[5]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[2]/div[1]/app-layout[1]/div[1]/as-split[1]/as-split-area[1]/app-layout[1]/div[1]/app-layout[1]/div[1]/app-layout[3]/div[1]/app-layout[1]/div[1]/app-layout[3]/div[1]/app-layout[3]/div[1]/app-layout[2]/div[1]/app-combobox[1]/app-user-editable[1]/div[1]/div[1]/button[1]

    click element using javascript      //td[normalize-space()='lino_dxf.fmw']
    #TODO - lomitko na remote musi byt jinak, vyzkouset /Data/BehUlohy/ZASTAVKA.dxf
    Choose file     xpath://input[@type='file']       ${EXECDIR}\\Data\\BehUlohy\\ZASTAVKA.dxf
    loadingbike
    #Ulozit
    click element    xpath://body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[5]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[1]/div[1]/app-menu[1]/div[1]/div[1]/button[1]
    click element    xpath://div[@class='show dropdown-menu ng-star-inserted']//div[1]
    loadingbike
    #spusti Ulohu
    click button    xpath://button[normalize-space()='Spustit úlohu']
    LoadingBike
    #Ulozit a zavrit
    click element    xpath://body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[5]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[1]/div[1]/app-menu[1]/div[1]/div[1]/button[1]
    click element    xpath://div[@class='show dropdown-menu ng-star-inserted']//div[1]

Fill_in_BehUlohy_GML
    loadingbike
    #Nazev
    input text    xpath://input[@class='form-control ng-pristine ng-valid ng-touched']      ${NAZEV_BEH_ULOHY}
    #Typ Ulohy
    click element    xpath://body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[5]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[2]/div[1]/app-layout[1]/div[1]/as-split[1]/as-split-area[1]/app-layout[1]/div[1]/app-layout[1]/div[1]/app-layout[3]/div[1]/app-layout[1]/div[1]/app-layout[3]/div[1]/app-layout[3]/div[1]/app-layout[2]/div[1]/app-combobox[1]/app-user-editable[1]/div[1]/div[1]/button[1]
    click element using javascript      //td[normalize-space()='lino_gml.fmw']
    Choose file     xpath://input[@type='file']       ${EXECDIR}\\Data\\BehUlohy\\osa_gml.gml
    loadingbike
    #Ulozit
    click element    xpath://body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[5]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[1]/div[1]/app-menu[1]/div[1]/div[1]/button[1]
    click element    xpath://div[@class='show dropdown-menu ng-star-inserted']//div[1]
    loadingbike
    #spusti Ulohu
    click button    xpath://button[normalize-space()='Spustit úlohu']
    LoadingBike
    #Ulozit a zavrit
    click element    xpath://body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[5]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[1]/div[1]/app-menu[1]/div[1]/div[1]/button[1]
    click element    xpath://div[@class='show dropdown-menu ng-star-inserted']//div[1]

Fill_in_BehUlohy_SHP
    loadingbike
    #Nazev
    input text    xpath://input[@class='form-control ng-pristine ng-valid ng-touched']      ${NAZEV_BEH_ULOHY}
    #Typ Ulohy
    click element    xpath://body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[5]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[2]/div[1]/app-layout[1]/div[1]/as-split[1]/as-split-area[1]/app-layout[1]/div[1]/app-layout[1]/div[1]/app-layout[3]/div[1]/app-layout[1]/div[1]/app-layout[3]/div[1]/app-layout[3]/div[1]/app-layout[2]/div[1]/app-combobox[1]/app-user-editable[1]/div[1]/div[1]/button[1]

    click element using javascript      //td[normalize-space()='lino_shp.fmw']

    Choose file     xpath://input[@type='file']       ${EXECDIR}\\Data\\BehUlohy\\osa_koleje.shp
    loadingbike
    #Ulozit
    click element    xpath://body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[5]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[1]/div[1]/app-menu[1]/div[1]/div[1]/button[1]
    click element    xpath://div[@class='show dropdown-menu ng-star-inserted']//div[1]
    loadingbike
    #spusti Ulohu
    click button    xpath://button[normalize-space()='Spustit úlohu']
    LoadingBike
    #Ulozit a zavrit
    click element    xpath://body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[5]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[1]/div[1]/app-menu[1]/div[1]/div[1]/button[1]
    click element    xpath://div[@class='show dropdown-menu ng-star-inserted']//div[1]

Fill_in_BehUlohy_XML
    loadingbike
    #Nazev
    input text    xpath://input[@class='form-control ng-pristine ng-valid ng-touched']      ${NAZEV_BEH_ULOHY}
    #Typ Ulohy
    click element    xpath://body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[5]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[2]/div[1]/app-layout[1]/div[1]/as-split[1]/as-split-area[1]/app-layout[1]/div[1]/app-layout[1]/div[1]/app-layout[3]/div[1]/app-layout[1]/div[1]/app-layout[3]/div[1]/app-layout[3]/div[1]/app-layout[2]/div[1]/app-combobox[1]/app-user-editable[1]/div[1]/div[1]/button[1]
    click element using javascript      //td[normalize-space()='lino_dbf_xy.fmw']     #XML

    click element using javascript      //td[normalize-space()='lino_xml.fmw']

    Choose file     xpath://input[@type='file']       ${EXECDIR}\\Data\\BehUlohy\\prejezdy_sestava[22.07.2019].xml
    loadingbike
    #Ulozit
    click element    xpath://body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[5]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[1]/div[1]/app-menu[1]/div[1]/div[1]/button[1]
    click element    xpath://div[@class='show dropdown-menu ng-star-inserted']//div[1]
    loadingbike
    #spusti Ulohu
    click button    xpath://button[normalize-space()='Spustit úlohu']
    LoadingBike
    #Ulozit a zavrit
    click element    xpath://body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[5]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[1]/div[1]/app-menu[1]/div[1]/div[1]/button[1]
    click element    xpath://div[@class='show dropdown-menu ng-star-inserted']//div[1]

Fill_in_BehUlohy_ANAL_OSY
    loadingbike
    #Nazev
    input text    xpath://input[@class='form-control ng-pristine ng-valid ng-touched']      ${NAZEV_BEH_ULOHY}
    #Typ Ulohy
    click element    xpath://body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[5]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[2]/div[1]/app-layout[1]/div[1]/as-split[1]/as-split-area[1]/app-layout[1]/div[1]/app-layout[1]/div[1]/app-layout[3]/div[1]/app-layout[1]/div[1]/app-layout[3]/div[1]/app-layout[3]/div[1]/app-layout[2]/div[1]/app-combobox[1]/app-user-editable[1]/div[1]/div[1]/button[1]

    click element using javascript      //td[normalize-space()='lino_analyza_osy.fmw']

    Choose file     xpath://input[@type='file']       ${EXECDIR}\\Data\\BehUlohy\\dsps_hostivar_GG_crop.dgn
    loadingbike
    #Ulozit
    click element    xpath://body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[5]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[1]/div[1]/app-menu[1]/div[1]/div[1]/button[1]
    click element    xpath://div[@class='show dropdown-menu ng-star-inserted']//div[1]
    loadingbike
    #spusti Ulohu
    click button    xpath://button[normalize-space()='Spustit úlohu']
    LoadingBike
    #Ulozit a zavrit
    click element    xpath://body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[5]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[1]/div[1]/app-menu[1]/div[1]/div[1]/button[1]
    click element    xpath://div[@class='show dropdown-menu ng-star-inserted']//div[1]

Fill_in_BehUlohy_CSV_POINt
    loadingbike
    #Nazev
    input text    xpath://input[@class='form-control ng-pristine ng-valid ng-touched']      ${NAZEV_BEH_ULOHY}
    #Typ Ulohy
    click element    xpath://body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[5]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[2]/div[1]/app-layout[1]/div[1]/as-split[1]/as-split-area[1]/app-layout[1]/div[1]/app-layout[1]/div[1]/app-layout[3]/div[1]/app-layout[1]/div[1]/app-layout[3]/div[1]/app-layout[3]/div[1]/app-layout[2]/div[1]/app-combobox[1]/app-user-editable[1]/div[1]/div[1]/button[1]

    click element using javascript      //td[normalize-space()='lino_csv_point.fmw']

    Choose file     xpath://input[@type='file']       ${EXECDIR}\\Data\\BehUlohy\\SpravyTrate.csv
    loadingbike
    #Ulozit
    click element    xpath://body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[5]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[1]/div[1]/app-menu[1]/div[1]/div[1]/button[1]
    click element    xpath://div[@class='show dropdown-menu ng-star-inserted']//div[1]
    loadingbike
    #spusti Ulohu
    click button    xpath://button[normalize-space()='Spustit úlohu']
    LoadingBike
    #Ulozit a zavrit
    click element    xpath://body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[5]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[1]/div[1]/app-menu[1]/div[1]/div[1]/button[1]
    click element    xpath://div[@class='show dropdown-menu ng-star-inserted']//div[1]

Fill_in_BehUlohy_CSV_POLY
    loadingbike
    #Nazev
    input text    xpath://input[@class='form-control ng-pristine ng-valid ng-touched']      ${NAZEV_BEH_ULOHY}
    #Typ Ulohy
    click element    xpath://body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[5]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[2]/div[1]/app-layout[1]/div[1]/as-split[1]/as-split-area[1]/app-layout[1]/div[1]/app-layout[1]/div[1]/app-layout[3]/div[1]/app-layout[1]/div[1]/app-layout[3]/div[1]/app-layout[3]/div[1]/app-layout[2]/div[1]/app-combobox[1]/app-user-editable[1]/div[1]/div[1]/button[1]

    click element using javascript      //td[normalize-space()='lino_csv_polygon_point.fmw']

    Choose file     xpath://input[@type='file']       ${EXECDIR}\\Data\\BehUlohy\\SpravyTrate.csv
    loadingbike
    #Ulozit
    click element    xpath://body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[5]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[1]/div[1]/app-menu[1]/div[1]/div[1]/button[1]
    click element    xpath://div[@class='show dropdown-menu ng-star-inserted']//div[1]
    loadingbike
    #spusti Ulohu
    click button    xpath://button[normalize-space()='Spustit úlohu']
    LoadingBike
    #Ulozit a zavrit
    click element    xpath://body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[5]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[1]/div[1]/app-menu[1]/div[1]/div[1]/button[1]
    click element    xpath://div[@class='show dropdown-menu ng-star-inserted']//div[1]

Fill_in_BehUlohy_CSV_XYZ
    loadingbike
    #Nazev
    input text    xpath://input[@class='form-control ng-pristine ng-valid ng-touched']      ${NAZEV_BEH_ULOHY}
    #Typ Ulohy
    click element    xpath://body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[5]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[2]/div[1]/app-layout[1]/div[1]/as-split[1]/as-split-area[1]/app-layout[1]/div[1]/app-layout[1]/div[1]/app-layout[3]/div[1]/app-layout[1]/div[1]/app-layout[3]/div[1]/app-layout[3]/div[1]/app-layout[2]/div[1]/app-combobox[1]/app-user-editable[1]/div[1]/div[1]/button[1]

    click element using javascript      //td[normalize-space()='lino_csv_xyz.fmw']

    Choose file     xpath://input[@type='file']       ${EXECDIR}\\Data\\BehUlohy\\SpravyTrate.csv
    loadingbike
    #Ulozit
    click element    xpath://body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[5]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[1]/div[1]/app-menu[1]/div[1]/div[1]/button[1]
    click element    xpath://div[@class='show dropdown-menu ng-star-inserted']//div[1]
    loadingbike
    #spusti Ulohu
    click button    xpath://button[normalize-space()='Spustit úlohu']
    LoadingBike
    #Ulozit a zavrit
    click element    xpath://body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[5]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[1]/div[1]/app-menu[1]/div[1]/div[1]/button[1]
    click element    xpath://div[@class='show dropdown-menu ng-star-inserted']//div[1]

Fill_in_BehUlohy_STANIC
    loadingbike
    #Nazev
    input text    xpath://input[@class='form-control ng-pristine ng-valid ng-touched']      ${NAZEV_BEH_ULOHY}
    #Typ Ulohy
    click element    xpath://body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[5]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[2]/div[1]/app-layout[1]/div[1]/as-split[1]/as-split-area[1]/app-layout[1]/div[1]/app-layout[1]/div[1]/app-layout[3]/div[1]/app-layout[1]/div[1]/app-layout[3]/div[1]/app-layout[3]/div[1]/app-layout[2]/div[1]/app-combobox[1]/app-user-editable[1]/div[1]/div[1]/button[1]

    click element using javascript      //td[normalize-space()='lino_csv_stanickniky_2.fmw']
    Choose file     xpath://input[@type='file']       ${EXECDIR}\\Data\\BehUlohy\\Import_stan_210518_uprava_pepa__KALINA1.csv
    loadingbike
    #Ulozit
    click element    xpath://body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[5]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[1]/div[1]/app-menu[1]/div[1]/div[1]/button[1]
    click element    xpath://div[@class='show dropdown-menu ng-star-inserted']//div[1]
    loadingbike
    #Pridat pridat_fotky_stanicniky
    Pridat_fotky_stanicniky
    LoadingBike
    #Import Stanicniku
    click button    xpath://button[contains(text(),'Import staničníků')]
    LoadingBike
    #Ulozit a zavrit
    click element    xpath://body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[5]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[1]/div[1]/app-menu[1]/div[1]/div[1]/button[1]
    click element    xpath://div[@class='show dropdown-menu ng-star-inserted']//div[1]

Open_NZ

    click element    xpath:(//a[contains(text(),'Návrh změny')])[1]
    sleep    1
    double click element    xpath://body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[3]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[2]/div[1]/app-layout[1]/div[1]/as-split[1]/as-split-area[2]/app-layout[1]/div[1]/app-layout[1]/div[1]/app-tab[1]/div[1]/div[2]/div[1]/app-layout[1]/div[1]/app-layout[1]/div[1]/app-table[1]/div[1]/div[1]/table[1]/tbody[1]/tr[1]/td[5]

Predat_NZ_BehUlohy
    loadingbike
    click element    xpath://button[contains(text(),'Předat ke schválení')]

Fiktivni_vytvoreni_zplatneni_GIS
    loadingbike
    click element    xpath://div[contains(text(),'Fiktivní vytvoření NZ v GIS')]
    loadingbike
    click element    xpath://div[contains(text(),'Fiktivní Zplatnění NZ v GIS')]

Schvalit_NZ
    click element       xpath://button[normalize-space()='Schválit']

Prijmout_NZ_Schval
    loadingbike
    click element    xpath://body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[4]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[2]/div[1]/app-layout[1]/div[1]/as-split[1]/as-split-area[1]/app-layout[1]/div[1]/app-layout[1]/div[1]/app-layout[3]/div[1]/app-layout[2]/div[1]/app-layout[8]/div[1]/app-button[1]/button[1]
    loadingbike

Pridat_fotky_stanicniky
    #Import fotky
    loadingbike
    click element    xpath://app-docker-tab[5]//div[1]//app-window[1]//div[1]//div[1]//app-layout[1]//div[1]//app-layout[2]//div[1]//app-layout[1]//div[1]//as-split[1]//as-split-area[2]//app-layout[1]//div[1]//app-layout[1]//div[1]//app-tab[1]//div[1]//div[2]//div[1]//app-layout[1]//div[1]//app-layout[1]//div[1]//app-table[1]//div[1]//app-toolbar[1]//div[1]//div[1]//span[1]
    choose file    xpath://body/app-root/app-main[@class='ng-star-inserted']/div[@class='content-wrapper']/as-split[@class='as-horizontal as-percent as-init']/as-split-area[@class='as-split-area']/app-docker-tabs/div[@class='docker-tab-content ng-star-inserted']/app-docker-tab[@class='ng-star-inserted']/div[@class='docker-tab-content']/app-window[@class='ng-star-inserted']/div[@class='window']/div[@class='window-content']/app-layout[@class='ng-star-inserted']/div[@class='layout']/app-layout[@class='ng-star-inserted']/div[@class='layout']/app-layout[@class='ng-star-inserted']/div[@class='layout']/app-layout[@class='ng-star-inserted']/div[@class='layout']/app-layout[@class='ng-star-inserted']/div[@class='layout']/app-layout[@class='ng-star-inserted']/div[@class='layout']/app-layout[@class='ng-star-inserted']/div[@class='layout']/app-layout[@class='ng-star-inserted']/div[@class='layout']/app-layout[@class='ng-star-inserted']/div[@class='layout']/app-file[@class='ng-star-inserted']/div[@class='file-wrapper']/input[1]        ${EXECDIR}\\Data\\BehUlohy\\stanicniky_test.zip
    LoadingBike
    #Ulozit
    click button    xpath://body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[6]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[1]/div[1]/app-menu[1]/div[1]/div[1]/button[1]
    click element    xpath://div[@class='show dropdown-menu ng-star-inserted']//div[1]
    loadingbike
    #Spojit fotky
    click button    xpath://button[contains(text(),'Spojit fotky se staničníky')]
    loadingbike
    #Ulozit Zavrit
    click button    xpath://body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[6]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[1]/div[1]/app-menu[1]/div[1]/div[1]/button[1]
    click element    xpath://div[@class='show dropdown-menu ng-star-inserted']//div[1]