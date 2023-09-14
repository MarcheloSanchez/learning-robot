import Configurations


#Doplnit do PO
if Configurations.PROSTREDI.upper() == "PREPROD":
    SEARCH_POLE_ZPRACOVATEL = "xpath://body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[5]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[2]/div[1]/app-table[1]/div[1]/div[1]/table[1]/thead[1]/tr[1]/th[2]/div[1]/div[1]/input[1]"
elif Configurations.PROSTREDI.upper() == "DEVTPI":
    SEARCH_POLE_ZPRACOVATEL = "doplnit"
elif Configurations.PROSTREDI.upper() == "TPIDB":
    SEARCH_POLE_ZPRACOVATEL = "//body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[5]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[2]/div[1]/app-table[1]/div[1]/div[1]/table[1]/thead[1]/tr[1]/th[2]/div[1]/div[1]/input[1]"

if Configurations.PROSTREDI.upper() == "PREPROD":
    SEARCH_POLE_SCHVALOVATEL = "xpath://body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[5]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[2]/div[1]/app-table[1]/div[1]/div[1]/table[1]/thead[1]/tr[1]/th[2]/div[1]/div[1]/input[1]"
elif Configurations.PROSTREDI.upper() == "DEVTPI":
    SEARCH_POLE_SCHVALOVATEL = "doplnit"
elif Configurations.PROSTREDI.upper() == "TPIDB":
    SEARCH_POLE_SCHVALOVATEL = "//body[1]/app-root[1]/app-main[1]/div[2]/as-split[1]/as-split-area[2]/app-docker-tabs[1]/div[2]/app-docker-tab[5]/div[1]/app-window[1]/div[1]/div[1]/app-layout[1]/div[1]/app-layout[2]/div[1]/app-table[1]/div[1]/div[1]/table[1]/thead[1]/tr[1]/th[2]/div[1]/div[1]/input[1]"

ZPRACOVATEL = "GEO Admin"
SCHVALOVATEL = "GEO Admin"
NAZEV_BEH_ULOHY = "Auto_DV_0506A"

