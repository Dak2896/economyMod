require('myconfigs')

-- Helper for managing persistence of tables across save/load
require('helpers/tableSave')

-- Uncomment to use EOP Helper functions
require('helpers/EopLuaHelpers')

-- Uncomment to use external debugger
-- require('helpers/mobdebug').start()

-- EconomyStructures data
require('EconomyStratMap')

-- Selected Merchant for build structures
require('Assets')

-- Window Utils 
require('WindowUtils')

-- Lua 
require('cdef')

-- Panel Text 
require('gui/init')

-- utils
require('Utils')

-- Hot seat data
require('EconomyStructures')
require('PlayedFactions')

MAIN_FACTION = nil

-- Fires when loading a save file
function onLoadSaveFile(paths)
    campaignPopup = true;

    for index, path in pairs(paths) do
        if (string.find(path, "EconomyStructuresSaved.lua")) then
            economyStructureBuild = persistence.load(path);
            print(economyStructureBuild)
        end

        if (string.find(path, "PlayedFactionsSaved.lua")) then
            playedFactions = persistence.load(path);
            tprint(playedFactions)
        end
    end
end

-- Fires when creating a save file
-- Returns a list of M2TWEOP save files
function onCreateSaveFile()
    local savefiles = {};
    currentPath = M2TWEOP.getPluginPath();

    -- Save data about each faction building, needed for HS!
    -- increase number here important
    print("played factions before save: ")
    persistence.store(currentPath .. "EconomyStructuresSaved.lua", economyStructureBuild);
    savefiles[1] = currentPath .. "EconomyStructuresSaved.lua";

    persistence.store(currentPath .. "PlayedFactionsSaved.lua", playedFactions);
    savefiles[2] = currentPath .. "PlayedFactionsSaved.lua";
    return savefiles;
end

-- I reset all tables
function onNewGameStart()
    clearFactions()
    clearStructures()
    
    -- TODO stop draw all custom .cas
    stratmap.objects.stopDrawModel(1);
end

-- Fires when the plugin is first loaded at game start or reloded with CTRL+9+1
function onPluginLoad()
    M2TWEOP.unlockGameConsoleCommands();
    -- M2TWEOP.setAncillariesLimit(8);
     M2TWEOP.setMaxBgSize(150);
    -- M2TWEOP.setReligionsLimit(50);
    -- M2TWEOP.setBuildingChainLimit(40);
    -- M2TWEOP.setGuildCooldown(3);
    startLog(M2TWEOP.getModPath())

    -- add all .CAS
    stratmap.objects.addModelToGame("data/models_strat/residences/eastern_european_city.cas", 1);
end

function onCharacterSelected(character)

    local type = character.character:getTypeID();
    if type == 4 then
        if showMerchantIcon == false then
            showMerchantIcon = true

            local xPos, yPos = character.character.xCoord, character.character.yCoord
            merchatForBuildStructure = character

            local sMap = gameDataAll.get().stratMap;
            local tile = sMap.getTile(xPos, yPos);
            local region = sMap.getRegion(tile.regionID);

        end
    else
        showMerchantIcon = false
    end
    -- merchatForBuildStructure = character
    -- print("selection for :" .. character.fullName);
end

local merchantClickedBuild = false



function drawMerchantIcon(toogle)
   
    return clicked
end

function draw(pDevice)
    ImGui.SetMouseCursor(ImGuiMouseCursor.Arrow)

    local numColorStyles, numVarStyles = setGlobalStyles()

    if showMerchantIcon then

        if merchantIcon.img ~= nil then

            ImGui.SetNextWindowPos(395 * _wh, 915 * _hg)
            ImGui.SetNextWindowSize(20 * _wh, 20 * _hg)
        
            open, shouldDraw = ImGui.Begin("Window#01", open, ImGuiWindowFlags.NoDecoration)
        
            local clicked = ImGui.ImageButton(merchantIcon.img, 20 * _wh, 20 * _hg)
            if (clicked == true and merchantClickedBuild == false) then
                merchantClickedBuild = true
            end
            ImGui.End()
        end

        if (merchantClickedBuild) then

            ImGui.SetNextWindowPos(565 * _wh, 180 * _hg)
            ImGui.SetNextWindowSize(700 * _wh, 600 * _hg)

            merchantClickedBuild, shouldDraw = ImGui.Begin("Window#02", merchantClickedBuild,
                ImGuiWindowFlags.NoDecoration)

                local x, y = ImGui.GetCursorPos()

                -- background  page image
                ImGui.Image(panelBackground.img, 700 * _wh, 600 * _hg)

                ImGui.SetCursorPos(x + 40 * _wh, y + 40.0 * _hg)
                ImGui.Text(MERCHANT_PANEL_TITLE)

                ImGui.SetCursorPos(x + 600 * _wh, y + 540.0 * _hg)
                ImGui.Image(closeIcon.img, 40 * _wh, 40 * _hg)
                clicked = ImGui.IsItemClicked()
                hovered = ImGui.IsItemHovered()

                if hovered then
                    ImGui.SetCursorPos(x + 600 * _wh, y + 540.0 * _hg)
                    ImGui.Image(closeIconHovered.img, 40 * _wh, 40 * _hg)
                end
                if clicked then
                    merchantClickedBuild = false
                end

                ImGui.SetCursorPos(x + 40 * _wh, y + 80.0 * _hg)
                ImGui.Text(MERCHANT_PANEL_SUBTITLE)

                -- Structure List
                -- granary
                shouldDraw =  ImGui.BeginChild("StructureList#01", 680 * _wh, 350 * _hg, true, bit.bor(ImGuiWindowFlags.NoDecoration, ImGuiWindowFlags.NoMove, ImGuiWindowFlags.AlwaysVerticalScrollbar))

                    ImGui.SetCursorPos(x + 40 * _wh, y + 20 * _hg)
                    granaryClicked = ImGui.Button(FARM.localized_label)

                    if granaryClicked then
                        if (GRANARY.cost > gameDataAll.get().campaignStruct.currentFaction.money) then
                            print("Sorry you do not have mmmonneeey!")
                        else
                            -- BUILDING IT!
                            local x, y = merchatForBuildStructure.character.xCoord,
                            merchatForBuildStructure.character.yCoord

                            -- Give money back from fort cost
                            merchatForBuildStructure.faction.money = merchatForBuildStructure.faction.money + 5000

                            local newX, newY = getValidTileAround(x, y)
                            merchatForBuildStructure.character:reposition(newX, newY)
                            merchatForBuildStructure.faction:createFortXY(x, y)
                        

                            -- TODO SET CUSTOM .CAS FILE DEPENDING ON BUILDING
                            stratmap.objects.setModel (x, y, 1, 1);

                            merchatForBuildStructure.faction.money =
                            merchatForBuildStructure.faction.money - GRANARY.cost

                            addEconomyStructure(FARM, merchatForBuildStructure.faction)

                        end
                    end
                    ImGui.SameLine(x + 120 * _wh)
                    ImGui.Text("" .. FARM.description .. " " .. tostring(FARM.cost))

                    ImGui.SetCursorPos(x + 500 * _wh, y + 0 * _hg)
                    ImGui.Image(granary.img, 78 * _wh, 62 * _hg)

                    ImGui.SetCursorPos(x + 580 * _wh, y + 20 * _hg)
                    ImGui.Text(formatEarings(FARM.earning))

                    -- fishery
                    
                    ImGui.SetCursorPos(x + 40 * _wh, y + 290.0 * _hg)
                    ImGui.Button(FISHERY.localized_label)

                    ImGui.SameLine(x + 120 * _wh * _wh)
                    ImGui.Text(FISHERY.description)

                ImGui.End()
            ImGui.End()

        end
    end

    -- draw window, do all shit
    ImGui.PopStyleVar(numVarStyles)
    ImGui.PopStyleColor(numColorStyles)

end

function onClickAtTile(x, y)
    if merchatForBuildStructure ~= nil then

        merchatForBuildStructure = nil
        showMerchantIcon = false
        merchantClickedBuild = false
    end

end

function onCampaignMapLoaded()
    -- Window Size
    window = ffi.C.GetActiveWindow()
    rect = ffi.new("RECT")
    ffi.C.GetClientRect(window, rect)

    if merchantIcon.img == nil then
        loadAssets()
    end

    -- save game screen ratio we will use it to calculate where to put GUI
    if getWindowWidth == nil then
        setWindowWidth(rect.right - rect.left)
        setWindowHeigth(rect.bottom - rect.top)
    end


    -- Replace all .cas file with the correct models

end

function onFactionTurnStart(fac)
    if fac ~= nil and fac.isPlayerControlled == 1 then
        -- TODO REMOVE THIS NEED FOR SEE STRUCTURE EARNINGS
        MAIN_FACTION = fac
        fac.money = 0
        if next(playedFactions) ~= nil then
            if has_value(playedFactions, fac:getFactionName()) then
            else
                print("I add the faction to the list!")
                addFaction(fac:getFactionName())
            end
        else
            print("I add the faction to the list it was empty!")
            addFaction(fac:getFactionName())
        end

        if MAIN_FACTION ~= nil then
            print("fac: " .. MAIN_FACTION:getFactionName())
            getStructuresIncome(MAIN_FACTION)
        end

    end
end

--------------------------------------------------------------------------------
------------ NOT USED SCRIPT YET CALLBACKS NOT INVOKED AS EXPECTED -------------

function onFactionTurnEnd()
    --  print("faction turn end")
end

function onUIElementVisible(elementName)
    -- print("onUIElementVisible : " .. elementName);
end

function onFinancesPanelOpen(fac)
    -- print("onFinancesPanelOpen : " .. fac.capital.localizedName);
end

function onCharacterPanelOpen(selectedChar)
    -- print("panel open for : " .. selectedChar.fullName);
end

function onScrollOpened(scrollName)
    -- print("onScrollOpened : " .. scrollName);
end
