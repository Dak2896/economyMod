playedFactions = {}


function addFaction(faction)
    print(faction)
    table.insert(playedFactions, faction)
    tprint(playedFactions)
end

function clearFactions() 
    playedFactions = {}
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