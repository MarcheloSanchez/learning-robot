BROWSER = "CHROME"
PROSTREDI = "DEVTPI"
USERNAME = "admin_test"    #admin_test
PASSWORD = "qwe"

if PROSTREDI.upper() == "TPIDB":
    URL = "http://10.30.190.206/tpi_app/login"
elif PROSTREDI.upper() == "DEVTPI":
    URL = "http://szdc000phant153.d01.uadf.cz/tpi_app/login"
elif PROSTREDI.upper() == "PREPROD":
    URL = "http://szdc000phant148.d01.uadf.cz/tpi_app/login"

if PROSTREDI.upper() == "PREPROD":
    MAPOVE_OKNO_ETAPA = "xpath:(//button[@type='button'][contains(text(),'Otevřít mapové okno')])[2]"
elif PROSTREDI.upper() == "DEVTPI":
    MAPOVE_OKNO_ETAPA = "xpath:(//button[@type='button'][contains(text(),'Otevřít mapové okno')])[2]"
elif PROSTREDI.upper() == "TPIDB":
    MAPOVE_OKNO_ETAPA = "xpath:(//button[@type='button'][contains(text(),'Otevřít mapové okno')])[2]"

if PROSTREDI.upper() == "PREPROD":
    SEARCH_POLE_POCIN = "xpath://body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[1]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[2]/div[1]/app-table[1]/div[1]/div[1]/table[1]/thead[1]/tr[1]/th[5]/div[1]/div[1]/input[1]"
elif PROSTREDI.upper() == "DEVTPI":
    SEARCH_POLE_POCIN = "xpath://body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[1]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[2]/div[1]/app-table[1]/div[1]/div[1]/table[1]/thead[1]/tr[1]/th[5]/div[1]/div[1]/input[1]"
elif PROSTREDI.upper() == "TPIDB":
    SEARCH_POLE_POCIN = "xpath:(//input[@type='search'])[5]"

#Nefunguje DEVTPI, NOVĚ- "xpath://body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[1]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[2]/div[1]/app-table[1]/div[1]/div[1]/table[1]/thead[1]/tr[1]/th[5]/div[1]/div[1]/input[1]"
#NOVĚ TPIDB? "xpath://th[@id='4825668800159']//input[@type='search']"
#SEARCH_POLE_POCIN = "xpath://th[@id='4714898200159']//div//div//input[@type='search']" #DEVTPI xpath://th[@id='12836267000159']//div//div//input[@type='search']    #PREPROD xpath://th[@id='4714898200159']//div//div//input[@type='search']  #TPIDB xpath://th[@id='4593415900159']//div//div//input[@type='search']

if PROSTREDI.upper() == "PREPROD":
    SEARCH_POLE_PRIPRAVAR = "xpath://body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[3]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[2]/div[1]/app-table[1]/div[1]/div[1]/table[1]/thead[1]/tr[1]/th[2]/div[1]/div[1]/input[1]"
elif PROSTREDI.upper() == "DEVTPI":
    SEARCH_POLE_PRIPRAVAR = "xpath://th[@id='4924975900159']//input[@type='search']"
elif PROSTREDI.upper() == "TPIDB":
    SEARCH_POLE_PRIPRAVAR = "xpath:(//input[@type='search'])[47]"

#NOVĚ TPIDB - //body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[3]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[2]/div[1]/app-table[1]/div[1]/div[1]/table[1]/thead[1]/tr[1]/th[2]/div[1]/div[1]/input[1]
#SEARCH_POLE_PRIPRAVAR = "xpath://th[@id='12841142500159']//input[@type='search']"      #DEVTPI    xpath://th[@id='12841142500159']//input[@type='search']      #PREPROD    xpath:          #TPIDB    xpath://th[@id='4825565400159']//input[@type='search']

if PROSTREDI.upper() == "PREPROD":
    SEARCH_POLE_ETAPA_ROZDELOVATEL = "xpath://body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[4]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[2]/div[1]/app-table[1]/div[1]/div[1]/table[1]/thead[1]/tr[1]/th[2]/div[1]/div[1]/input[1]"
elif PROSTREDI.upper() == "DEVTPI":
    SEARCH_POLE_ETAPA_ROZDELOVATEL = "xpath:(//input[@type='search'])[87]"
elif PROSTREDI.upper() == "TPIDB":
    SEARCH_POLE_ETAPA_ROZDELOVATEL = "xpath:(//input[@type='search'])[87]"

#SEARCH_POLE_ETAPA_ROZDELOVATEL = "xpath://th[@id='12841142500159']//input[@type='search']" #DEVTPI   xpath://th[@id='12841142500159']//input[@type='search']       #PREPROD xpath://th[@id='4714795000159']//input[@type='search']     #TPIDB  xpath:

if PROSTREDI.upper() == "PREPROD":
    SEARCH_POLE_ETAPA_DETAIL_POCINU = "xpath://body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[2]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[2]/div[1]/app-layout[1]/div[1]/as-split[1]/as-split-area[2]/app-layout[1]/div[1]/app-layout[1]/div[1]/app-tab[1]/div[1]/div[2]/div[1]/app-layout[1]/div[1]/app-layout[1]/div[1]/app-table[1]/div[1]/div[1]/table[1]/thead[1]/tr[1]/th[4]/div[1]/div[1]/input[1]"
elif PROSTREDI.upper() == "DEVTPI":
    SEARCH_POLE_ETAPA_DETAIL_POCINU = "xpath://body//app-root//app-layout[@class='ng-star-inserted']//app-layout[@class='ng-star-inserted']//app-layout[@class='ng-star-inserted']//th[4]//div[1]//div[1]//input[1]"
elif PROSTREDI.upper() == "TPIDB":
    SEARCH_POLE_ETAPA_DETAIL_POCINU = "xpath:(//input[@type='search'])[43]"

#SEARCH_POLE_ETAPA_DETAIL_POCINU = "xpath://th[@id='12836253800159']//input[@type='search']" #DEVTPI xpath://th[@id='12836253800159']//input[@type='search']        #TPIDB  xpath:

if PROSTREDI.upper() == "PREPROD":
    SEARCH_POLE_TUDU = "xpath://th[@id='4893828100159']//input[@type='search']"
elif PROSTREDI.upper() == "DEVTPI":
    SEARCH_POLE_TUDU = "xpath://body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[4]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[2]/div[1]/app-table[1]/div[1]/div[1]/table[1]/thead[1]/tr[1]/th[2]/div[1]/div[1]/input[1]"
elif PROSTREDI.upper() == "TPIDB":
    SEARCH_POLE_TUDU = "xpath://app-docker-tab[4]//div[1]//app-window[1]//div[1]//div[1]//app-layout[1]//div[1]//app-layout[2]//div[1]//app-table[1]//div[1]//div[1]//table[1]//thead[1]//tr[1]//th[2]//div[1]//div[1]//input[1]"

#SEARCH_POLE_TUDU = "xpath://th[@id='12838306100159']//div//div//input[@type='search']"  #DEVTPI xpath:xpath://th[@id='12838306100159']//div//div//input[@type='search']        #TPIDB  xpath:
