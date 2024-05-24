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
    # This option stops a certain warning from being logged to console
    # (DevTools listening ...) on chromium based browsers
    ${option}    Set Variable If    '${browser}' in ['chrome']
    ...    add_experimental_option("excludeSwitches", ["enable-logging"])
    ...    '${browser}'=='edge'
    ...    add_argument("--remote-debugging-pipe"); add_argument("--disable-gpu"); add_argument("enable-features=NetworkServiceInProcess"); add_argument("disable-features=NetworkService"); add_argument("user-data-dir=C:\\fakeUserData"); add_argument("--disable-blink-features=AutomationControlled"); add_experimental_option("excludeSwitches", ["enable-automation"])
    ...    ${None}
    Log    ${option}
    # This argument service_log_path=${{os.path.devnull}} stops firefox
    # from creating a new geckodriver service log file every time
    Open Browser    ${WEB_URL}    ${browser}
    ...    options=${option}    service_log_path=${{os.path.devnull}}
    Title Should Be    ${WEB_TITLE}
    Maximize Browser Window
