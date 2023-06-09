function drawMerchantPanelTitle(merchantClickedBuild)

    local x, y = ImGui.GetCursorPos()

    -- background  page image
    ImGui.Image(panelBackground.img, 700 * _wh, 600 * _hg)

    ImGui.SetCursorPos(x + 40 * _wh, y + 40.0 * _hg)
    ImGui.Text(MERCHANT_PANEL_TITLE)

    ImGui.SetCursorPos(x + 625 * _wh, y + 520.0 * _hg)
    ImGui.Image(closeIcon.img, 80 * _wh, 80 * _hg)
    clicked = ImGui.IsItemClicked()
    hovered = ImGui.IsItemHovered()

    if hovered then
        ImGui.SetCursorPos(x + 625 * _wh, y + 520.0 * _hg)
        ImGui.Image(closeIconHovered.img, 80 * _wh, 80 * _hg)
    end
    if clicked then
        merchantClickedBuild = false
    end

    ImGui.SetCursorPos(x + 40 * _wh, y + 80.0 * _hg)
    ImGui.Text(MERCHANT_PANEL_SUBTITLE)
    return merchantClickedBuild
end
