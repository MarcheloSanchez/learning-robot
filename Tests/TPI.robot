*** Settings ***
Library  SeleniumLibrary
Variables    ../Resources/Variables.py
Variables    ../Resources/Configurations.py
Resource    ../Resources/CommonKeywords.robot
Resource    ../Resources/SearchKeywords.robot
Resource    ../Resources/TPIApp.robot

#Název souboru předělat - TPI_Počin
#Test Setup  Begin Web Test
#Test Teardown   End Web Test
#Testy jsou rozdělené procesně podle každé role - Prozatím se testuje na Admin účtu
*** Variables ***

*** Test Cases ***

Pocin
     [Documentation]    Správce - Založení a vyplnění počinu(I zakreslení polygonu), fáze počinu, dokumentace, statistické skupiny a následné Vytvoření a předání počinu
#    Otázkou je co se má ještě testovat kromě pozitivního průchodu procesem. Co se zde NEtestuje: TUDU, nepovinné položky pro Fázi a Dokumentaci, předchůdce a následovník.
    Login
    Zalozit_pocin
    TPIApp.Vyplnit_Pocin
    TPIApp.Zakreslit_Polygon
    TPIApp.Zalozit_a_Vyplnit_Fazi_Pocin
    TPIApp.Zalozit_a_Vyplnit_Dokumentaci
    TPIApp.Zalozit_a_Vyplnit_Statistickou_Skupinu
    TPIApp.Ulozit_a_zavrit_fazi_pocinu
    TPIApp.Predat_Pocin


Etapa
    Login
    SearchKeywords.Open_pocin
    TPIApp.Prijmout_Etapu
    TPIApp.Zalozit_Etapu
    TPIApp.Vyplnit_Etapu
    TPIApp.Zalozit_ZadostISSPPK
    TPIApp.Odeslat_ZadostISSPPK
    TPIApp.Vytvorit_Etapu
    SearchKeywords.Open_etapu
    TPIApp.Fiktivni_Tabelarni_TUDU
    SearchKeywords.Open_etapu
    TPIApp.Pridani_TUDU
    TPIApp.Predani_Etapy
    SearchKeywords.Open_etapu
    TPIApp.Kontrola_Predane_Etapy

#---------Z TestEtapa postup----------------
#    login
#    open_pocin
#    open_etapu
#    Prijmout_etapu
#    Zalozit_etapu
#    Fill_in_etapa
#    Fill_in_zalozky
####    Fill_in_etapu_nepovinne
###    #Vytvořit etapu
#    click button    xpath://button[contains(text(),'Vytvořit etapu')]
#    loadingbike
#    #Kontrola, že je etapa Rozpracovaná
##    #DO IT?
#    open_etapu
#    Fiktivne_TUDU
#    open_etapu
#    Add_TUDU
#    Predat_etapu
#    open_etapu
#    Kontrola_predane_etapy

*** Keywords ***



