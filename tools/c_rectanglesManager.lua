-- @ Author: kotev_exe | 487874362477772809
-- @ Description: This source code is open source.
-- @ Zacznijmy wymagać więcej ~ Xyrusek

function createRoundedRectangle(w, h)
    assert(type(w) == 'number', "Bad argument @ 'createRoundedRectangle' [expected number at argument 1, got "..type(w).."]")
    assert(type(h) == 'number', "Bad argument @ 'createRoundedRectangle' [expected number at argument 2, got "..type(h).."]")

    local rawCode = [[
        <svg width="%f" height="%f" fill="none">
            <rect x="0" y="0" width="%f" height="%f" rx="0" fill="#FFFFFF" stroke="#FFFFFF"/>
        </svg>
    ]]

    local formattedCode = string.format(rawCode, w, h, w, h)
    local svg = svgCreate(w, h, formattedCode)

    return svg
end