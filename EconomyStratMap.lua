-- THIS CLASS REPRESNT IN GAME STRAT MAP ECONOMY STRUCUTRE
-- ECONOMY STRUCTURES CAN BE CREATED BY MERCHANT BY SELECTING THEM, OPEN THE DESCRIPTION PANEL
-- DESCRIPTION TABLE
local DESCRIPTION = {
    ["MARKET"] = "A market increase trade in the region",
    ["GRANARY"] = "Base store for food",
    ["FARM"] = "A farm provide food, increase prosperty of region",
    ["FISHERY"] = "Catch fishes"
}

-- COST TABLE
local COST_TABLE = {
    ["MARKET"] = 3000,
    ["GRANARY"] = 2500,
    ["FARM"] = 1500,
    ["FISHERY"] = 1000
}

-- EARNING TABLE
local EARNINGS = {
    ["MARKET"] = 350,
    ["GRANARY"] = 240,
    ["FARM"] = 80,
    ["FISHERY"] = 80
}

function formatEarings(earning)
    return "+ " .. earning .. " turn"
end

-- Meta classes 
-- Coordinates in the map 
local MapCords = {
    x = 0,
    y = 0
}

-- Generic class represent a structure no earning add of structure build
local EconomyStructure = {
    localized_label = "", -- visualized name on GUI/UI
    level = 0, -- level of structure from 0 to 10 each level give more earnings
    model_path = "", --  model path
    model_ID = O -- id of the model for save it in memory
}

function EconomyStructure.new(localized_label, level, model_path, model_ID, x, y)
    local self = setmetatable({}, EconomyStructure)

    self.localized_label = localized_label or ""
    self.level = level or 0
    self.model_path = model_path or ""
    self.model_ID = model_ID or ""
    self.x = x or 0
    self.y = y or 0
    return self
end

-- variable to control the opening of mechant panel on agent onCharacterSelected
showMerchantIcon = false


-- if we have under selection a merchant we can then do stuff on map like build structures.
merchatForBuildStructure = nil


-- DEFINE EACH SPECIFIC STRUCTURE EARNINGS FORM EARNING TABLE
MARKET = EconomyStructure.new("Market", 1, "", 1)
MARKET.earning = EARNINGS["MARKET"]
MARKET.description = DESCRIPTION["MARKET"]
MARKET.cost = COST_TABLE["Market"]

FISHERY = EconomyStructure.new("Fishery", 1, "", 2)
FISHERY.earning = EARNINGS["FISHERY"]
FISHERY.description = DESCRIPTION["FISHERY"]
FISHERY.cost = COST_TABLE["FISHERY"]

GRANARY = EconomyStructure.new("Granary", 1, "", 3)
GRANARY.earning = EARNINGS["GRANARY"]
GRANARY.description = DESCRIPTION["GRANARY"]
GRANARY.cost = COST_TABLE["GRANARY"]

FARM = EconomyStructure.new("Farm", 1, "4", 3)
FARM.earning = EARNINGS["FARM"]
FARM.description = DESCRIPTION["FARM"]
FARM.cost = COST_TABLE["FARM"]


