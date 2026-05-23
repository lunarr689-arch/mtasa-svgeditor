--[[
    @Author: Maciej "bover." Grzymkowski
    Zacznijmy wymagać więcej ~ Xyrusek

    Kontakt mailowo: biznes.bover@gmail.com
    Kontakt discord: bover.
]]--

function applyDefaultSettings()
    cache.settings = {
        viewboxColor = { 30, 30, 30 },
        toolboxItemGap = 15/zoom,
        selectedTool = 'cursor',
    }
end 

function applySettings()
    applyDefaultSettings()

    local isFile = fileExists('settings.json')
    if (not isFile) then return false end 

    local file = fileOpen('settings.json')
    local content = fileRead(file, fileGetSize(file))
    fileClose(file)

    local settings = fromJSON(content)
    if (not settings) then return false end

    for settingKey, settingValue in pairs(settings) do
        cache.settings[settingKey] = settingValue
    end

    return true 
end 

function saveSetting(settingKey, settingValue)
    cache.settings[settingKey] = settingValue

    local isFile = fileExists('settings.json')
    local file = (isFile and fileOpen('settings.json') or fileCreate('settings.json'))

    local content = toJSON(cache.settings)
    fileWrite(file, content)
    fileClose(file)

    return true 
end