*** Settings ***
Documentation       Ejercicios de automatizacion de frontal con Robot Framework
...                 - Para probar todos los navegadores, ejecutar ``run-tests.bat``
Metadata            Author    Alberto Florido

Resource            ../Resources/ComputersDatabaseWeb.resource

Test Setup          Begin Web Test    ${WEB_BROWSER}
Test Teardown       Close All Browsers


*** Variables ***
#    --- Test 1 ---
${T1_FIRST_NAME}                    ACE
#    --- Test 2 ---
${T2_NAME}                          ASCI White
${T2_INTRODUCED}                    01 Jan 2001
${T2_DISCONTINUED}                  01 Jan 2006
${T2_COMPANY}                       IBM
#    --- Test 3 ---
${T3_FILTER_TEXT}                   ASCI
${T3_FILTER_EXPECTED_RESULTS}       6
#    --- Test 5 ---
${T5_NAME}                          VAXMate
${T5_INTRODUCED}                    1986-01-01
${T5_DISCONTINUED}                  1989-01-01
${T5_COMPANY}                       Digital Equipment Corporation


*** Test Cases ***
First Name Should be ${T1_FIRST_NAME}
    [Documentation]    Cargar la página y verificar que el primer valor del
    ...    campo _Computer name_ de la lista es ${T1_FIRST_NAME}
    [Tags]    1
    First Result Computer name Should Be ${T1_FIRST_NAME}

Next Page Has Specific First Row Values
    [Documentation]    Cargar la página, darle a Next, para ir a la página 2 y
    ...    verificar que el primer valor del campo _Computer Name_ de la lista
    ...    es ASCI White, _Introduced_=01/01/2001, _Discontinued_=01/01/2006 y
    ...    _Company_=IBM
    [Tags]    2
    Go To Next Page
    First Result Computer name Should Be ${T2_NAME}
    First Result Introduced Should Be ${T2_INTRODUCED}
    First Result Discontinued Should Be ${T2_DISCONTINUED}
    First Result Company Should Be ${T2_COMPANY}

Filter By Name "${T3_FILTER_TEXT}" Should Show ${T3_FILTER_EXPECTED_RESULTS} Results
    [Documentation]    Cargar la página, introducir ${T3_FILTER_TEXT} en el campo
    ...    de filtro y darle al botón _Filter by Name_. Verificar que el
    ...    resultado obtenido es ${T3_FILTER_EXPECTED_RESULTS}
    [Tags]    3
    Filter By Name    ${T3_FILTER_TEXT}
    There Should Be ${T3_FILTER_EXPECTED_RESULTS} Results

Create New Computer With Empty Data Should Fail
    [Documentation]    Cargar la página y darle al botón _Add a new computer_.
    ...    Darle al botón _Create this computer_. Verificar que sale un mensaje
    ...    de error _Failed to refine type : Predicate isEmpty() did not fail_
    [Tags]    4
    Go To Add New Computer
    Create This Computer
    Verify Error Message While Creating

Create New Computer With Valid Data Should Work
    [Documentation]    Cargar la página y darle al botón _Add a new computer_.
    ...    Completar valores del formulario (nombre, introduced, discontinued,
    ...    company). Darle al botón _Create this computer_. Verificar que sale
    ...    un mensaje de EXITO _Done ! Computer xxxxx has been created_
    [Tags]    5
    Go To Add New Computer
    Fill "Computer Name"    ${T5_NAME}
    Fill "Introduced Date"    ${T5_INTRODUCED}
    Fill "Discontinued Date"    ${T5_DISCONTINUED}
    Select "Company"    ${T5_COMPANY}
    Create This Computer
    Verify Success Message While Creating ${T5_NAME}
