*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${HOME_RESULTS}             xpath://*[@id="main"]/h1
${HOME_FILTER_INPUT}        id:searchbox
${HOME_FILTER_BUTTON}       id:searchsubmit
${HOME_ADD_NEW}             id:add
${HOME_FIRST_RESULT}        xpath://*[@id="main"]/table/tbody/tr[1]
${HOME_PREV_PAGE_LINK}      xpath://*[@id="pagination"]/ul/li[1]/a
${HOME_NEXT_PAGE_LINK}      xpath://*[@id="pagination"]/ul/li[3]/a
${HOME_COLUMNS}             ['Computer name', 'Introduced', 'Discontinued', 'Company']


*** Keywords ***
First Result ${column_name} Should Be ${value}
    VAR    ${column_idx}    ${{ ${HOME_COLUMNS}.index('${column_name}') + 1 }}
    Element Text Should Be    ${HOME_FIRST_RESULT}/td[${column_idx}]    ${value}

Filter By Name
    [Arguments]    ${filter_text}
    Input Text    ${HOME_FILTER_INPUT}    ${filter_text}
    Click Button    ${HOME_FILTER_BUTTON}

There Should Be ${results_amount} Results
    Element Text Should Be    ${HOME_RESULTS}    ${results_amount} computers found

Go To Next Page
    Click Link    ${HOME_NEXT_PAGE_LINK}

Go To Add New Computer
    Click Link    ${HOME_ADD_NEW}
