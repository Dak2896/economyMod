-- Save data about window sizes
_wh = 0
_hg = 0

function setWindowWidth(value)
    _wh = value / 1280
end

function setWindowHeigth(value)
    _hg = value / 1024
end

function setGlobalStyles()
    -- Number of styles to clear after we are done with them
    local numColorStyles = 16
    local numVarStyles = 7

    -- Global Styles
    ImGui.PushStyleVar(ImGuiStyleVar.WindowPadding, 0, 0)
    ImGui.PushStyleVar(ImGuiStyleVar.FrameBorderSize, 0.0)
    ImGui.PushStyleVar(ImGuiStyleVar.FrameRounding, 0.0)
    ImGui.PushStyleVar(ImGuiStyleVar.FrameBorderSize, 0.0)
    ImGui.PushStyleVar(ImGuiStyleVar.ItemInnerSpacing, 0, 0)
    ImGui.PushStyleVar(ImGuiStyleVar.ItemSpacing, 0, 0)
    ImGui.PushStyleVar(ImGuiStyleVar.ScrollbarSize, 10)


    -- Text and Windows
    ImGui.PushStyleColor(ImGuiCol.Text, 0, 0, 0, 1)
    ImGui.PushStyleColor(ImGuiCol.WindowBg, 0, 0, 0, 0)
    ImGui.PushStyleColor(ImGuiCol.ChildBg, 0, 0, 0, 0)
    ImGui.PushStyleColor(ImGuiCol.Border, 0, 0, 0, 0)

    -- Widgets
    ImGui.PushStyleColor(ImGuiCol.PopupBg, 147 / 255, 131 / 255, 106 / 255, 0.6)
    ImGui.PushStyleColor(ImGuiCol.FrameBg, 147 / 255, 131 / 255, 106 / 255, 0.6)
    ImGui.PushStyleColor(ImGuiCol.FrameBgHovered, 147 / 255, 131 / 255, 106 / 255, 0.5)
    ImGui.PushStyleColor(ImGuiCol.FrameBgActive, 147 / 255, 131 / 255, 106 / 255, 0.6)
   
 
    -- Buttons
    ImGui.PushStyleColor(ImGuiCol.Button, 147 / 255, 131 / 255, 106 / 255, 0)
    ImGui.PushStyleColor(ImGuiCol.ButtonHovered, 147 / 255, 131 / 255, 106 / 255, 0)
    ImGui.PushStyleColor(ImGuiCol.ButtonActive, 147 / 255, 131 / 255, 106 / 255, 0)
    ImGui.PushStyleColor(ImGuiCol.ButtonActive, 147 / 255, 131 / 255, 106 / 255, 0)

    -- Scrollbar
    ImGui.PushStyleColor(ImGuiCol.ScrollbarBg, 155 / 255, 154 / 255, 143 / 255, 1)
    ImGui.PushStyleColor(ImGuiCol.ScrollbarGrab, 40 / 255, 50 / 255, 32 / 255, 1)
    ImGui.PushStyleColor(ImGuiCol.ScrollbarGrabHovered, 165 / 255, 154 / 255, 143 / 255, 1)
    ImGui.PushStyleColor(ImGuiCol.ScrollbarGrabActive, 170 / 255, 154 / 255, 143 / 255, 1)

    return numColorStyles, numVarStyles
end
