cache.elements = {};

function createNewElement(type, x, y, w, h, color, data)
    local id = findFreeId()
    cache.elements[id] = {x = x, y = y, w = w, h = h, color = color, data = data};
    return id
end

function findFreeId()
    local id = 0;
    while cache.elements[id] do
        id = id + 1
    end
    return id
end

function destroyElement(id)
    cache.elements[id] = nil
end

function updateValue(id, value, newValue)
    cache.elements[id][value] = newValue
end