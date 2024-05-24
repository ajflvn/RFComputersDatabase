*** Settings ***
Documentation       Archivo para variables y palabras clave comunes

Library             SeleniumLibrary
...                     timeout=10 seconds
...                     run_on_failure=Capture Page Screenshot
...                     screenshot_root_directory=${EXECDIR}/Failure Screenshots
Resource            PO/Home.resource
Resource            PO/New.resource


*** Variables ***
${WEB_TITLE}                         Computers database
${WEB_URL}                           https://computer-database.gatling.io/computers/
# Aunque WEB_BROWSER es firefox por defecto, se espera que se proporcione un
# valor a la variable en el comando de ejecucion (--variable WEB_BROWSER:X)
${WEB_BROWSER}                       firefox

*** Keywords ***
Begin Web Test
    [Documentation]    Prepara el navegador recibido por argumento para los
    ...    tests. Concretamente, se comprueba la validez del argumento, se
    ...    preparan las opciones pertinentes, se abre el navegador a la URL,
    ...    se comprueba el titulo y se maximiza la ventana
    [Arguments]    ${browser}
    Should Be True    '${browser}' in ['chrome', 'firefox', 'edge']
    Open Browser    ${WEB_URL}    ${browser}
    Title Should Be    ${WEB_TITLE}
    Maximize Browser Window
