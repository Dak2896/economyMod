economyStructureBuild = {}

function clearStructures() 
    economyStructureBuild = {}
end

function addEconomyStructure(structure, faction)
    local factionName = faction:getFactionName()

    -- first we check if key exist, key is the name of faction or we create it
    if economyStructureBuild[factionName] == nil then
        economyStructureBuild[factionName] = {
            ["structures"] = {}
        }
    else
    end


    -- final stage we add strucutre to the table
    if tLen(economyStructureBuild[factionName]["structures"]) == 0 then
        table.insert(economyStructureBuild[factionName]["structures"], structure)
    else
        table.insert(economyStructureBuild[factionName]["structures"], structure)
    end
end

function getStructuresIncome(faction)
    local factionName = faction:getFactionName()
    print("calculate stuff for: "..factionName)

    if economyStructureBuild[factionName] ~= nil then
        if economyStructureBuild[factionName]["structures"] ~= nil then

            local table = economyStructureBuild[factionName]["structures"]
            tprint(table)
            local earningTotalFromStructures = getEarnings(table)

            print("from my structure i will earn: " ..earningTotalFromStructures)
            faction.money = faction.money + earningTotalFromStructures
        end

    end
end