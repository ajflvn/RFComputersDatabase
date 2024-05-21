*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${NEW_NAME_INPUT}               id:name
${NEW_INTRODUCED_INPUT}         id:introduced
${NEW_DISCONTINUED_INPUT}       id:discontinued
${NEW_COMPANY_SELECT}           id:company
${NEW_CREATE_THIS_COMPUTER}     default:Create this computer
${NEW_SUCCESS_MSG_XPATH}        xpath://*[@id="main"]/div[1]
${NEW_ERROR_MSG}                Failed to refine type : Predicate isEmpty() did not fail.


*** Keywords ***
Fill "Computer Name"
    [Arguments]    ${value}
    Input Text    ${NEW_NAME_INPUT}    ${value}

Fill "Introduced Date"
    [Arguments]    ${value}
    Input Text    ${NEW_INTRODUCED_INPUT}    ${value}

Fill "Discontinued Date"
    [Arguments]    ${value}
    Input Text    ${NEW_DISCONTINUED_INPUT}    ${value}

Select "Company"
    [Arguments]    ${value}
    Select From List By Label    ${NEW_COMPANY_SELECT}    ${value}

Create This Computer
    Click Button    ${NEW_CREATE_THIS_COMPUTER}

Verify Error Message While Creating
    Wait Until Page Contains    ${NEW_ERROR_MSG}

Verify Success Message While Creating ${name}
    Element Text Should Be    ${NEW_SUCCESS_MSG_XPATH}    Done ! Computer ${name} has been created
