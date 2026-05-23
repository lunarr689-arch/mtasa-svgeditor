--[[
    @Author: Maciej "bover." Grzymkowski
    Zacznijmy wymagać więcej ~ Xyrusek

    Kontakt mailowo: biznes.bover@gmail.com
    Kontakt discord: bover.
]]--

local logoTexture = dxCreateTexture('files/textures/logo.png', 'argb', true, 'clamp')
local urlTextWidth = dxGetTextWidth('https://github.com/boversoneg/mtasa-svgeditor | ', 1, 'default')
local draggableTools = { rectangle = true }

local function isMouseInToolbox()
    if (not cache.toolboxWidth or not cache.toolboxHeight) then return false end

    local toolboxX, toolboxY = sx/2-(cache.toolboxWidth / 2), 10/zoom
    return isMouseInPosition(toolboxX, toolboxY, cache.toolboxWidth, cache.toolboxHeight)
end

function renderViewbox()
    if (not cache.settings) then return false end 

    dxDrawRectangle(0, 0, sx, sy, tocolor(cache.settings.viewboxColor[1], cache.settings.viewboxColor[2], cache.settings.viewboxColor[3], 255))
    dxDrawImage(10/zoom, sy - 64/zoom - 10/zoom, 64/zoom, 64/zoom, logoTexture, 0, 0, 0, tocolor(255, 255, 255, 150))
    dxDrawText('https://github.com/boversoneg/mtasa-svgeditor | ', sx - urlTextWidth - 70/zoom, sy - 15/zoom, nil, nil, tocolor(255, 255, 255, 150), 1, 'default')
    
    renderLayers()
    renderToolbox()


    -- This is not PERFECT! Its a little buggy and still needs a little work, but overall its a good start.
    if ((getKeyState('mouse1')) and (not cache.dragStartPosition)) then
        if (not draggableTools[cache.currentTool]) then return false end
        
        local cx, cy = getCursorPosition()
        cache.dragStartPosition = { x = cx * sx, y = cy * sy }
    elseif ((getKeyState('mouse1')) and (cache.dragStartPosition)) then
        if (not draggableTools[cache.currentTool]) then return false end
        local cx, cy = getCursorPosition()
        local x, y = cx * sx, cy * sy

        local px = math.min(cache.dragStartPosition.x, x)
        local py = math.min(cache.dragStartPosition.y, y)
        local w, h = math.abs(cache.dragStartPosition.x - x), math.abs(cache.dragStartPosition.y - y)

        renderPreviewLayer(cache.currentTool, px, py, w, h)
    elseif ((not getKeyState('mouse1')) and (cache.dragStartPosition)) then
        if (not draggableTools[cache.currentTool]) then return false end
        
        local cx, cy = getCursorPosition()
        cache.dragEndPosition = { x = cx * sx, y = cy * sy }
        
        local x = math.min(cache.dragStartPosition.x, cache.dragEndPosition.x)
        local y = math.min(cache.dragStartPosition.y, cache.dragEndPosition.y)
        local w, h = math.abs(cache.dragStartPosition.x - cache.dragEndPosition.x), math.abs(cache.dragStartPosition.y - cache.dragEndPosition.y)
        if (w == 0) then
            w = 100
        end

        if (h == 0) then
            h = 100
        end
        
        createLayer(cache.currentTool, tonumber(x), tonumber(y), tonumber(w), tonumber(h), {
            svg = createRoundedRectangle(tonumber(w), tonumber(h))
        })

        cache.dragStartPosition = nil
        cache.dragEndPosition = nil
    end
end

function createViewbox()
    toggleHUDComponents(false)
    applySettings()

    addEventHandler('onClientRender', root, renderViewbox)
    showCursor(true)
end 
addEventHandler('onClientResourceStart', resourceRoot, createViewbox)
