---Basic M2TWEOP table
---@class M2TWEOP
M2TWEOP = { 

}

---Function to return the path to the mod folder, starts from the drive not the game folder.
---@return string mod path
function M2TWEOP.getModPath() end 

---Save the game.
---@param path string (start from mods)
function M2TWEOP.saveGame(path) end 

---Function to get the game version.
---@return integer gamever (1 = disk 2 = steam)
function M2TWEOP.getGameVersion() end 

---Function to return the path to the plugin (location of your LUA files).
---@return string plugin path
function M2TWEOP.getPluginPath() end 

---Load d3d texture
---@param path string full path to texture
---@return integer x size of the image
---@return integer y size of the image
---@return integer id of the image
function M2TWEOP.loadTexture(path) end 

---Unload d3d texture
---@param id integer of the image
function M2TWEOP.unloadTexture(id) end 

---Sets the limit of ancillaries per character on the stratmap.
---@param newLimit integer default: 8, maximum: 127
function M2TWEOP.setAncillariesLimit(newLimit) end 

---Unlocks all console commands, also allows the use of the 'control' command to change factions in singleplayer campaigns.
function M2TWEOP.unlockGameConsoleCommands() end 

---Sets the maximum amount of soldiers a general's bodyguard unit can replenish to.
---@param newSize integer default: 77, maximum: 255 (Huge unit size).
function M2TWEOP.setMaxBgSize(newSize) end 

---Toggle the highlighting of units on the tactical map.
function M2TWEOP.toggleUnitsBMapHighlight() end 

---Set the maximum number of religions in the mod (per descr\_religions.txt)
---@param newLimit integer maximum: 127
function M2TWEOP.setReligionsLimit(newLimit) end 

---Checks if a tile is free.
---@param X integer coordinate of the tile.
---@param Y integer coordinate of the tile.
function M2TWEOP.isTileFree(X, Y) end 

---Get the selected tile coords.
---@return integer x 
---@return integer y 
function M2TWEOP.getGameTileCoordsWithCursor() end 

---Get the RegionID of a tile.
---@param x integer 
---@param y integer 
---@return integer regionID 
function M2TWEOP.getTileRegionID(x, y) end 

---Get the owner of a region by RegionID.
---@param regionID integer 
---@return factionStruct owner 
function M2TWEOP.getRegionOwner(regionID) end 

---Sets the new maximum soldier count.
---@param minSize integer maximum: 300
---@param maxSize integer maximum: 300
function M2TWEOP.setEDUUnitsSize(minSize, maxSize) end 

---Basic gameSTDUI table
---@class gameSTDUI
gameSTDUI = { 

}

---Get a game UI element, element must be opened.
---@param elementName string 
---@return uiElementStruct element 
function gameSTDUI.getUiElement(elementName) end 

---Basic uiElementStruct table
---@class uiElementStruct
uiElementStruct = { 

    ---@type string
    elementName = nil,

    ---@type integer
    xSize = nil,

    ---@type integer
    ySize = nil,

    ---@type integer
    xPos = nil,

    ---@type integer
    yPos = nil,

    ---@type integer
    subElementsNum = nil,

}

---Get a subelement of an UI element using the index.
---@param index integer Starts from 0.
---@return uiElementStruct subelement 
function uiElementStruct.getSubElement(index) end 

---execute standard game UI element, use only for buttons
function uiElementStruct:execute() end 

---Basic stratmap.objects table
---@class stratmap.objects
stratmap.objects = { 

}

---Add a new .cas campaign strategy model to the game with a unique ID. This should be called during onPluginLoad()
---@param path string Relative path from the modfolder (starting with "data/").
---@param modelId integer Unique ID to use the model later.
function stratmap.objects.addModelToGame(path, modelId) end 

---Add a new .cas character strategy model to the game with a unique name. Only add it after loading to campaign map!
---@param skeleton string name of skeleton used.
---@param caspath string Relative path from the mods folder (starting with "mods/").
---@param shadowcaspath string Relative path from the mods folder (starting with "mods/").
---@param typename string Name of the new model used to assign.
---@param texturepath string Relative path from the mods folder (starting with "mods/").
function stratmap.objects.addCharacterCas(skeleton, caspath, shadowcaspath, typename, texturepath) end 

---Set the strategy model for object at specified coordinates, works only for supported object types
---@param xCoord integer 
---@param yCoord integer 
---@param modelId integer used for: watchtower, resource, settlement, fort, port
---@param modelId2 integer used for: fort wall (use fort coords), dock (use port coords)
function stratmap.objects.setModel(xCoord, yCoord, modelId, modelId2) end 

---Replace a custom tile. Change the custom battlefield on the specified coordinates.
---@param label string Identifier.
---@param xCoord integer X coordinate of tile.
---@param yCoord integer Y coordinate of tile.
---@param filename string Just the name, not full path (.wfc)
---@param weather string Weather on the battle map.
---@param dayTime string Time of day.
function stratmap.objects.replaceTile(label, xCoord, yCoord, filename, weather, dayTime) end 

---Start drawing .cas campaign strategy model with a unique ID in some coords. Can be used at any time.
---@param modelId integer Unique ID
---@param x integer 
---@param y integer 
---@param sizeMultiplier integer 1 is value with what it draw as same size as game objects
function stratmap.objects.startDrawModelAt(modelId, x, y, sizeMultiplier) end 

---Stop drawing .cas campaign strategy model with a unique ID. Can be used at any time.
---@param modelId integer Unique ID
function stratmap.objects.stopDrawModel(modelId) end 

---Basic stratmap.camera table
---@class stratmap.camera
stratmap.camera = { 

}

---Slowly move the camera to the specified tile.
---@param xCoord integer 
---@param yCoord integer 
function stratmap.camera.move(xCoord, yCoord) end 

---Quickly move the camera to the specified tile.
---@param xCoord integer 
---@param yCoord integer 
function stratmap.camera.jump(xCoord, yCoord) end 

---Set the zoom level of the camera.
---@param distance number 
function stratmap.camera.zoom(distance) end 

---Basic stratmap.game table
---@class stratmap.game
stratmap.game = { 

}

---Get the amount of factions
---@return integer facNumber Amount of factions
function stratmap.game.getFactionsCount() end 

---Get a faction by the index, commonly used when iterating over all factions using getFactionsCount()
---@param Index integer of the faction.
---@return factionStruct faction 
function stratmap.game.getFaction(Index) end 

---Create a new character at the specified coordinates.
---@param type string Character type, for example "named character".
---@param Faction factionStruct the new character belongs to.
---@param age integer The character's age
---@param name string The short name of the character.
---@param name2 string The full name of the character.
---@param subFaction integer Set to 31 to disable.
---@param portrait_custom string cannot be nil Name of the folder inside 'data/ui/custom_portraits folder. Can not be nil!
---@param xCoord integer X coordinate of the new character
---@param yCoord integer Y coordinate of the new character
---@return character newCharacter Returns a character class, not a named character class!
function stratmap.game.createCharacterByString(type, Faction, age, name, name2, subFaction, portrait_custom, xCoord, yCoord) end 

---Create an army for a character. Commonly used after spawning a new character to set it's bodyguard unit.
---@param ourGeneral character Character class, not named character class!
---@return stackStruct army 
function stratmap.game.createArmy(ourGeneral) end 

---Create an army in a settlement (don't need a character). Used to add units to an empty settlement.
---@param settlement settlementStruct 
---@return stackStruct army 
function stratmap.game.createArmyInSettlement(settlement) end 

---Get a script counter value, works for counters and for event\_counters
---@param counterName string The name of the counter
---@return boolean isExist Returns true if the counter exists i.e it has been used at least once in any way in the campaign\_script
---@return integer counterValue Returns the value of the counter
function stratmap.game.getScriptCounter(counterName) end 

---Set an event\_counter value, does not work for counters, only event\_counters.
---@param counterName string 
---@param value integer 
function stratmap.game.setScriptCounter(counterName, value) end 

---Fire a game event message. Picture needs to be provided in the ui folders as default.
---@param eventName string 
---@param title string 
---@param body string 
function stratmap.game.historicEvent(eventName, title, body) end 

---Fire any script command available from the game. It is always just 2 parameters in the function, the command name and all the arguments as 1 string in the second parameter. Do not use inc_counter, set_counter, declare_counter! they crash!
---@param command string 
---@param args string 
function stratmap.game.scriptCommand(command, args) end 

---Execute a Medieval II console command.
---@return string error Note: string can be empty but not nil
function stratmap.game.callConsole() end 

---Basic stratmap table
---@class stratmap
stratmap = { 

    ---@type objects
    objects = nil,

    ---@type camera
    camera = nil,

    ---@type game
    game = nil,

}

---Unit table
---@class unit
unit = { 

    ---@type eduEntry
    eduEntry = nil,

    ---@type number
    movePoints = nil,

    ---soldiers count. You can change it on stratmap and soldiers updated. Use @{setParams} if you need change several parameters at once.
    ---@type integer
    soldierCountStratMap = nil,

    ---soldiers expierence. You can change it on stratmap and soldiers updated. Use @{setParams} if you need change several parameters at once.
    ---@type integer
    exp = nil,

    ---soldiers armour. You can change it on stratmap and soldiers updated. Use @{setParams} if you need change several parameters at once.
    ---@type integer
    armourLVL = nil,

    ---soldiers weapon. You can change it on stratmap and soldiers updated. Use @{setParams} if you need change several parameters at once.
    ---@type integer
    weaponLVL = nil,

    ---Read only
    ---@type integer
    soldierCountStratMapMax = nil,

    ---Read only
    ---@type integer
    soldierCountBattleMap = nil,

    ---@type character
    character = nil,

    ---@type stackStruct
    army = nil,

    ---@type string
    alias = nil,

}

---Kill this unit
function unit:kill() end 

---change soldierCountStratMap, exp, armourLVL, weaponLVL at one time. Set unit basic parameters
---@param exp integer Experience. Maximum: 9
---@param armor integer Armour level.
---@param weapon integer Weapon Upgrade. Maximum: 1
function unit:setParams(exp, armor, weapon) end 

---Basic eduEntry table
---@class eduEntry
eduEntry = { 

    ---- Get only
    ---@type string
    Type = nil,

    ---- Get only
    ---@type string
    Soldier = nil,

    ---- Get only
    ---@type string
    UnitCardTga = nil,

    ---- Get only
    ---@type string
    InfoCardTga = nil,

    ---- Get only
    ---@type integer
    Index = nil,

    ---- Get only
    ---@type integer
    UnitCreatedCounter = nil,

    ---@type integer
    SoldierCount = nil,

    ---@type number
    Mass = nil,

    ---@type number
    Width = nil,

    ---@type number
    Height = nil,

    ---@type boolean
    haveAttributeLegio = nil,

    ---@type number
    MoveSpeedMod = nil,

    ---@type number
    UnitSpacingFrontToBackClose = nil,

    ---@type number
    UnitSpacingSideToSideClose = nil,

    ---@type number
    UnitSpacingFrontToBackLoose = nil,

    ---@type number
    UnitSpacingSideToSideLoose = nil,

    ---@type integer
    StatHealth = nil,

    ---@type integer
    StatHealthAnimal = nil,

    ---@type integer
    StatHeat = nil,

    ---@type integer
    StatGround1 = nil,

    ---@type integer
    StatGround2 = nil,

    ---@type integer
    StatGround3 = nil,

    ---@type integer
    StatGround4 = nil,

    ---@type integer
    StatCost1 = nil,

    ---@type integer
    StatCost2 = nil,

    ---@type integer
    StatCost3 = nil,

    ---@type integer
    StatCost4 = nil,

    ---@type integer
    StatCost5 = nil,

    ---@type integer
    StatCost6 = nil,

    ---@type integer
    StatCost7 = nil,

    ---@type integer
    StatCost8 = nil,

    ---@type integer
    Morale = nil,

    ---@type integer
    MoraleLocked = nil,

    ---@type integer
    StatFood1 = nil,

    ---@type integer
    StatFood2 = nil,

    ---@type integer
    Ammunition = nil,

}

---characters as they exist on the strategy map - dead characters, wives, children, and off-map characters do not have these fields.
---@class character
character = { 

    ---@type integer
    xCoord = nil,

    ---@type integer
    yCoord = nil,

    ---@type namedCharacter
    namedCharacter = nil,

    ---@type unit
    bodyguards = nil,

    ---@type stackStruct
    armyLeaded = nil,

    ---in the stack but not leading it
    ---@type stackStruct
    armyNotLeaded = nil,

    ---@type number
    movePointsMax = nil,

    ---@type number
    movePointsModifier = nil,

    ---@type number
    movePoints = nil,

    ---see descr\_hero\_abilities.xml
    ---@type string
    ability = nil,

}

---Get the character type. See hint below for the types. 0-spy 1-assassin 2-diplomat 3-admiral 4-merchant 5-priest 6-general 7-named character 8-princess 9-heretic 10-witch 11-inquisitor 13-pope
---@return integer typeId 
function character:getTypeID() end 

---Set the character type. See hint below for the types. 0-spy 1-assassin 2-diplomat 3-admiral 4-merchant 5-priest 6-general 7-named character 8-princess 9-heretic 10-witch 11-inquisitor 13-pope
---@param typeId integer 
function character:setTypeID(typeId) end 

---Issue regular move command, character must have movement points.
---@param xCoord integer 
---@param yCoord integer 
function character:moveToTile(xCoord, yCoord) end 

---Instantly teleport character to the coordinates.
---@param xCoord integer 
---@param yCoord integer 
function character:reposition(xCoord, yCoord) end 

---Delete this character
function character:kill() end 

---Create a fort at the character's coordinates
function character:createFort() end 

---Set bodyguard. Do this only for characters without it, such as immediately after creating a character.
---@param unit unit 
function character:setBodyguardUnit(unit) end 

---Set a character's model to a new one.
---@param model string 
function character:setCharacterModel(model) end 

---Basic namedCharacter table. All named characters have these fields including dead characters, wives, children, and off-map characters.
---@class namedCharacter
namedCharacter = { 

    ---@type integer
    index = nil,

    ---@type character
    character = nil,

    ---Internal name.
    ---@type string
    shortName = nil,

    ---Internal name including surname.
    ---@type string
    fullName = nil,

    ---Display name, resets upon reloading a save.
    ---@type string
    localizedDisplayName = nil,

    ---@type string
    label = nil,

    ---Wives (who have never been princesses) and children do not have anything for this field. Path to 'young' portrait used starting from 'mods' folder. Resets upon reloading a save.
    ---@type string
    portrait = nil,

    ---Wives (who have never been princesses) and children do not have anything for this field. Path to 'old' portrait used starting from 'mods' folder. Resets upon reloading a save.
    ---@type string
    portrait2 = nil,

    ---Wives (who have never been princesses) and children do not have anything for this field. Folder name in ui/custom_portraits folder.
    ---@type string
    portrait_custom = nil,

    ---Battle model (needs battle_models.modeldb entry).
    ---@type string
    modelName = nil,

    ---5-leader,2 - heir, 0 - ordinary character, read only, do not set value
    ---@type integer
    status = nil,

    ---@type boolean
    isMale = nil,

    ---@type integer
    age = nil,

    ---For example with 4 turns per year, the yearOfBirth could be 1840.25
    ---@type number
    yearOfBirth = nil,

    ---@type factionStruct
    faction = nil,

    ---@type integer
    subFaction = nil,

    ---@type namedCharacter
    parent = nil,

    ---@type namedCharacter
    spouse = nil,

    ---example: ourChar.childs[2].fullName
    ---@type namedCharacter[4]
    childs = nil,

    ---@type integer
    ancNum = nil,

    ---@type integer
    level = nil,

    ---@type integer
    authority = nil,

    ---@type integer
    command = nil,

    ---positive = Chivalry, negative = Dread
    ---@type integer
    chivalryAndDread = nil,

    ---@type integer
    loyalty = nil,

    ---@type integer
    piety = nil,

    ---@type integer
    ambush = nil,

    ---@type integer
    artilleryCommand = nil,

    ---@type integer
    assassination = nil,

    ---@type integer
    attack = nil,

    ---@type integer
    battleSurgery = nil,

    ---@type integer
    bodyguardSize = nil,

    ---@type integer
    bodyguardValour = nil,

    ---@type integer
    boldness = nil,

    ---@type integer
    bribeResistance = nil,

    ---@type integer
    bribery = nil,

    ---@type integer
    cavalryCommand = nil,

    ---@type integer
    charm = nil,

    ---@type integer
    construction = nil,

    ---@type integer
    defence = nil,

    ---@type integer
    disposition = nil,

    ---@type integer
    electability = nil,

    ---@type integer
    eligibility = nil,

    ---@type integer
    farming = nil,

    ---@type integer
    fertility = nil,

    ---@type integer
    finance = nil,

    ---@type integer
    footInTheDoor = nil,

    ---@type integer
    generosity = nil,

    ---@type integer
    gunpowerCommand = nil,

    ---@type integer
    health = nil,

    ---@type integer
    heresyImmunity = nil,

    ---@type integer
    hitpoints = nil,

    ---@type integer
    infantryCommand = nil,

    ---@type integer
    influence = nil,

    ---@type integer
    law = nil,

    ---@type integer
    lineOfSight = nil,

    ---@type integer
    localPopularity = nil,

    ---@type integer
    looting = nil,

    ---@type integer
    magic = nil,

    ---@type integer
    management = nil,

    ---@type integer
    mining = nil,

    ---@type integer
    movementPointsBonus = nil,

    ---@type integer
    navalCommand = nil,

    ---@type integer
    nightBattle = nil,

    ---@type integer
    personalSecurity = nil,

    ---@type integer
    publicSecurity = nil,

    ---@type integer
    purity = nil,

    ---@type integer
    sabotage = nil,

    ---@type integer
    siegeAttack = nil,

    ---@type integer
    siegeDefense = nil,

    ---@type integer
    siegeEngineering = nil,

    ---@type integer
    squalor = nil,

    ---@type integer
    subterfuge = nil,

    ---@type integer
    taxCollection = nil,

    ---@type integer
    trading = nil,

    ---@type integer
    trainingAgents = nil,

    ---@type integer
    trainingAnimalUnits = nil,

    ---@type integer
    trainingUnits = nil,

    ---@type integer
    troopMorale = nil,

    ---@type integer
    unorthodoxy = nil,

    ---@type integer
    unrest = nil,

    ---@type integer
    violence = nil,

}

---Sets the named character as the faction heir.
---@param onlyHeir boolean True = this character will be the only heir, false = add another heir (faction can appear to have multiple heirs but only one will become leader).
function namedCharacter:setAsHeir(onlyHeir) end 

---Checks if character is alive, read only, do not set this value.
---@return integer liveStatus true = alive, false = dead
function namedCharacter:isAlive() end 

---Get the pointer to the character's traits container.
---@return traitContainer The character's traits.
function namedCharacter:getTraits() end 

---Add a trait to the character.
---@param traitName string Trait's internal name per export\_descr\_character\_traits.txt
---@param traitLevel integer Trait's level.
function namedCharacter:addTrait(traitName, traitLevel) end 

---Remove a trait from the character.
---@param traitName string Trait's internal name per export\_descr\_character\_traits.txt
function namedCharacter:removeTrait(traitName) end 

---Get the pointer to the ancillary using it's index. You can iterate over a character's ancillaries for example by going from index 0 to ancNum - 1.
---@param index integer 
---@return ancillary ancillary 
function namedCharacter:getAncillary(index) end 

---Add an ancillary to the named character using the name per export\_descr\_ancillaries.txt.
---@param ancillaryName string 
function namedCharacter:addAncillary(ancillaryName) end 

---Remove an ancillary from the named character using it's pointer. Use getAncillary function to get the specific ancillary.
---@param ancillary ancillary 
function namedCharacter:removeAncillary(ancillary) end 

---Basic ancillary table
---@class ancillary
ancillary = { 

    ---@type integer
    index = nil,

    ---@type string
    name = nil,

    ---@type string
    imagePath = nil,

}

---Basic traits table
---@class traitContainer
traitContainer = { 

    ---@type integer
    level = nil,

    ---@type string
    name = nil,

    ---@type traitContainer
    nextTrait = nil,

    ---@type traitContainer
    prevTrait = nil,

}

---Basic factionStruct table
---@class factionStruct
factionStruct = { 

    ---@type integer
    dipNum = nil,

    ---@type integer
    cultureID = nil,

    ---@type string
    ai_label = nil,

    ---@type string
    name = nil,

    ---@type string
    localizedName = nil,

    ---@type settlementStruct
    capital = nil,

    ---@type namedCharacter
    leader = nil,

    ---@type namedCharacter
    heir = nil,

    ---0=AI, 1=player
    ---@type integer
    isPlayerControlled = nil,

    ---@type integer
    religion = nil,

    ---@type integer
    money = nil,

    ---@type integer
    kingsPurse = nil,

    ---@type factionStratMapStruct
    facStrat = nil,

    ---includes literally all characters without distinction (so also wives, children, dead and those sent off map)
    ---@type integer
    numOfNamedCharacters = nil,

    ---includes all the characters present on the strat map
    ---@type integer
    numOfCharacters = nil,

    ---@type integer
    stacksNum = nil,

    ---@type integer
    settlementsNum = nil,

    ---@type integer
    fortsNum = nil,

    ---@type integer
    portsNum = nil,

    ---@type integer
    watchtowersNum = nil,

    ---@type changeFactionName
    changeFactionName = nil,

}

---Get the faction's internal name
---@return string facName 
function factionStruct:getFactionName() end 

---Get named character using it's index.
---@param number integer 
---@return namedCharacter retNamedCharacter 
function factionStruct:getNamedCharacter(number) end 

---Get a character using it's index.
---@param number integer 
---@return character retCharacter 
function factionStruct:getCharacter(number) end 

---Get an army using it's index.
---@param number integer 
---@return stackStruct army 
function factionStruct:getStack(number) end 

---Get a settlement using it's index.
---@param number integer 
---@return settlementStruct settlement 
function factionStruct:getSettlement(number) end 

---Get a fort using it's index.
---@param number integer 
---@return fortStruct fort 
function factionStruct:getFort(number) end 

---Get a port using it's index.
---@param number integer 
---@return portStruct port 
function factionStruct:getPort(number) end 

---Get a watchtower using it's index.
---@param number integer 
---@return watchtowerStruct watchtower 
function factionStruct:getWatchtower(number) end 

---Delete a specific fort.
---@param fort fortStruct 
function factionStruct:deleteFort(fort) end 

---Create a fort at the specified coordinates.
---@param X integer 
---@param Y integer 
function factionStruct:createFortXY(X, Y) end 

---Basic factionStratMapStruct table
---@class factionStratMapStruct
factionStratMapStruct = { 

    ---Warning: resets on reload.
    ---@type integer
    primaryColorRed = nil,

    ---Warning: resets on reload.
    ---@type integer
    primaryColorGreen = nil,

    ---Warning: resets on reload.
    ---@type integer
    primaryColorBlue = nil,

    ---Warning: resets on reload.
    ---@type integer
    secondaryColorRed = nil,

    ---Warning: resets on reload.
    ---@type integer
    secondaryColorGreen = nil,

    ---Warning: resets on reload.
    ---@type integer
    secondaryColorBlue = nil,

    ---Usage unknown.
    ---@type integer
    triumphValue = nil,

    ---Warning: resets on reload.
    ---@type integer
    standardIndex = nil,

    ---Warning: resets on reload.
    ---@type integer
    logoIndex = nil,

    ---Warning: resets on reload.
    ---@type integer
    smallLogoIndex = nil,

}

---Basic watchtowerStruct table
---@class watchtowerStruct
watchtowerStruct = { 

    ---@type integer
    xCoord = nil,

    ---@type integer
    yCoord = nil,

}

---Basic fortStruct table
---@class fortStruct
fortStruct = { 

    ---@type integer
    xCoord = nil,

    ---@type integer
    yCoord = nil,

    ---@type character
    governor = nil,

    ---@type stackStruct
    army = nil,

    ---@type factionStruct
    ownerFaction = nil,

    ---@type siegeStruct
    siege = nil,

}

---Basic portStruct table
---@class portStruct
portStruct = { 

    ---land tile, Note: setting this only moves port's strat model.
    ---@type integer
    xCoord = nil,

    ---land tile, Note: setting this only moves port's strat model.
    ---@type integer
    yCoord = nil,

    ---Note: port's ownership changes to blockading faction (army on port)
    ---@type factionStruct
    ownerFaction = nil,

    ---@type settlementStruct
    settlement = nil,

    ---Character standing on the port tile, only the first one, check for nil.
    ---@type character
    character = nil,

    ---Enemy army blockading the port, by standing on it's tile, check for nil.
    ---@type stackStruct
    blockadingArmy = nil,

    ---water tile, only upgraded ports have this, check for nil.
    ---@type dockStruct
    Dock = nil,

}

---Basic dockStruct table
---@class dockStruct
dockStruct = { 

    ---water tile, Note: setting only moves dock strat model
    ---@type integer
    xCoord = nil,

    ---water tile, Note: setting only moves dock strat model
    ---@type integer
    yCoord = nil,

}

---Basic settlementStruct table
---@class settlementStruct
settlementStruct = { 

    ---@type integer
    xCoord = nil,

    ---@type integer
    yCoord = nil,

    ---@type character
    governor = nil,

    ---@type stackStruct
    army = nil,

    ---internal name of settlement
    ---@type string
    name = nil,

    ---@type string
    localizedName = nil,

    ---@type factionStruct
    ownerFaction = nil,

    ---@type integer
    fac_creatorNum = nil,

    ---@type integer
    regionNumber = nil,

    ---@type integer
    level = nil,

    ---@type integer
    isCastle = nil,

    ---@type integer
    isProvokedRebellion = nil,

    ---@type integer
    populationSize = nil,

    ---- Get only
    ---@type integer
    PopGrowthBaseFarm = nil,

    ---- Get only
    ---@type integer
    PopGrowthFarms = nil,

    ---- Get only
    ---@type integer
    PopGrowthHealth = nil,

    ---- Get only
    ---@type integer
    PopGrowthBuildings = nil,

    ---- Get only
    ---@type integer
    PopGrowthTaxBonus = nil,

    ---- Get only
    ---@type integer
    PopGrowthEntertainment = nil,

    ---- Get only
    ---@type integer
    PopGrowthTrade = nil,

    ---- Get only
    ---@type integer
    PopGrowthGovernorInfluence = nil,

    ---- Get only
    ---@type integer
    PopGrowthSqualor = nil,

    ---- Get only
    ---@type integer
    PopGrowthPlague = nil,

    ---- Get only
    ---@type integer
    PopGrowthTaxPenalty = nil,

    ---- Get only
    ---@type integer
    PublicOrderGarrison = nil,

    ---- Get only
    ---@type integer
    PublicOrderLaw = nil,

    ---- Get only
    ---@type integer
    PublicOrderBuildingsEntertainment = nil,

    ---- Get only
    ---@type integer
    PublicOrderGovernorInfluence = nil,

    ---- Get only
    ---@type integer
    PublicOrderTaxBonus = nil,

    ---- Get only
    ---@type integer
    PublicOrderTriumph = nil,

    ---- Get only
    ---@type integer
    PublicOrderPopulationBoom = nil,

    ---- Get only
    ---@type integer
    PublicOrderEntertainment = nil,

    ---- Get only
    ---@type integer
    PublicOrderHealth = nil,

    ---- Get only
    ---@type integer
    PublicOrderGarrisonTwo = nil,

    ---- Get only
    ---@type integer
    PublicOrderFear = nil,

    ---- Get only
    ---@type integer
    PublicOrderGlory = nil,

    ---- Get only
    ---@type integer
    PublicOrderSqualor = nil,

    ---- Get only
    ---@type integer
    PublicOrderDistanceToCapital = nil,

    ---- Get only
    ---@type integer
    PublicOrderNoGovernance = nil,

    ---- Get only
    ---@type integer
    PublicOrderTaxPenalty = nil,

    ---- Get only
    ---@type integer
    PublicOrderUnrest = nil,

    ---- Get only
    ---@type integer
    PublicOrderBesieged = nil,

    ---- Get only
    ---@type integer
    PublicOrderBlockaded = nil,

    ---- Get only
    ---@type integer
    PublicOrderCulturalUnrest = nil,

    ---- Get only
    ---@type integer
    PublicOrderExcommunication = nil,

    ---- Get only
    ---@type integer
    PublicOrder = nil,

    ---- Get only
    ---@type integer
    FarmsIncome = nil,

    ---- Get only
    ---@type integer
    TaxesIncome = nil,

    ---- Get only
    ---@type integer
    MiningIncome = nil,

    ---- Get only
    ---@type integer
    TradeIncome = nil,

    ---- Get only
    ---@type integer
    DiplomaticIncome = nil,

    ---- Get only
    ---@type integer
    DemolitionIncome = nil,

    ---- Get only
    ---@type integer
    LootingIncome = nil,

    ---- Get only
    ---@type integer
    BuildingsIncome = nil,

    ---- Get only
    ---@type integer
    AdminIncome = nil,

    ---- Get only
    ---@type integer
    ConstructionExpense = nil,

    ---- Get only
    ---@type integer
    RecruitmentExpense = nil,

    ---- Get only
    ---@type integer
    DiplomaticExpense = nil,

    ---- Get only
    ---@type integer
    CorruptionExpense = nil,

    ---- Get only
    ---@type integer
    EntertainmentExpense = nil,

    ---- Get only
    ---@type integer
    DevastationExpense = nil,

    ---- Get only
    ---@type integer
    TotalIncomeWithoutAdmin = nil,

    ---@type integer
    buildingsNum = nil,

    ---@type buildingsQueue
    buildingsQueue = nil,

    ---@type integer
    resourcesNum = nil,

    ---@type integer
    siegesNum = nil,

}

---Change owner faction of settlement. All agents, armies etc. leave the settlement.
---@param newOwner factionStruct Faction to change ownership to.
function settlementStruct:changeOwner(newOwner) end 

---Get the settlement's specific regligion's value
---@param religionID integer In order of descr\_religions.txt, starting from 0
---@return number religionValue from 0 to 1
function settlementStruct:getReligion(religionID) end 

---Set the settlement's specific religion's value, make sure the sum of all religion values does not exceed 1.0!
---@param religionID integer in order of descr\_religions.txt, starting from 0
---@param religionValue number from 0 to 1
function settlementStruct:setReligion(religionID, religionValue) end 

---Get a settlement's standing points with a specific guild by ID
---@param guild_id integer 
function settlementStruct:getGuildStanding(guild_id) end 

---Set the settlement's standing points with specific guild.
---@param guild_id integer 
---@param standing integer 
function settlementStruct:setGuildStanding(guild_id, standing) end 

---Get a specific building by it's index.
---@param number integer 
---@return building build 
function settlementStruct:getBuilding(number) end 

---Create a building in the settlement.
---@param building_level_id string 
function settlementStruct:createBuilding(building_level_id) end 

---Destroy a building of a specified type in the settlement.
---@param typeName string Type of building.
---@param isReturnMoney boolean Should money be returned to the faction like with a manual desctruction.
function settlementStruct:destroyBuilding(typeName, isReturnMoney) end 

---Get a specific resource by it's index.
---@param number integer 
---@return tradeResource resource 
function settlementStruct:getResource(number) end 

---Get a specific siege by it's index
---@param siegeIdx integer 
---@return siegeStruct siege 
function settlementStruct:getSiege(siegeIdx) end 

---Basic building table
---@class building
building = { 

    ---@type integer
    level = nil,

    ---@type integer
    hp = nil,

    ---@type settlementStruct
    settlement = nil,

    ---@type edbEntry
    edbEntry = nil,

}

---Get the name of the building type (the building chain in export\_descr\_buildings.txt).
---@return string buildingType (building chain name)
function building:getType() end 

---Get name of building level (as per export\_descr\_buildings.txt).
---@return string buildingName 
function building:getName() end 

---Basic buildingsQueue table
---@class buildingsQueue
buildingsQueue = { 

    ---position in queue of building currently under construction, usually 1
    ---@type integer
    currentlyBuilding = nil,

    ---maximum is 6
    ---@type integer
    numBuildingsInQueue = nil,

}

---by position in queue (1-6) Get building in queue by position
---@param position integer 
---@return buildingInQueue buildingInQueue 
function buildingsQueue:getBuildingInQueue(position) end 

---Basic buildingInQueue table
---@class buildingInQueue
buildingInQueue = { 

    ---Is nil if building doesn't exist yet.
    ---@type building
    building = nil,

    ---@type settlementStruct
    settlement = nil,

    ---@type integer
    currentLevel = nil,

    ---@type integer
    previousLevel = nil,

    ---@type integer
    buildCost = nil,

    ---@type integer
    buildTurnsPassed = nil,

    ---@type integer
    buildTurnsRemaining = nil,

    ---@type integer
    percentBuilt = nil,

}

---Get name of building in queue type (chain)
---@return string buildingType (building chain name)
function buildingInQueue:getQueueBuildingType() end 

---Get name of building in queue level
---@return string buildingName 
function buildingInQueue:getQueueBuildingName() end 

---Basic guild table
---@class guild
guild = { 

    ---@type string
    name = nil,

    ---@type integer
    id = nil,

    ---@type integer
    level1 = nil,

    ---@type integer
    level2 = nil,

    ---@type integer
    level3 = nil,

}

---Basic tradeResource table
---@class tradeResource
tradeResource = { 

    ---@type integer
    xCoord = nil,

    ---@type integer
    yCoord = nil,

    ---@type settlementStruct
    settlement = nil,

}

---Set the resource's strat model.
---@param modelId integer Added with stratmap.objects.addModelToGame
function tradeResource:setStratModel(modelId) end 

---Get the resource's ID.
---@return integer ID 
function tradeResource:getResourceID() end 

---Get the resource's trade value.
---@return integer value 
function tradeResource:getResourceValue() end 

---Check if the resource has a mine.
---@return integer hasMine 0=no mine, 1=mine
function tradeResource:getResourceHasMine() end 

---Get the resource's image (icon) relative path.
---@return string imagePath 
function tradeResource:getResourceImage() end 

---Basic stackStruct table
---@class stackStruct
stackStruct = { 

    ---@type factionStruct
    faction = nil,

    ---@type integer
    numOfUnits = nil,

    ---Includes Auxiliary generals and agents (i.e all characters excluding the leading general)
    ---@type integer
    numOfCharacters = nil,

    ---army embarked on this fleet stack
    ---@type stackStruct
    boardedArmy = nil,

    ---fleet that this army stack is embarked on
    ---@type stackStruct
    shipArmy = nil,

    ---@type portStruct
    blockedPort = nil,

    ---Returns nil if stack is inside residence (fleet, settlement, fort).
    ---@type character
    leader = nil,

    ---@type integer
    totalStrength = nil,

    ---X coordinate to which the retreating units will go.
    ---@type number
    reform_point_x = nil,

    ---Y coordinate to which the retreating units will go.
    ---@type number
    reform_point_y = nil,

    ---Current siege.
    ---@type siegeStruct
    siege = nil,

}

---Get a unit by it's index.
---@param number integer 
---@return unit retUnit 
function stackStruct:getUnit(number) end 

---Get a character (agent or non-leading named character) by it's index.
---@param number integer 
---@return character retCharacter 
function stackStruct:getCharacter(number) end 

---Find the settlement in which the army is located. Returns nil if the army is not in a settlement.  Returns nil if the army is not in the settlement.
---@return settlementStruct settlement 
function stackStruct:findInSettlement() end 

---Find the fort in which the army is located. Returns nil if the army is not in a fort.  Returns nil if the army is not in the fort.
---@return fortStruct fort 
function stackStruct:findInFort() end 

---Create a unit in the army by index from M2TWEOP units DB (M2TWEOPDU).
---@param index integer 
---@param exp integer 
---@param armor integer 
---@param weapon integer 
---@return unit newUnit 
function stackStruct:createEOPUnit(index, exp, armor, weapon) end 

---Create a unit in the army by type from export\_descr\_unit.txt
---@param type string 
---@param exp integer Experience. Maximum: 9.
---@param armor integer Armour level.
---@param weapon integer Weapon upgrade. Maximum: 1.
---@return unit newUnit 
function stackStruct:createUnit(type, exp, armor, weapon) end 

---Merge 2 armies on the strat map.
---@param targetArmy stackStruct 
function stackStruct:mergeArmies(targetArmy) end 

---Create a unit in the army by index from export\_descr\_unit.txt
---@param index integer Index (order in export\_descr\_unit.txt)
---@param exp integer Experience. Maximum: 9.
---@param armor integer Armour level.
---@param weapon integer Weapon upgrade. Maximum: 1.
---@return unit newUnit 
function stackStruct:createUnitByIDX(index, exp, armor, weapon) end 

---Call it twice to initiate an assault. Besiege the specified settlement, or attack it if already besieging it. Requires movement points.
---@param settlement settlementStruct 
function stackStruct:siegeSettlement(settlement) end 

---Attack another army. Requires movement points.
---@param defender stackStruct 
---@return integer Success 
function stackStruct:attackArmy(defender) end 

---Basic siegeStruct table
---@class siegeStruct
siegeStruct = { 

    ---@type stackStruct
    besieger = nil,

    ---@type settlementStruct
    besiegedSettlement = nil,

    ---@type fortStruct
    besiegedFort = nil,

}

---Enum with a list of types of diplomatic relations.
---@class dipRelType
dipRelType = { 

    ---@type integer
    war = nil,

    ---@type integer
    peace = nil,

    ---@type integer
    alliance = nil,

    ---@type integer
    suzerain = nil,

    ---(Doesn't work with trade rights agreements set at game start)
    ---@type integer
    trade = nil,

}

---Basic campaign table.
---@class gameDataAll.campaignStruct
gameDataAll.campaignStruct = { 

    ---Table of factionStruct[31], indexing starts at 1.
    ---@type factionStruct[31]
    factionsSortedByDescrStrat = nil,

    ---@type integer
    numberOfFactions = nil,

    ---Number of player-controlled factions.
    ---@type integer
    numberHumanFactions = nil,

    ---Faction whose turn it is at the moment, can be set.
    ---@type factionStruct
    currentFaction = nil,

    ---@type integer
    passedTurnsNum = nil,

    ---Factor for number of turns per year, see descr\_strat.txt
    ---@type number
    timescale = nil,

    ---@type settlementStruct
    romeSettlement = nil,

    ---@type settlementStruct
    constantinopleSettlement = nil,

    ---Lower values increase spawn rate.
    ---@type number
    BrigandSpawnValue = nil,

    ---Lower values increase spawn rate.
    ---@type number
    PirateSpawnValue = nil,

    ---Number of units who get free upkeep in forts.
    ---@type integer
    FreeUpkeepForts = nil,

    ---@type number
    currentDate = nil,

    ---season (0=summer, 1=winter)
    ---@type integer
    currentseason = nil,

    ---@type number
    startDate = nil,

    ---season (0=summer, 1=winter)
    ---@type integer
    startSeason = nil,

    ---@type number
    endDate = nil,

    ---season (0=summer, 1=winter)
    ---@type integer
    endSeason = nil,

    ---@type integer
    daysInBattle = nil,

    ---24 max, so calculate as daysInBattle*24+currentTimeInBattle.
    ---@type number
    currentTimeInBattle = nil,

}

---Check if a diplomatic relation between two factions.
---@param checkType dipRelType Example: dipRelType.war
---@param fac1 factionStruct A faction.
---@param fac2 factionStruct Another faction.
---@return boolean checkResult 
function gameDataAll.campaignStruct:checkDipStance(checkType, fac1, fac2) end 

---Set a diplomatic relation between two factions.
---@param relType dipRelType Example: dipRelType.war
---@param fac1 factionStruct A faction.
---@param fac2 factionStruct Another faction.
function gameDataAll.campaignStruct:setDipStance(relType, fac1, fac2) end 

---Get size of unit(i.e. small or medium, etc). Numbers from 0 to 3
---@return integer unitSize 
function gameDataAll.campaignStruct:GetUnitSize() end 

---Basic strat map table.
---@class gameDataAll.stratMap
gameDataAll.stratMap = { 

    ---@type integer
    mapWidth = nil,

    ---@type integer
    mapHeight = nil,

    ---@type integer
    regionsNum = nil,

}

---Get a specific region by index.
---@param index integer 
---@return region region 
function gameDataAll.stratMap.getRegion(index) end 

---Get a specific tile by it's coordinates.
---@param x integer 
---@param y integer 
---@return tileStruct tile 
function gameDataAll.stratMap.getTile(x, y) end 

---Basic tile table, not everything very known and understood yet, you can research with these fields.
---@class tileStruct
tileStruct = { 

    ---(1 = land, 0 = sea)
    ---@type integer
    isLand = nil,

    ---@type integer
    groundType = nil,

    ---@type integer
    regionID = nil,

    ---(Doesn't work if tile is river).
    ---@type integer
    factionID = nil,

    ---Not 0 means bordering settlement.
    ---@type integer
    borderingSettlement = nil,

    ---Not 0 means it has a road.
    ---@type integer
    hasRoad = nil,

    ---Not 0 means it is on border of region.
    ---@type integer
    border = nil,

}

---Basic region table.
---@class region
region = { 

    ---@type string
    regionName = nil,

    ---@type string
    localizedName = nil,

    ---@type string
    settlementName = nil,

    ---@type string
    legioName = nil,

    ---@type integer
    regionID = nil,

    ---@type integer
    stacksNum = nil,

    ---@type integer
    fortsNum = nil,

    ---@type integer
    watchtowersNum = nil,

    ---@type integer
    isSea = nil,

    ---(fully enclosed by region)
    ---@type integer
    hasLake = nil,

    ---@type mercPool
    mercPool = nil,

    ---@type settlementStruct
    settlement = nil,

    ---@type integer
    tileCount = nil,

    ---@type integer
    neighbourRegionsNum = nil,

    ---@type integer
    resourcesNum = nil,

    ---(bitmap with 32 first hidden resources), needs to be converted to binary and then use bitwise operators from lua.
    ---@type integer
    hiddenResources1 = nil,

    ---(bitmap last 32 first hidden resources), needs to be converted to binary and then use bitwise operators from lua.
    ---@type integer
    hiddenResources2 = nil,

    ---@type integer
    settlementXCoord = nil,

    ---@type integer
    settlementYCoord = nil,

    ---@type integer
    portEntranceXCoord = nil,

    ---@type integer
    portEntranceYCoord = nil,

    ---@type factionStruct
    faction = nil,

    ---@type string
    rebelType = nil,

    ---@type string
    localizedRebelsName = nil,

    ---@type integer
    triumphValue = nil,

}

---Get an army by it's index.
---@param index integer 
---@return stackStruct army 
function region:getStack(index) end 

---Get a fort by it's index.
---@param index integer 
---@return fortStruct fort 
function region:getFort(index) end 

---Get a watchtower by it's index.
---@param index integer 
---@return watchtowerStruct watchtower 
function region:getWatchtower(index) end 

---Get a resource by it's index.
---@param index integer 
---@return tradeResource resource 
function region:getResource(index) end 

---Get a neighbour region by it's index.
---@param index integer 
---@return region nRegion 
function region:getNeighbour(index) end 

---Check if a region has a hidden resource.
---@param index integer 
---@return boolean hr 
function region:getHiddenResource(index) end 

---Set a region's hidden resource (reset on game restart).
---@param index integer 
---@param enable boolean 
function region:setHiddenResource(index, enable) end 

---Basic mercenary pool table.
---@class mercPool
mercPool = { 

    ---@type string
    name = nil,

}

---Get amount of mercenary units a region has.
---@return integer mercUnitNum 
function mercPool:getMercUnitNum() end 

---Add a new mercenary unit to a pool.
---@param idx integer EDU index, supports EOP units.
---@param exp integer Starting experience.
---@param cost integer 
---@param repmin number Minimum replenishment rate.
---@param repmax number Maximum replenishment rate.
---@param maxunits integer Maximum Pool.
---@param startpool number Starting pool.
---@param startyear integer (0 to disable) Use 0 if the startyear is before the year you introduce the merc, not an earlier startyear!
---@param endyear integer (0 to disable)
---@param crusading integer 
---@return mercPoolUnit mercunit 
function mercPool:addMercUnit(idx, exp, cost, repmin, repmax, maxunits, startpool, startyear, endyear, crusading) end 

---Get a mercenary unit from a pool by index.
---@param idx integer 
---@return mercPoolUnit mercUnit 
function mercPool:getMercUnit(idx) end 

---Basic mercenary unit table.
---@class mercPoolUnit
mercPoolUnit = { 

    ---@type EduEntry
    eduEntry = nil,

    ---@type integer
    experience = nil,

    ---@type integer
    cost = nil,

    ---@type number
    replenishMin = nil,

    ---@type number
    replenishMax = nil,

    ---@type integer
    maxUnits = nil,

    ---@type number
    currentPool = nil,

    ---@type integer
    startYear = nil,

    ---@type integer
    endYear = nil,

    ---@type integer
    crusading = nil,

    ---@type integer
    poolIndex = nil,

    ---@type integer
    mercPoolUnitIndex = nil,

    ---@type mercPool
    mercPool = nil,

}

---Set or remove a religion requirement for a mercenary unit.
---@param religion integer 
---@param set boolean True means enable this religion requirement, False means disable.
function mercPoolUnit:setMercReligion(religion, set) end 

---Basic gameDataAll table
---@class gameDataAll
gameDataAll = { 

    ---battle data
    ---@type battleStruct
    battleStruct = nil,

    ---campaign data
    ---@type campaignStruct
    campaignStruct = nil,

}

---Call at the start of the script, this is a static object and the pointer to it doesn't change.
---@return gameDataAllStruct gameDataAll 
function gameDataAll.get() end 

---basic battleStruct table
---@class gameDataAll.battleStruct
gameDataAll.battleStruct = { 

    ---@type integer
    battleState = nil,

    ---@type integer
    battleType = nil,

    ---@type integer
    isNightBattle = nil,

    ---@type integer
    xCoord = nil,

    ---@type integer
    yCoord = nil,

    ---@type integer
    attackerXCoord = nil,

    ---@type integer
    attackerYCoord = nil,

    ---@type integer
    defenderXCoord = nil,

    ---@type integer
    defenderYCoord = nil,

    ---@type integer
    paused = nil,

    ---@type number
    battleSpeed = nil,

    ---@type number
    secondsPassed = nil,

    ---Returns a battleSide[8]. Maximum: 8.
    ---@type integer
    sidesNum = nil,

    ---@type battleSide[8]
    sides = nil,

    ---alliance array, -1 if not in battle
    ---@type factionSide[31]
    faction = nil,

}

---Basic battleSide table
---@class battleStruct.battleSide
battleStruct.battleSide = { 

    ---@type boolean
    isDefender = nil,

    ---@type boolean
    isCanDeploy = nil,

    ---0 = lose, 1 = draw, 2 = win
    ---@type integer
    wonBattle = nil,

    ---0 = close, 1 = average, 2 = clear, 3 = crushing
    ---@type integer
    battleSuccess = nil,

    ---Returns an int index of a wincondition.
    ---@type int[4]
    winConditions = nil,

    ---@type integer
    armiesNum = nil,

    ---@type integer
    alliance = nil,

    ---@type integer
    soldierCount = nil,

    ---@type integer
    totalStrenght = nil,

    ---@type battleAI
    battleAIPlan = nil,

    ---a table of trackedPointerArmy. Maximum: 8.
    ---@type trackedPointerArmy[8]
    Returns = nil,

}

---Get win condition string, for example: destroy\_or\_rout_enemy
---@param condition integer 
---@return string winCondition destroy\_or\_rout\_enemy, balance\_of\_strength\_percent, destroy\_enemy\_strength\_percent, capture\_location, destroy\_character, capture\_major\_settlement, capture\_army\_settlement, unknown\_condition
function battleStruct.battleSide.getWinConditionString(condition) end 

---Get a battle army by it's index.
---@param side battleSideTable 
---@param index integer 
---@return battleArmy army 
function getBattleArmy(side, index) end 

---Basic trackedPointerArmy table
---@class battleSide.trackedPointerArmy
battleSide.trackedPointerArmy = { 

    ---@type stackStruct
    army = nil,

    ---@type deploymentAreaS
    deploymentArea = nil,

}

---Basic trackedPointerArmy table
---@class trackedPointerArmy.deploymentAreaS
trackedPointerArmy.deploymentAreaS = { 

    ---@type integer
    coordsNum = nil,

}

---Get pair of coords with index.
---@return number xCoord X coordinate of the area.
---@return number yCoord Y coordinate of the area.
function trackedPointerArmy.deploymentAreaS:getCoordPair() end 

---Basic Battle AI table
---@class battleAI
battleAI = { 

    ---@type integer
    gtaPlan = nil,

    ---@type integer
    unitCount = nil,

    ---@type integer
    enemyUnitCount = nil,

}

---Basic battleArmy table
---@class battleArmy
battleArmy = { 

    ---@type stackStruct
    army = nil,

    ---@type character
    character = nil,

    ---@type integer
    generalNumKillsBattle = nil,

    ---@type number
    generalHPRatioLost = nil,

    ---@type number
    battleOdds = nil,

    ---@type integer
    numKilledGenerals = nil,

    ---@type integer
    unitCount = nil,

}

---Get a battle unit by it's index.
---@param army battleArmy 
---@param index integer 
---@return battleUnit unit 
function getBattleUnit(army, index) end 

---Basic battleUnit table
---@class battleUnit
battleUnit = { 

    ---@type unit
    unit = nil,

    ---@type integer
    soldiersLost = nil,

    ---@type integer
    soldiersStart = nil,

    ---@type integer
    unitsRouted = nil,

    ---@type boolean
    hasRouted = nil,

}

---Basic M2TWEOPDU table. Contains descriptions of M2TWEOP unit types.
---@class M2TWEOPDU
M2TWEOPDU = { 

    ---@type getArmourUpgradeModelsNum
    getArmourUpgradeModelsNum = nil,

}

---Create new M2TWEOPDU entry from a file describing it.
---@param filepath string path to file with unit type description(like in export\_descr\_unit.txt, but only with one record and without comments)
---@param eopEnryIndex integer Entry index, which will be assigned to a new record in DU (recommend starting from 1000, so that there is no confusion with records from EDU).
---@return eduEntry retEntry Usually you shouldn't use this value.
function M2TWEOPDU.addEopEduEntryFromFile(filepath, eopEnryIndex) end 

---Create new M2TWEOPDU entry.
---@param baseEnryIndex integer Entry index number, which will be taken as the base for this DU record.
---@param eopEnryIndex integer Entry index, which will be assigned to a new record in DU (recommend starting from 1000, so that there is no confusion with records from EDU).
---@return eduEntry retEntry Usually you shouldn't use this value.
function M2TWEOPDU.addEopEduEntryFromEDUID(baseEnryIndex, eopEnryIndex) end 

---Needed for change many parameters of entry. Get eduEntry of a M2TWEOPDU entry. Needed to change many parameters of the entry.
---@param eopEnryIndex integer Entry index in M2TWEOPDU.
---@return eduEntry retEntry 
function M2TWEOPDU.getEopEduEntryByID(eopEnryIndex) end 

---Get data of a M2TWEOPDU entry. You usually won't need this.
---@param eopEnryIndex integer Entry index in M2TWEOPDU.
---@return eopDuEntry retEntry Usually you shouldn't use this value.
function M2TWEOPDU.getDataEopDu(eopEnryIndex) end 

---Get eduEntry by index. Needed to change many parameters of the entry.
---@param EnryIndex integer Entry index (Values lower then 500 look for edu entry, values over 500 look for EOP edu entry).
---@return eduEntry retEntry 
function M2TWEOPDU.getEduEntry(EnryIndex) end 

---Get eduEntry by edu type name. Needed to change many parameters of the entry.
---@param type string Unit type as in export_descr_unit.
---@return eduEntry retEntry 
function M2TWEOPDU.getEduEntryByType(type) end 

---Get edu index by edu type name. Needed to use many edu functions.
---@param type string Unit type as in export_descr_unit.
---@return integer eduindex 
function M2TWEOPDU.getEduIndexByType(type) end 

---(only for eopdu units added by file!) Set unit card for a M2TWEOPDU entry. Requirements for the location and parameters of the image are unchanged in relation to the game (only for eopdu units added by file!).
---@param eopEnryIndex integer Entry index in M2TWEOPDU.
---@param newCardTga string 
function M2TWEOPDU.setEntryUnitCardTga(eopEnryIndex, newCardTga) end 

---(only for eopdu units added by file!) Set unit info card for M2TWEOPDU entry. Requirements for the location and parameters of the image are unchanged in relation to the game (only for eopdu units added by file!).
---@param eopEnryIndex integer Entry index in M2TWEOPDU.
---@param newInfoCardTga string 
function M2TWEOPDU.setEntryInfoCardTga(eopEnryIndex, newInfoCardTga) end 

---Set unit info card for a M2TWEOPDU entry. Requirements for the location and parameters of the image are unchanged in relation to the game.
---@param eopEnryIndex integer Entry index in M2TWEOPDU.
---@param newSoldierModel string 
function M2TWEOPDU.setEntrySoldierModel(eopEnryIndex, newSoldierModel) end 

---Get the amount of numbers in the armour_upg_levels line in export_descr_unit. Get the amount of models in the armour_upg_models line in export_descr_unit.
---@param index integer Entry index (Values lower then 500 look for edu entry, values over 500 look for EOP edu entry).
---@return integer ArmourUpgradeLevelsNum 
function M2TWEOPDU.getArmourUpgradeLevelsNum(index) end 

---(only for eopdu units added by file!) Set the amount of armour_upg_levels, if you increase the amount of levels the last number entry will be repeated (only for eopdu units added by file!).
---@param index integer Entry index (Values lower then 500 look for edu entry, values over 500 look for EOP edu entry).
---@param amount integer 
function M2TWEOPDU.setArmourUpgradeLevelsNum(index, amount) end 

---Get armour upgrade level number at specified index.
---@param index integer Entry index (Values lower then 500 look for edu entry, values over 500 look for EOP edu entry).
---@param levelidx integer 
---@return integer level 
function M2TWEOPDU.getArmourUpgradeLevel(index, levelidx) end 

---(only for eopdu units added by file!) Set armour upgrade level number at specified index (only for eopdu units added by file!).
---@param index integer Entry index (Values lower then 500 look for edu entry, values over 500 look for EOP edu entry).
---@param levelidx integer 
---@param newlevel integer 
function M2TWEOPDU.setArmourUpgradeLevel(index, levelidx, newlevel) end 

---(only for eopdu units added by file!) Set the amount of armour_upg_levels, if you increase the amount of models the last model entry will be repeated (only for eopdu units added by file!).
---@param index integer Entry index (Values lower then 500 look for edu entry, values over 500 look for EOP edu entry).
---@param amount integer Maximum: 4
function M2TWEOPDU.setArmourUpgradeModelsNum(index, amount) end 

---Get armour upgrade level number at specified index.
---@param index integer Entry index (Values lower then 500 look for edu entry, values over 500 look for EOP edu entry).
---@param levelidx integer 
---@return string modelName 
function M2TWEOPDU.getArmourUpgradeModel(index, levelidx) end 

---(only for eopdu units added by file!) Set the unit model at specified index (only for eopdu units added by file!).
---@param index integer Entry index (Values lower then 500 look for edu entry, values over 500 look for EOP edu entry).
---@param levelidx integer 
---@param modelName string 
function M2TWEOPDU.setArmourUpgradeModel(index, levelidx, modelName) end 

---Set a primary or secondary attack attribute of an edu entry.
---@param index integer Entry index (Values lower then 500 look for edu entry, values over 500 look for EOP edu entry).
---@param attribute integer Use the attackAttr enum: attackAttr.spear, attackAttr.light\_spear, attackAttr.prec, attackAttr.ap, attackAttr.bp, attackAttr.area, attackAttr.fire, attackAttr.launching, attackAttr.thrown, attackAttr.short\_pike, attackAttr.long\_pike, attackAttr.spear\_bonus\_12, attackAttr.spear\_bonus\_10, attackAttr.spear\_bonus\_8, attackAttr.spear\_bonus\_6, attackAttr.spear\_bonus\_4.
---@param enable boolean 
---@param sec integer 1 = primary, 2 = secondary.
function M2TWEOPDU.setEntryAttackAttribute(index, attribute, enable, sec) end 

---Get a primary or secondary attack attribute from an edu entry.
---@param index integer Entry index (Values lower then 500 look for edu entry, values over 500 look for EOP edu entry).
---@param attribute integer Use the attackAttr enum: attackAttr.spear, attackAttr.light\_spear, attackAttr.prec, attackAttr.ap, attackAttr.bp, attackAttr.area, attackAttr.fire, attackAttr.launching, attackAttr.thrown, attackAttr.short\_pike, attackAttr.long\_pike, attackAttr.spear\_bonus\_12, attackAttr.spear\_bonus\_10, attackAttr.spear\_bonus\_8, attackAttr.spear\_bonus\_6, attackAttr.spear\_bonus\_4.
---@param sec integer 1 = primary, 2 = secondary.
---@return boolean hasAttackAttribute 
function M2TWEOPDU.getEntryAttackAttribute(index, attribute, sec) end 

---Set any of the basic unit stats of an edu entry.
---@param index integer Entry index (Values lower then 500 look for edu entry, values over 500 look for EOP edu entry).
---@param eduStat integer Use the eduStat enum: eduStat.armour, eduStat.defense, eduStat.shield, eduStat.attack, eduStat.charge.
---@param value integer 
---@param sec integer 1 = primary, 2 = secondary.
function M2TWEOPDU.setEntryStat(index, eduStat, value, sec) end 

---Get any of the basic unit stats of an edu entry.
---@param index integer Entry index (Values lower then 500 look for edu entry, values over 500 look for EOP edu entry).
---@param eduStat integer Use the eduStat enum: eduStat.armour, eduStat.defense, eduStat.shield, eduStat.attack, eduStat.charge.
---@param sec integer 1 = primary, 2 = secondary.
---@return integer unitStat 
function M2TWEOPDU.getEntryStat(index, eduStat, sec) end 

---Set localized name for a M2TWEOPDU entry. This does not require any entries in the text folder.
---@param eopEnryIndex integer Entry index in M2TWEOPDU.
---@param newLocalizedName string 
function M2TWEOPDU.setEntryLocalizedName(eopEnryIndex, newLocalizedName) end 

---Set localized description for M2TWEOPDU entry. This does not require any entries in the text folder.
---@param eopEnryIndex integer Entry index in M2TWEOPDU.
---@param newLocalizedDescr string 
function M2TWEOPDU.setEntryLocalizedDescr(eopEnryIndex, newLocalizedDescr) end 

---Set localized short description for M2TWEOPDU entry. This does not require any entries in the text folder.
---@param eopEnryIndex integer Entry index in M2TWEOPDU.
---@param newLocalizedShortDescr string 
function M2TWEOPDU.setEntryLocalizedShortDescr(eopEnryIndex, newLocalizedShortDescr) end 

---Basic edbEntry table.
---@class edbEntry
edbEntry = { 

    ---@type integer
    buildingID = nil,

    ---@type integer
    classification = nil,

    ---@type integer
    isCoreBuilding = nil,

    ---@type integer
    isPort = nil,

    ---@type integer
    isCoreBuilding2 = nil,

    ---@type integer
    hasReligion = nil,

    ---@type integer
    religionID = nil,

    ---@type integer
    isHinterland = nil,

    ---@type integer
    isFarm = nil,

    ---@type integer
    buildingLevelCount = nil,

}

---Basic capability table.
---@class capability
capability = { 

    ---@type integer
    capabilityType = nil,

    ---@type integer
    capabilityLvl = nil,

    ---@type integer
    bonus = nil,

    ---@type integer
    capabilityID = nil,

}

---Basic recruitpool table.
---@class recruitpool
recruitpool = { 

    ---@type integer
    capabilityType = nil,

    ---Difference is for agents
    ---@type integer
    capabilityLvlorExp = nil,

    ---@type integer
    unitID = nil,

    ---@type number
    initialSize = nil,

    ---@type number
    gainPerTurn = nil,

    ---@type number
    maxSize = nil,

}

---Basic EDB table.
---@class EDB
EDB = { 

}

---Create new EOP Building entry
---@param edbEntry edbEntry Old entry.
---@param newIndex integer New index of new entry.
---@return edbEntry eopentry. 
function EDB.addEopBuildEntry(edbEntry, newIndex) end 

---Get EOP Building entry.
---@param index integer Index of eop entry.
---@return edbEntry eopentry. 
function EDB.getEopBuildEntry(index) end 

---Set picture of building.
---@param edbEntry edbEntry Entry to set.
---@param newPic string Path to new pic.
---@param level integer Building level to set pic for.
---@param culture integer ID of the culture to set the pic for.
function EDB.setBuildingPic(edbEntry, newPic, level, culture) end 

---Set constructed picture of building.
---@param edbEntry edbEntry Entry to set.
---@param newPic string Path to new pic.
---@param level integer Building level to set pic for.
---@param culture integer ID of the culture to set the pic for.
function EDB.setBuildingPicConstructed(edbEntry, newPic, level, culture) end 

---Set construction picture of building.
---@param edbEntry edbEntry Entry to set.
---@param newPic string Path to new pic.
---@param level integer Building level to set pic for.
---@param culture integer ID of the culture to set the pic for.
function EDB.setBuildingPicConstruction(edbEntry, newPic, level, culture) end 

---Set name of a building.
---@param edbEntry edbEntry Entry to set.
---@param newName string New name.
---@param level integer Building level.
---@param facnum integer Faction ID of the faction to set it for (dipNum).
function EDB.setBuildingLocalizedName(edbEntry, newName, level, facnum) end 

---Set description of a building.
---@param edbEntry edbEntry Entry to set.
---@param newName string New description.
---@param level integer Building level.
---@param facnum integer Faction ID of the faction to set it for (dipNum).
function EDB.setBuildingLocalizedDescr(edbEntry, newName, level, facnum) end 

---Set short description of a building.
---@param edbEntry edbEntry Entry to set.
---@param newName string New short description.
---@param level integer Building level.
---@param facnum integer Faction ID of the faction to set it for (dipNum).
function EDB.setBuildingLocalizedDescrShort(edbEntry, newName, level, facnum) end 

---Add a capability to a building.
---@param edbEntry edbEntry Entry to set.
---@param level integer Building level.
---@param capability integer ID of capability to set.
---@param value integer Value to set.
---@param bonus boolean Is it bonus or not.
function EDB.addBuildingCapability(edbEntry, level, capability, value, bonus) end 

---Remove a capability from a building.
---@param edbEntry edbEntry Entry to set.
---@param level integer Building level.
---@param index integer Which capability to remove (In order of iterating).
function EDB.removeBuildingCapability(edbEntry, level, index) end 

---Get capability from a building at an index.
---@param edbEntry edbEntry Entry to set.
---@param level integer Building level.
---@param index. integer 
---@return capability capability. 
function EDB.getBuildingCapability(edbEntry, level, index.) end 

---Get capability amount from a building.
---@param edbEntry edbEntry Entry to set.
---@param level integer Building level.
---@return integer capabilityNum. 
function EDB.getBuildingCapabilityNum(edbEntry, level) end 

---Add a recruitment pool to a building.
---@param edbEntry edbEntry Entry to set.
---@param level integer Building level.
---@param eduIndex integer edu index of unit to add (EOP units not supported!).
---@param initialSize number Initial pool.
---@param gainPerTurn number Replenishment per turn.
---@param maxSize number Maximum size.
---@param exp integer Initial experience.
function EDB.addBuildingPool(edbEntry, level, eduIndex, initialSize, gainPerTurn, maxSize, exp) end 

---Remove a recruitment pool from a building.
---@param edbEntry edbEntry Entry to set.
---@param level integer Building level.
---@param index integer Which pool to remove (In order of iterating).
function EDB.removeBuildingPool(edbEntry, level, index) end 

---Get a recruitment pool from a building by index.
---@param edbEntry edbEntry Entry to set.
---@param level integer Building level.
---@param index integer Which pool to get (In order of iterating).
---@return recruitpool pool. 
function EDB.getBuildingPool(edbEntry, level, index) end 

---Get a recruitment pool count.
---@param edbEntry edbEntry Entry to set.
---@param level integer Building level.
---@return integer poolNum. 
function EDB.getBuildingPoolNum(edbEntry, level) end 

---Get a building edb entry by name.
---@param buildingname string 
---@return edbEntry entry 
function EDB.getBuildingByName(buildingname) end 

---Basic M2TWEOPSounds table. Contains descriptions of M2TWEOP sound features. Attention! You can use 256 sounds max. It supports the following audio formats: - WAV - OGG/Vorbis - FLAC  You can play many sounds at the same time. It should be used for small sounds that can fit in memory. It's not recommended to use this for playing larger sounds like music.
---@class M2TWEOPSounds
M2TWEOPSounds = { 

}

---Create (and load) a new sound.
---@param soundPath string Path to sound file
---@return integer soundID ID that will be used by this sound. Returns nil if the sound can't load..
function M2TWEOPSounds.createEOPSound(soundPath) end 

---Delete a sound
---@param soundID integer ID of the sound that you want to delete.
function M2TWEOPSounds.deleteEOPSound(soundID) end 

---Play a sound.
---@param soundID integer ID of the sound that you want to play.
function M2TWEOPSounds.playEOPSound(soundID) end 

---Set a sound's playing offset. i.e Skip a certain number of milliseconds of the beginning of the sound.
---@param soundID integer ID of the sound.
---@param millisecondsOffset integer New playing position, from the beginning of the sound.
function M2TWEOPSounds.setEOPSoundOffset(soundID, millisecondsOffset) end 

---Get a sound's playing offset.
---@param soundID integer ID of the sound.
---@return integer millisecondsOffset Playing position, from the beginning of the sound.
function M2TWEOPSounds.getEOPSoundOffset(soundID) end 

---Pause a sound that is playing.
---@param soundID integer ID of the sound that you want to pause.
function M2TWEOPSounds.pauseEOPSound(soundID) end 

---Stop a sound that is playing.
---@param soundID integer ID of the sound that you want to stop.
function M2TWEOPSounds.stopEOPSound(soundID) end 

---Basic M2TWEOPFBX table. Contains descriptions of m2tweop fbx feathures.
---@class M2TWEOPFBX
M2TWEOPFBX = { 

}

---Load a new fbx model.
---@param modelPath string Path to .fbx file.
---@param texturePath string Path to .dds file
---@param modelID integer ID to be used for this model.
function M2TWEOPFBX.addFbxModel(modelPath, texturePath, modelID) end 

---Delete a fbx model.
---@param modelID integer Model's ID that was specified when calling addFbxModel()
function M2TWEOPFBX.deleteFbxModel(modelID) end 

---Get an added fbx model by it's ID.
---@param modelID integer Model's ID that was specified when calling addFbxModel()
---@return fbxModel fbx model, not it`s ID!
function M2TWEOPFBX.getFbxModel(modelID) end 

---Create new fbx object with our previously loaded model. It can be placed on map, etc.
---@param modelID integer Model's ID that was specified when calling addFbxModel()
---@param objectID integer The ID that the object should use
---@return fbxObject The newly created FBX object (not it's ID)
function M2TWEOPFBX.addFbxObject(modelID, objectID) end 

---Delete an fbx object.
---@param object fbxObject The created FBX object (not it's ID)
function M2TWEOPFBX.deleteFbxObject(object) end 

---Get an fbx object by it's ID.
---@param int objectID The ID of the FBX object you wish to retrieve
---@return fbxObject The created FBX object (not it's ID)
function M2TWEOPFBX.getFbxObject(int) end 

---Set an fbx object's coordinates.
---@param fbx fbxObject object
---@param x number coord
---@param y number coord
---@param z number coord
function M2TWEOPFBX.setFbxObjectCoords(fbx, x, y, z) end 

---Get an fbx object's coordinates.
---@param fbx fbxObject object
---@return number x coord
---@return number y coord
---@return number z coord
function M2TWEOPFBX.getFbxObjectCoords(fbx) end 

---Set an fbx object's size modifier.
---@param fbx fbxObject object
---@param sizeModifier number object size modifier
function M2TWEOPFBX.setFbxObjectSize(fbx, sizeModifier) end 

---Get an fbx object's size modifier.
---@param fbx fbxObject object
---@return number sizeModifier object size modifier
function M2TWEOPFBX.getFbxObjectSize(fbx) end 

---Set an fbx object's draw state.
---@param fbx fbxObject object
---@param is boolean draw needed
function M2TWEOPFBX.setFbxObjectDrawState(fbx, is) end 

---Get an fbx object's draw state.
---@param fbx fbxObject object
---@return boolean is draw needed
function M2TWEOPFBX.getFbxObjectDrawState(fbx) end 

---Set an fbx object's animation state.
---@param fbx fbxObject object
---@param is boolean animation needed
function M2TWEOPFBX.setFbxObjectAnimState(fbx, is) end 

---Get an fbx object's animation state.
---@param fbx fbxObject object
---@return boolean is animation needed
function M2TWEOPFBX.getFbxObjectAnimState(fbx) end 

---Set fbx object draw type, i.e. on what part of the game it is drawn. Can be: 1 - Strategy Map 2 - Tactical/Battle Map 0 - Both Default value - 1
---@param fbx fbxObject object
---@param current integer draw type
function M2TWEOPFBX.setFbxObjectDrawType(fbx, current) end 

---Get fbx object draw type, i.e. on what part of game it is drawn. Can be: 1 - Strategy Map 2 - Tactical/Battle Map 0 - Both Default value - 1
---@param fbx fbxObject object
---@return integer current draw type
function M2TWEOPFBX.getFbxObjectDrawType(fbx) end 

---Events functions list. Just list, use it without EventsFunctionsList.!!!
---@class EventsFunctionsList
EventsFunctionsList = { 

}

---Called every time an image is rendered for display
---@param pDevice LPDIRECT3DDEVICE9 
function draw(pDevice) end 

---Called when ImGui backend reload fonts
function onLoadingFonts() end 

---Called after the game loads various db`s (edu, etc) at startup.
function onReadGameDbsAtStart() end 

---Called on clicking the stratmap.
---@param x integer 
---@param y integer 
function onClickAtTile(x, y) end 

---Called when a new campaign is started from the menu.
function onNewGameStart() end 

---Called after loading the campaign map
function onCampaignMapLoaded() end 

---Called on creating a new save file.
function onCreateSaveFile() end 

---Called on loading a save file.
function onLoadSaveFile() end 

---Called on plugin load (at game start).
function onPluginLoad() end 

---Called on the completion of the siege (in any way, with any outcome).
---@param xCoord integer x coordinate of siege(settlement or fort)
---@param yCoord integer y coordinate of siege(settlement or fort)
function onEndSiege(xCoord, yCoord) end 

---Called on the starting of the siege (in any way, with any outcome).
---@param xCoord integer x coordinate of siege(settlement or fort)
---@param yCoord integer y coordinate of siege(settlement or fort)
function onStartSiege(xCoord, yCoord) end 

---Called on select worldpkgdesc for battlemap. See https://wiki.twcenter.net/index.php?title=.worldpkgdesc_-_M2TW. M2TWEOP will ignore the return value if its group does not match the required group!
---@param selectedRecordName string 
---@param selectedRecordGroup string 
---@return string newSelectedRecordName 
function onSelectWorldpkgdesc(selectedRecordName, selectedRecordGroup) end 

---Called at the start of a new turn.
---@param turnNumber integer 
function onChangeTurnNum(turnNumber) end 

---A character has been selected by any means (including through the UI).
---@param selectedChar namedCharacter 
function onCharacterSelected(selectedChar) end 

---Called before the faction's turn starts.
---@param faction factionStruct 
function onPreFactionTurnStart(faction) end 

---Called at a faction's turn start.
---@param faction factionStruct 
function onFactionTurnStart(faction) end 

---Called at a faction's turn end.
---@param faction factionStruct 
function onFactionTurnEnd(faction) end 

---Called after faction changes to a new capital.
---@param faction factionStruct 
function onFactionNewCapital(faction) end 

---Called after a faction declares a war.
---@param faction factionStruct 
---@param targetFaction factionStruct 
function onFactionWarDeclared(faction, targetFaction) end 

---Called after a faction declares an alliance.
---@param faction factionStruct 
---@param targetFaction factionStruct 
function onFactionAllianceDeclared(faction, targetFaction) end 

---Called after a faction makes a trade agreement.
---@param faction factionStruct 
---@param targetFaction factionStruct 
function onFactionTradeAgreementMade(faction, targetFaction) end 

---Called after a faction breaks an alliance.
---@param faction factionStruct 
---@param targetFaction factionStruct 
function onFactionBreakAlliance(faction, targetFaction) end 

---Called after a faction gives money to another faction.
---@param faction factionStruct 
---@param targetFaction factionStruct 
---@param amount integer 
function onGiveMoney(faction, targetFaction, amount) end 

---Called after a faction updates it's attitude towards another faction.
---@param faction factionStruct 
---@param targetFaction factionStruct 
function onUpdateAttitude(faction, targetFaction) end 

---A demeanour response has occured in diplomacy talks.
---@param faction factionStruct 
---@param targetFaction factionStruct 
---@param amount number 
function onDemeanour(faction, targetFaction, amount) end 

---A general has attacked another general.
---@param attacker namedCharacter 
---@param defender namedCharacter 
function onGeneralAssaultsGeneral(attacker, defender) end 

---An assault has taken place.
---@param attacker namedCharacter 
---@param settlement settlementStruct nil if it is fort
---@param fort fortStruct nil if it is settlement
function onGeneralAssaultsResidence(attacker, settlement, fort) end 

---A General has captured a settlement.
---@param attacker namedCharacter 
---@param settlement settlementStruct 
function onGeneralCaptureSettlement(attacker, settlement) end 

---A General has captured a residence such as a fort or watchtower.
---@param attacker namedCharacter 
function onGeneralCaptureResidence(attacker) end 

---Siege equipment has been completed by one of the sieging armies at this residence.
---@param settlement settlementStruct nil if it is fort
---@param fort fortStruct nil if it is settlement
function onSiegeEquipmentCompleted(settlement, fort) end 

---When a battle has finished.
---@param character namedCharacter 
function onPostBattle(character) end 

---The player has attempted to move a character beyond that character's given movement range for that turn.
---@param character namedCharacter 
function onMultiTurnMove(character) end 

---A settlement has been selected by any means (including through the UI).
---@param settlement settlementStruct 
function onSettlementSelected(settlement) end 

---A settlement's level has been increased.
---@param settlement settlementStruct 
function onSettlementUpgraded(settlement) end 

---A settlement converted between city and castle and vice-versa.
---@param settlement settlementStruct 
function onSettlementConverted(settlement) end 

---A settlement has rioted.
---@param settlement settlementStruct 
function onCityRiots(settlement) end 

---The last unit has been removed from a settlement, agents do not count.
---@param settlement settlementStruct 
function onUngarrisonedSettlement(settlement) end 

---The last unit has been removed from a fort, agents do not count.
---@param fort fortStruct 
function onUngarrisonedFort(fort) end 

---A settlement has been given to another faction.
---@param settlement settlementStruct 
---@param fac1 factionStruct 
---@param fac2 factionStruct 
function onGiveSettlement(settlement, fac1, fac2) end 

---A general has captured a settlement and the occupy option has been chosen
---@param character namedCharacter only generals, event does not fire for captains
---@param targetFaction factionStruct 
function onOccupySettlement(character, targetFaction) end 

---A general has captured a settlement and the exterminate option has been chosen.
---@param character namedCharacter only generals, event does not fire for captains
---@param targetFaction factionStruct 
function onExterminatePopulation(character, targetFaction) end 

---A general has captured a settlement and the sack option has been chosen.
---@param character namedCharacter only generals, event does not fire for captains
---@param targetFaction factionStruct 
function onSackSettlement(character, targetFaction) end 

---A building has been added to the construction queue.
---@param settlement settlementStruct 
---@param buildNme string level name
function onAddedToBuildingQueue(settlement, buildNme) end 

---A building has been destroyed.
---@param settlement settlementStruct 
---@param buildNme string level name
function onBuildingDestroyed(settlement, buildNme) end 

---A building has been completed.
---@param fac factionStruct 
---@param settlement settlementStruct 
function onBuildingCompleted(fac, settlement) end 

---An event counter has changed it's value.
---@param counter string 
function onEventCounter(counter) end 

---When a faction is excommunicated by the Pope.
---@param fac factionStruct 
function onFactionExcommunicated(fac) end 

---When a particular disaster has just happened.
---@param eventType integer (earthquake, flood, horde, fire, riot, storm, volcano), Don't know enum order!
function onDisaster(eventType) end 

---A Faction has formed a horde.
---@param fac factionStruct 
function onHordeFormed(fac) end 

---A unit has been added to the training queue.
---@param sett settlementStruct 
---@param unitName string 
function onAddedToTrainingQueue(sett, unitName) end 

---A unit has been disbanded.
---@param fac factionStruct 
---@param unit unit 
function onUnitDisbanded(fac, unit) end 

---A unit has been trained.
---@param fac factionStruct 
---@param sett settlementStruct 
---@param unit unit 
function onUnitTrained(fac, sett, unit) end 

---An agent has been trained.
---@param character namedCharacter 
---@param agentType integer see @{character:setTypeID} for list of type integers
---@param sett settlementStruct 
function onAgentCreated(character, agentType, sett) end 

---An object of the target faction has been seen by the faction.
---@param fac factionStruct Faction that saw the object.
---@param targetFac factionStruct Faction that owns the object.
---@param xCoord integer 
---@param yCoord integer 
function onObjSeen(fac, targetFac, xCoord, yCoord) end 

---The tile has been seen by the faction.
---@param fac factionStruct 
---@param xCoord integer 
---@param yCoord integer 
function onTileSeen(fac, xCoord, yCoord) end 

---The game has been reloaded while on the strategy map.
---@param something integer 
function onGameReloaded(something) end 

---A faction to faction transgression has occurred.
---@param fac factionStruct 
---@param description string 
---@param targetFac factionStruct 
function onTransgression(fac, description, targetFac) end 

---The Pope has accepted the player's crusade target. Deus Vult!
---@param crusade crusadeStruct 
---@param target settlementStruct 
function onPopeAcceptsCrusadeTarget(crusade, target) end 

---A Crusade or Jihad has been called.
---@param crusade crusadeStruct 
---@param target settlementStruct 
function onCrusadeCalled(crusade, target) end 

---A Crusade or Jihad has ended.
---@param crusade crusadeStruct 
---@param target settlementStruct 
function onCrusadeEnds(crusade, target) end 

---The Pope has rejected the player's crusade target.
---@param crusade crusadeStruct 
---@param target settlementStruct 
function onPopeRejectsCrusadeTarget(crusade, target) end 

---An army has taken a crusade or jihad target settlement.
---@param crusade crusadeStruct 
---@param target settlementStruct 
---@param army stackStruct 
function onArmyTakesCrusadeTarget(crusade, target, army) end 

---Units have deserted a crusade or jihad.
---@param crusade crusadeStruct 
---@param target settlementStruct 
---@param fac factionStruct 
function onUnitsDesertCrusade(crusade, target, fac) end 

---A new pope has been elected.
---@param fac factionStruct 
---@param fac2 factionStruct 
function onPopeElected(fac, fac2) end 

---A Faction has voted for the new pope.
---@param fac factionStruct 
function onVotedForPope(fac) end 

---An assassination mission against the pope has failed and the assassin is executed.
---@param fac factionStruct 
function onAssassinCaughtAttackingPope(fac) end 

---An inquisitor has been dispatched to a region.
---@param fac factionStruct 
---@param sett settlementStruct 
function onInquisitorAppointed(fac, sett) end 

---The player has opened the panel for the selected settlement.
---@param sett settlementStruct 
function onSettlementPanelOpen(sett) end 

---The player has opened the finances panel.
---@param fac factionStruct 
function onFinancesPanelOpen(fac) end 

---The player has opened the faction summary panel.
---@param fac factionStruct 
function onFactionSummaryPanelOpen(fac) end 

---The player has opened the family tree panel.
---@param fac factionStruct 
function onFamilyTreePanelOpenFunc(fac) end 

---The player has opened the diplomatic standing panel.
---@param fac factionStruct 
function onDiplomaticStandingPanelOpen(fac) end 

---The player has opened a diplomacy panel.
---@param fac factionStruct 
function onDiplomacyPanelOpen(fac) end 

---The player has attacked an army or settlement. The decision panel is now open.
---@param fac factionStruct 
function onPreBattlePanelOpen(fac) end 

---The naval auto resolve panel has opened.
function onNavalAutoResolvePanelOpen() end 

---The player has opened the panel for the selected character.
---@param selectedChar namedCharacter 
function onCharacterPanelOpen(selectedChar) end 

---The player has opened a trade panel.
---@param sett settlementStruct 
function onTradePanelOpen(sett) end 

---The player has requested building advice.
---@param sett settlementStruct 
function onRequestBuildingAdvice(sett) end 

---The player has requested training advice.
---@param sett settlementStruct 
---@param recommendedUnitEntry eduEntry 
function onRequestTrainingAdvice(sett, recommendedUnitEntry) end 

---The player has opened a message.
---@param fac factionStruct 
---@param msgType integer 
function onMessageOpen(fac, msgType) end 

---The player has recieved a message.
---@param fac factionStruct 
---@param msgType integer 
function onIncomingMessage(fac, msgType) end 

---The player has closed a message.
---@param msgType integer 
function onMessageClosed(msgType) end 

---The player has clicked on a button.
---@param buttonName string 
function onButtonPressed(buttonName) end 

---The player closed a scroll.
---@param scrollName string 
function onScrollClosed(scrollName) end 

---The player opened a scroll.
---@param scrollName string 
function onScrollOpened(scrollName) end 

---A special UI Element is visible.
---@param elementName string 
function onUIElementVisible(elementName) end 

---The player has requested advice on a scroll.
---@param scrollName string 
function onScrollAdviceRequested(scrollName) end 

---The player has requested advice on the settlement scroll.
---@param sett settlementStruct 
---@param scrollName string 
function onSettlementScrollAdviceRequested(sett, scrollName) end 

---The player has requested advice on the prebattle scroll.
function onPreBattleScrollAdviceRequested() end 

---The player has requested advice on the naval prebattle scroll.
function onNavalPreBattleScrollAdviceRequested() end 

---The player has opened the college of cardinals panel.
---@param college collegeCardinalsStruct 
function onCollegeOfCardinalsPanelOpen(college) end 

---A guild has been created or upgraded.
---@param sett settlementStruct 
---@param guildName string 
function onGuildUpgraded(sett, guildName) end 

---A guild has been destroyed.
---@param sett settlementStruct 
---@param guildID integer 
function onGuildDestroyed(sett, guildID) end 

---A character in the family tree has received a brother by adoption.
---@param character namedCharacter This is the original child, not the newly adopted character.
function onBrotherAdopted(character) end 

---A child has been born.
---@param child namedCharacter 
function onBirth(child) end 

---A character has come of age.
---@param character namedCharacter Character's age is equal to age\_of\_manhood in descr\_campaign\_db.xml.
function onCharacterComesOfAge(character) end 

---A character has married (someone who isn't a princess).
---@param husband namedCharacter 
function onCharacterMarries(husband) end 

---A character has married a princess agent.
---@param husband namedCharacter 
function onCharacterMarriesPrincess(husband) end 

---A child has been born.
---@param father namedCharacter Note: this event fires for all child births for this father, not just the first one.
function onCharacterBecomesAFather(father) end 

---A new admiral has been created for a new ship.
---@param admiral namedCharacter 
---@param sett settlementStruct 
function onNewAdmiralCreated(admiral, sett) end 

---The player triggered a keyboard shortcut.
---@param shortcut string 
function onShortcutTriggered(shortcut) end 

---The character has been made the faction leader.
---@param leader namedCharacter 
function onBecomesFactionLeader(leader) end 

---The character has been made a faction heir.
---@param heir namedCharacter 
function onBecomesFactionHeir(heir) end 

---Called when a general devastates a tile.
---@param gen namedCharacter 
function onGeneralDevastatesTile(gen) end 

