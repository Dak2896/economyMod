function drawStructureElement(STRUCTURE)
    local x, y = ImGui.GetCursorPos()
    ImGui.SetCursorPos(x + 40 * _wh, y + 20 * _hg)

    structureBuildClick = ImGui.Button(STRUCTURE.localized_label)

    if structureBuildClick then
        if (STRUCTURE.cost > gameDataAll.get().campaignStruct.currentFaction.money) then
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
        
            local modelId = STRUCTURE.model_ID
            STRUCTURE.x = x
            STRUCTURE.y = y
            print("model id: "..modelId)
            stratmap.objects.setModel (x, y, modelId, modelId);

            merchatForBuildStructure.faction.money =
            merchatForBuildStructure.faction.money - STRUCTURE.cost

            addEconomyStructure(STRUCTURE, merchatForBuildStructure.faction)
        end
    end

    ImGui.SameLine(x + 120 * _wh)
    ImGui.Text("" .. STRUCTURE.description .. " " .. tostring(STRUCTURE.cost))

    ImGui.SetCursorPos(x + 500 * _wh, y + 0 * _hg)
    ImGui.Image(STRUCTURE.asset["img"], 78 * _wh, 62 * _hg)

    ImGui.SetCursorPos(x + 580 * _wh, y + 20 * _hg)
    ImGui.Text(formatEarings(STRUCTURE.earning))
end