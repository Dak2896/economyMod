-- icon for merchant
merchantIcon = {
    x = 0,
    y = 0,
    img = nil
}

merchantIconHovered = {
    x = 0,
    y = 0,
    img = nil
}
panelBackground = {
    x = 0,
    y = 0,
    img = nil
}
closeIcon = {
    x = 0,
    y = 0,
    img = nil
}
closeIconHovered = {
    x = 0,
    y = 0,
    img = nil
}
granary = {
    x = 0,
    y = 0,
    img = nil
}

farm = {
    x = 0,
    y = 0,
    img = nil
}


function loadAssets()
    -- load textures one time only
    merchantIcon.x, merchantIcon.y, merchantIcon.img = M2TWEOP.loadTexture(M2TWEOP.getModPath() .. "/eopData/images/merchant_build_icon.dds")

    merchantIconHovered.x, merchantIconHovered.y, merchantIconHovered.img =
        M2TWEOP.loadTexture(M2TWEOP.getModPath() .. "/eopData/images/merchant_build_icon_hover.dds")

    panelBackground.x, panelBackground.y, panelBackground.img =
        M2TWEOP.loadTexture(M2TWEOP.getModPath() .. "/eopData/images/SCROLL_BACKGROUND.png")

    closeIcon.x, closeIcon.y, closeIcon.img = M2TWEOP.loadTexture(M2TWEOP.getModPath() .."/eopData/images/close.png")

    closeIconHovered.x, closeIconHovered.y, closeIconHovered.img = M2TWEOP.loadTexture(M2TWEOP.getModPath() .."/eopData/images/close_hovered.png")


    -- =================== BUILDING IMAGES ======================================
    granary.x, granary.y, granary.img = M2TWEOP.loadTexture(M2TWEOP.getModPath() .. "/eopData/images/granary.tga")
    farm.x, farm.y, farm.img = M2TWEOP.loadTexture(M2TWEOP.getModPath() .. "/eopData/images/mulino.dds")


    -- asociate asset to each building ---
    FARM.asset = farm
end

