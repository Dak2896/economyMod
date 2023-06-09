function drawMerchantPanelFooter()
    shouldDraw = ImgGui.BeingChild("Footer", 700 * _wh, 50 * _hg, true,
    bit.bor(ImGuiWindowFlags.NoDecoration, ImGuiWindowFlags.NoMove))

ImGui.SetCursorPos(x + 600 * _wh, y + 540.0 * _hg)
ImGui.ImageButton(closeIcon.img, 80 * _wh, 80 * _hg)
clicked = ImGui.IsItemClicked()
hovered = ImGui.IsItemHovered()

if hovered then
    ImGui.SetCursorPos(x + 600 * _wh, y + 540.0 * _hg)
    ImGui.ImageButton(closeIconHovered.img, 80 * _wh, 80 * _hg)
end
if clicked then
    merchantClickedBuild = false
end
ImgGui.EndChild()
end