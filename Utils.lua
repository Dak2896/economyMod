function has_value(tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end

    return false
end

function tLen(T)
    local count = 0
    if T ~= nil then
        for _ in pairs(T) do
            count = count + 1
        end
        return count
    end
    return 0
end

function tprint(tbl, indent)
    print("\n=======================")
    if not tbl then
        print("Nil table")
        return
    end
    if not indent then
        indent = 0
    end
    for k, v in pairs(tbl) do
        formatting = string.rep("  ", indent) .. k .. ": "
        if type(v) == "table" then
            print(formatting)
            tprint(v, indent + 1)
        elseif type(v) == 'boolean' then
            print(formatting .. tostring(v))
        else
            print(formatting .. v)
        end
    end
    print("=======================")
end

function getAllEarnings(tbl)
    if not tbl then
        print("Nil table")
        return
    end
    for k, v in pairs(tbl) do
        if type(v) == "table" then
           getAllEarnings(v)
        else
            if k == "earning" then
               earning = earning + v
            end
        end
    end
    return earning
end


function getEarnings(tb1)
    earning = 0
    getAllEarnings(tb1, 0)
    return earning
end

