local utils = {}

utils.hex = function(number)
    return string.format("%02X", number)
end

utils.get_partial_block = function(number)
    if number >= 0.875 then
        return "▉"
    elseif number >= 0.75 then
        return "▊"
    elseif number >= 0.625 then
        return "▋"
    elseif number >= 0.5 then
        return "▌"
    elseif number >= 0.375 then
        return "▍"
    elseif number >= 0.25 then
        return "▎"
    elseif number >= 0.125 then
        return "▏"
    else
        return ""
    end
end

utils.get_bar = function(value, max_value, max_width)
    -- get value of one block
    local block_value = max_value / max_width
    -- get amount of full blocks
    local bar = string.rep("█", math.floor(value / block_value))
    return bar
        .. utils.get_partial_block(
            value / block_value - math.floor(value / block_value)
        )
end

return utils