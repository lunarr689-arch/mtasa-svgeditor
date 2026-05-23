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
    showChat(false)
end 