--[[
    @Author: Maciej "bover." Grzymkowski
    Zacznijmy wymagać więcej ~ Xyrusek

    Kontakt mailowo: biznes.bover@gmail.com
    Kontakt discord: bover.
]]--

local logoTexture = dxCreateTexture('files/textures/logo.png', 'argb', true, 'clamp')
local urlTextWidth = dxGetTextWidth('https://github.com/boversoneg/mtasa-svgeditor | ', 1, 'default')

function renderViewbox()
    if (not cache.settings) then return false end 

    dxDrawRectangle(0, 0, sx, sy, tocolor(cache.settings.viewboxColor[1], cache.settings.viewboxColor[2], cache.settings.viewboxColor[3], 255))
    dxDrawImage(10/zoom, sy - 64/zoom - 10/zoom, 64/zoom, 64/zoom, logoTexture, 0, 0, 0, tocolor(255, 255, 255, 150))
    dxDrawText('https://github.com/boversoneg/mtasa-svgeditor | ', sx - urlTextWidth - 70/zoom, sy - 15/zoom, nil, nil, tocolor(255, 255, 255, 150), 1, 'default')

    renderToolbox()
end 

function createViewbox()
    toggleHUDComponents(false)
    applySettings()

    addEventHandler('onClientRender', root, renderViewbox)
    showCursor(true)
end 
addEventHandler('onClientResourceStart', resourceRoot, createViewbox)