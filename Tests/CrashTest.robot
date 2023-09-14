*** Settings ***
Library    SeleniumLibrary
*** Variables ***

*** Test Cases ***
Browser check
    open browser    https://www.seznam.cz/      chrome          #options=add_experimental_option("detach", True);add_extension('${EXECDIR}\\AutomatizaceTestu\\ChromeExtension\\SelectorsHubExtension.crx')
    #Řešení pro: Element not interactable: [object HTMLDivElement] has no size and location -> add_experimental_option('excludeSwitches', ['enable-logging'])
    sleep    1
    Maximize browser
    close browser
    LOG TO CONSOLE    Browser Check OK
