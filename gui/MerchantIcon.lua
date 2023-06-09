function drawMerchantIcon(merchantClickedBuild)
    ImGui.SetNextWindowPos(395 * _wh, 915 * _hg)
    ImGui.SetNextWindowSize(20 * _wh, 20 * _hg)

    showMerchantIcon, shouldDraw = ImGui.Begin("Window#01", showMerchantIcon,  ImGuiWindowFlags.NoDecoration)

    local clicked = ImGui.ImageButton(merchantIcon.img, 20 * _wh, 20 * _hg)
    if (clicked == true and merchantClickedBuild == false) then
        merchantClickedBuild = true
    end
    ImGui.End()
    return merchantClickedBuild
end