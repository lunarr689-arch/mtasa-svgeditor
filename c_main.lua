--[[
    @Author: Maciej "bover." Grzymkowski
    Zacznijmy wymagać więcej ~ Xyrusek

    Kontakt mailowo: biznes.bover@gmail.com
    Kontakt discord: bover.
]]--

sx, sy = guiGetScreenSize()
zoom = 1920/sx
zoom = math.min(zoom, 1.3)

cache = {};

function toggleHUDComponents(state)
    setPlayerHudComponentVisible('all', state)
    showChat(state)
end 

function IsMouseIn(x, y, w, h)
    if (not isCursorShowing()) then return false end

    local cursorX, cursorY = getCursorPosition()
    cursorX, cursorY = cursorX * sx, cursorY * sy

    return (cursorX >= x and cursorX <= x + w) and (cursorY >= y and cursorY <= y + h)
end