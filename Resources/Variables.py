from datetime import datetime
from typing import Final
current_date: Final[datetime] = str(datetime.now().strftime("%d.%m.%Y %H:%M:%S"))

WAITING_TIME = 120
WAITING_TIME_ZADOST = 500
NAZEV_POCINU = "AutoTest 1606"      #Uplatnění v jednom souboru => unikátní název - + current_date #Pro přehlednost používat unikátní názvy
HLEDANY_POCIN = NAZEV_POCINU   #Parametr pro metodu - open_pocin
NAZEV_ETAPY = "AutoTest 1606A" #Uplatnění v jednom souboru => unikátní název - + current_date
HLEDANA_ETAPA = NAZEV_ETAPY #Parametr pro metodu - open_etapa
NAZEV_STATISTICKE_SKUPINY = "AutoTestStat"
NAZEV_ZADOSTI = "AutoTestZadost"
PRIPRAVAR = "GEO Admin"   #GEO Admin
ROZDELOVATEL = "GEO Admin"
SEZNAM_POCINU = "xpath://span[contains(text(),'Seznam počinů')]"
VYBRANE_TUDU = "010102" #Název konce TUDU = Praha Dejvice
MAP_ELEMENT = "//div[@class='ol-layer']//canvas"
UKOLOVNIK = "xpath://body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[1]/app-service-selector[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[2]/div[1]/app-layout[2]/div[1]/as-split[1]/as-split-area[1]/app-layout[1]/div[1]/app-table[1]/div[1]/div[1]/table[1]/tbody[1]/tr[1]/td[1]/app-assigner-cell[1]/input[1]"





