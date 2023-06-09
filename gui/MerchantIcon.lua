function drawMerchantIcon(toogle)
    ImGui.SetNextWindowPos(395 * _wh, 915 * _hg)
    ImGui.SetNextWindowSize(20 * _wh, 20 * _hg)

    toogle, shouldDraw = ImGui.Begin("Window#01", open, ImGuiWindowFlags.NoDecoration)

    local clicked = ImGui.ImageButton(merchantIcon.img, 20 * _wh, 20 * _hg)
    if (clicked == true and toogle == false) then
        toogle = true
    end
    ImGui.End()
end