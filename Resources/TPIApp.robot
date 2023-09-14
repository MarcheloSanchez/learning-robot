*** Settings ***
#Variables    ../Resources/Variables.py
#Variables    ../Resources/Configurations.py
#Resource    ../Resources/CommonKeywords.robot
#Resource    ../Resources/SearchKeywords.robot
#Nalinkované PO - Nevyzkoušený link
Resource    ./PO/SeznamObjektu.robot
Resource    ./PO/Pocin.robot
Resource    ./PO/FazePocinu.robot
Resource    ./PO/Dokumentace.robot
Resource    ./PO/StatistickaSkupina.robot
Resource    ./PO/Etapa.robot
Resource    ./PO/ZadostISSPPK.robot
Resource    ./PO/NavrhZmeny.robot
Resource    ./PO/BehUlohy.robot


*** Keywords ***
#-----------SEKCE PRO POČIN------------------
Zalozit_Pocin
    Otevrit_pocin
    Zalozit_novy_pocin

Vyplnit_Pocin
    Pocin.Vyplnit_pocin

Zakreslit_Polygon
    Pocin.Zakreslit_polygon

Zalozit_a_Vyplnit_Fazi_Pocin
    FazePocinu.Zalozit_fazi_pocinu
    FazePocinu.Vyplnit_fazi_pocinu

Zalozit_a_Vyplnit_Dokumentaci
    Dokumentace.Zalozit_dokumentaci
    Dokumentace.Vyplnit_dokumentaci

Zalozit_a_Vyplnit_Statistickou_Skupinu
    StatistickaSkupina.Zalozit_statistickou_skupinu
    StatistickaSkupina.Vyplnit_statistickou_skupinu

Ulozit_a_Zavrit_Fazi_Pocinu
    FazePocinu.Ulozit_zavrit

Predat_Pocin
    Pocin.Predat_pocin
    Pocin.Kontrola_aktivniho_pocinu

#-----------SEKCE PRO ETAPU------------------
Prijmout_Etapu
    Etapa.Prijmout_etapu

Zalozit_Etapu
    Etapa.Zalozit_etapu

Vyplnit_Etapu
    Etapa.Vyplnit_etapu

Zalozit_ZadostISSPPK
    ZadostISSPPK.Zalozit_ZadostISSPPK
    ZadostISSPPK.Vyplnit_ZadostISSPPK

Odeslat_ZadostISSPPK
    ZadostISSPPK.Odeslat_ZadostISSPPK

Vytvorit_Etapu
    Etapa.Vytvorit_Etapu

Fiktivni_Tabelarni_TUDU
    Etapa.Fiktivni_Tabelarni_TUDU

Pridani_TUDU
    Etapa.Pridani_TUDU

Predani_Etapy
    Etapa.Predani_Etapy
    Kontrola_Predane_Etapy
