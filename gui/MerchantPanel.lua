-- It Draw an icon near merchant, by click a panel for building will appear


function drawMerchantIcon(merchantClickedBuild)
    if merchantIcon.img ~= nil then

        ImGui.SetNextWindowPos(395 * _wh, 915 * _hg)
        ImGui.SetNextWindowSize(20 * _wh, 20 * _hg)
    
        local open = openMerchantPanel
    
        open, shouldDraw = ImGui.Begin("Window#01", open, ImGuiWindowFlags.NoDecoration)
    
        local clicked = ImGui.ImageButton(merchantIcon.img, 20 * _wh, 20 * _hg)
        if (clicked == true and merchantClickedBuild == false) then
            merchantClickedBuild = true
        end
    
        ImGui.End()
    end
    return clicked
end



function drawMerchanBuildingPanelTitle() 

    ImGui.SetNextWindowPos(565 * _wh, 130 * _hg)
    ImGui.SetNextWindowSize(700 * _wh, 600 * _hg)

    merchantClickedBuild, shouldDraw = ImGui.Begin("Window#02", merchantClickedBuild,
        ImGuiWindowFlags.NoDecoration)

    local x, y = ImGui.GetCursorPos()

    -- background  page image
    ImGui.Image(panelBackground.img, 700 * _wh, 600 * _hg)

    ImGui.SetCursorPos(x + 40 * _wh, y + 40.0 * _hg)
    ImGui.Text(MERCHANT_PANEL_TITLE)

    ImGui.SetCursorPos(x + 40 * _wh, y + 80.0 * _hg)
    ImGui.Text(MERCHANT_PANEL_SUBTITLE)

end
