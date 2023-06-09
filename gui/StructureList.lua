function drawStructureList()
    -- Structure List
            -- granary
            shouldDraw = ImGui.BeginChild("StructureList#01", 680 * _wh, 350 * _hg, true, bit.bor(
                ImGuiWindowFlags.NoDecoration, ImGuiWindowFlags.NoMove, ImGuiWindowFlags.AlwaysVerticalScrollbar))

            ImGui.SetCursorPos(x + 40 * _wh, y + 20 * _hg)
            granaryClicked = ImGui.Button(FARM.localized_label)

            if granaryClicked then
                if (GRANARY.cost > gameDataAll.get().campaignStruct.currentFaction.money) then
                    print("Sorry you do not have mmmonneeey!")
                else
                    -- BUILDING IT!
                    local x, y = merchatForBuildStructure.character.xCoord, merchatForBuildStructure.character.yCoord

                    -- Give money back from fort cost
                    merchatForBuildStructure.faction.money = merchatForBuildStructure.faction.money + 5000

                    local newX, newY = getValidTileAround(x, y)
                    merchatForBuildStructure.character:reposition(newX, newY)
                    merchatForBuildStructure.faction:createFortXY(x, y)

                    -- TODO SET CUSTOM .CAS FILE DEPENDING ON BUILDING
                    stratmap.objects.setModel(x, y, 1, 1);

                    merchatForBuildStructure.faction.money = merchatForBuildStructure.faction.money - GRANARY.cost

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

            ImGui.EndChild()
end