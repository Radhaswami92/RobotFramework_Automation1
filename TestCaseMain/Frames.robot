*** Settings ***

Library    SeleniumLibrary


*** Variables ***

${url}  https://jqueryui.com/droppable/
${browser}  chrome
${Heading}      xpath://div[1]/div[@id='content']/p[1]



*** Test Cases ***

Switch To Frames
    open browser   ${url}   ${browser}
    maximize browser window
    ${Text}     get text    ${Heading}
    log to console      ${Text}

    ${TagCount}     get element count    tag:iframe
    log to console    ${TagCount}

    run keyword if    ${TagCount} == 1       select frame    tag:iframe
    ${FrameElementText}    get text    xpath://div[@id='draggable']/p
    log to console  ${FrameElementText}
            #${Text2}     get text    ${Heading} #This will not be able to grab the text from the main frame. we have to unselect
            #log to console      ${Text2} #It will not Pront out for the above reason

    unselect frame
    #${Text2}     get text    ${Heading}
    #log to console      ${Text2}

    close browser


*** Keywords ***
