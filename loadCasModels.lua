CHAR_CAS_MODELS_LOADED = false
SETTLEMENT_CAS_MODELS_LOADED = false

characterCasModels = {
    -- Kill Character models
    [1] = {
        casModel = 'troll_upg1',
        casFile = 'kill_character/troll_strat1.cas',
        textureFile = 'kill_character/textures/troll_strat_tex.tga',
        charLabel = 'KILL_CHARACTER_FAVOUR_CHAR_TROLL',
        faction = 'slave',
        displayName = 'Thomb'
    },
    [2] = {
        casModel = 'spider',
        casFile = 'kill_character/spider.cas',
        textureFile = 'kill_character/textures/spider.tga',
        charLabel = 'KILL_CHARACTER_FAVOUR_CHAR_SPIDER',
        faction = 'slave',
        displayName = 'Arakis'
    },
    [3] = {
        casModel = 'barrow_wight',
        casFile = 'kill_character/barrow_wight.cas',
        textureFile = 'kill_character/textures/barrow_wight.tga',
        charLabel = 'KILL_CHARACTER_FAVOUR_CHAR_WIGHT',
        faction = 'slave',
        displayName = 'Thelros'
    },
    [4] = {
        casModel = 'greymuzzle',
        casFile = 'kill_character/snoworcs.cas',
        textureFile = 'kill_character/textures/snoworcs.tga',
        charLabel = 'KILL_CHARACTER_FAVOUR_CHAR_WARG',
        faction = 'slave',
        displayName = 'Greymuzzle Hob'
    },
    [5] = {
        casModel = 'ened_guardians',
        charLabel = 'KILL_CHARACTER_FAVOUR_CHAR_HUMAN',
        faction = 'slave',
        displayName = 'Viglund'
    },
    [6] = {
        casModel = 'grushnag',
        casFile = 'kill_character/pale_uruk.cas',
        textureFile = 'kill_character/textures/pale_uruk.tga',
        charLabel = 'KILL_CHARACTER_FAVOUR_CHAR_ORC',
        faction = 'slave',
        displayName = 'Grushnag'
    },
    -- Create Commander models
    [7] = {
        casModel = "bree_human",
        casFile = 'player_character/bree_human.cas',
        charLabel = 'PLAYER_CHARACTER',
        textureFile = 'player_character/textures/bree_human.tga',
        faction = 'normans',
        displayName = PLAYER_CHARACTER_DISPLAY_NAME
    },
    [8] = {
        casModel = "bree_dunedain",
        casFile = 'player_character/bree_dunedain.cas',
        charLabel = 'PLAYER_CHARACTER',
        textureFile = 'player_character/textures/bree_dunedain.tga',
        faction = 'normans',
        displayName = PLAYER_CHARACTER_DISPLAY_NAME
    },
    [9] = {
        casModel = "bree_elf",
        casFile = 'player_character/bree_elf.cas',
        charLabel = 'PLAYER_CHARACTER',
        textureFile = 'player_character/textures/bree_elf.tga',
        faction = 'normans',
        displayName = PLAYER_CHARACTER_DISPLAY_NAME
    },
    [10] = {
        casModel = "bree_dwarf",
        casFile = 'player_character/bree_dwarf.cas',
        charLabel = 'PLAYER_CHARACTER',
        textureFile = 'player_character/textures/bree_dwarf.tga',
        faction = 'normans',
        displayName = PLAYER_CHARACTER_DISPLAY_NAME
    },
    -- Hire Mercenaries models
    [11] = {
        casModel = "renegades",
        casFile = 'hire_mercenaries/renegades.cas',
        textureFile = 'hire_mercenaries/textures/renegades.tga',
        charLabel = 'HIRE_MERCENARY_COMPANY_LEADER',
        faction = 'normans',
        displayName = 'Thorne'
    },
    -- Trade Caravan model
    [12] = {
        casModel = "havelock",
        casFile = 'trade_caravan/havelock_merchant_mesh.cas',
        textureFile = 'trade_caravan/textures/ee_merchant.tga',
        charLabel = 'TRADE_CARAVAN_MERCHANT',
        faction = 'normans',
        displayName = 'Havelock'
    },
    -- Request Aid models
    [13] = {
        casModel = 'bree_elf',
        charLabel = 'REQUEST_AID_ELF',
        faction = BREE_FACTION,
        displayName = 'Nastion'
    },
    [14] = {
        casModel = 'bree_dwarf',
        charLabel = 'REQUEST_AID_DWARF',
        faction = BREE_FACTION,
        displayName = 'Buzruk'
    },
    [15] = {
        casModel = 'bree_dunedain',
        charLabel = 'REQUEST_AID_ND',
        faction = BREE_FACTION,
        displayName = 'Faragond'
    },
    [16] = {
        casModel = 'halforc',
        charLabel = 'REQUEST_AID_ISENGARD',
        faction = BREE_FACTION,
        displayName = 'Oguf'
    },
    [17] = {
        casModel = 'minhiriath',
        charLabel = 'REQUEST_AID_DUNLAND',
        faction = BREE_FACTION,
        displayName = 'Gedriod'
    },
}

settlementCasModels = {
    [1] = {
        settlementName = "Cor_Wilishar",
        casModel = 'Adun_Eth_Ruined',
        casFile = 'adun_eth/Adun_Eth_Ruined.cas',
        xCoord = 116,
        yCoord = 351,
        id = 1,
        scale = 1
    },
    [2] = {
        settlementName = "Metraith",
        casModel = 'Metraith',
        casFile = 'metraith/metraith.cas',
        xCoord = 170,
        yCoord = 346,
        id = 2,
        scale = 3
    },
    [3] = {
        settlementName = "Caras Sant",
        casModel = 'Caras_Sant',
        casFile = 'caras_sant/caras_sant_mesh.cas',
        xCoord = 442,
        yCoord = 321,
        id = 3,
        scale = 1
    }
}

genericCasModels = {
    --  [1] = {
    --     casModel = 'Old_Forest',
    --     casFile = 'old_forest/old_forest_mesh.cas',
    --     xCoord = 154,
    --     yCoord = 376,
    --     id = 100,
    --     scale = 1
    -- },
    [1] = {
        casModel = 'Arnorian_Ruin',
        casFile = 'arnorian_ruin/arnorian_ruin_mesh.cas',
        xCoord = nil,
        yCoord = nil,
        id = 101,
        scale = 1
    },
    [2] = {
        casModel = 'Forsaken_Inn',
        casFile = 'forsaken_inn/forsaken_inn_mesh.cas',
        xCoord = 186,
        yCoord = 381,
        id = 102,
        scale = 1
    },
    [3] = {
        casModel = 'Dunland_Menhir',
        casFile = 'dunland_menhir/dunland_menhir_mesh.cas',
        coords = {
            {
                xCoord = 224,
                yCoord = 308,
            },
            {
                xCoord = 209,
                yCoord = 323,
            },
            {
                xCoord = 216,
                yCoord = 298,
            },
            {
                xCoord = 200,
                yCoord = 310,
            },
            {
                xCoord = 215,
                yCoord = 299,
            }
        },
        id = 103,
        scale = 1
    },
}

function loadSettlementCasModels()
    log('Start: Loading settlement cas models...')

    if SETTLEMENT_CAS_MODELS_LOADED == true then log('Settlement cas models already loaded') return end

    -- Settlement Models
    for i=1, #settlementCasModels do
        local model = settlementCasModels[i]

        if not model.casFile then return end

        log('Loading settlement model: '..model.casModel)
        stratmap.objects.addModelToGame(
            "/youneuoy_Data/plugins/lua/Bree/models/settlements/"..model.casFile,
            model.id
        );
    end
    for i=1, #genericCasModels do
        local model = genericCasModels[i]
        log('Loading genericCasModel: '..model.casModel)

        stratmap.objects.addModelToGame(
            "/youneuoy_Data/plugins/lua/Bree/models/generic/"..model.casFile,
            model.id
        );
    end
    SETTLEMENT_CAS_MODELS_LOADED = true
    log('End: Loading settlement cas models...')
end

function loadCharacterCasModels(modName)
    log('Start: Loading character cas models...')

    if CHAR_CAS_MODELS_LOADED == true then log('Character cas models already loaded') return end

    -- Character models
    for i=1, #characterCasModels do
        local model = characterCasModels[i]
        if  model.casFile then
            log('Loading '..model.casModel)

            stratmap.objects.addCharacterCas(
                "strat_named_with_army",
                "mods/"..modName.."/youneuoy_Data/plugins/lua/Bree/models/characters/"..model.casFile,
                "mods/"..modName.."/youneuoy_Data/plugins/lua/Bree/models/shadow_sword.cas",
                model.casModel,
                "mods/"..modName.."/youneuoy_Data/plugins/lua/Bree/models/characters/"..model.textureFile
            );
        end
    end
    CHAR_CAS_MODELS_LOADED = true
    log('End: Loading character cas models...')
end

function setCasModels()
    -- Character models
    for i=1, #characterCasModels do
        if not characterCasModels[i] then return end
        local isAlive, namedCharacter = isCharacterAlive(
            characterCasModels[i].charLabel,
            characterCasModels[i].faction
        )
        if isAlive and namedCharacter then
            log('Setting cas model '..characterCasModels[i].casModel..' for character with label '..characterCasModels[i].charLabel)
            if characterCasModels[i].charLabel == 'PLAYER_CHARACTER' then
                characterCasModels[i].casModel = PLAYER.casModel
                characterCasModels[i].displayName = PLAYER.name
            end
            namedCharacter.character:setCharacterModel(characterCasModels[i].casModel)
            namedCharacter.localizedDisplayName = characterCasModels[i].displayName
        end
    end

    -- stratmap.objects.setModel(170, 346, 2, 2)
    -- stratmap.objects.setModel(116, 351, 1, 1)

    -- Settlement Models
    for i=1, #settlementCasModels do
        local model = settlementCasModels[i]

        if model.settlementName then
            log('Setting cas model for settlement '..model.settlementName..' with scale '..model.scale)

            local settlement = getSettlementbyName(model.settlementName)
            if settlement then
                stratmap.objects.setModel(settlement.xCoord, settlement.yCoord, model.id, model.id)
                stratmap.objects.setModel(442,321, 3, 3)
            end
        end
    end

    -- Generic models
    for i=1, #genericCasModels do
        local model = genericCasModels[i]

        -- Single coords
        if model.xCoord and model.yCoord and model.casModel and model.id then
        log('Setting generic cas model '..model.casModel..' with scale '..model.scale..' at '..model.xCoord.." "..model.yCoord)
            stratmap.objects.startDrawModelAt(model.id, model.xCoord, model.yCoord, model.scale)
        end

        -- Multiple coords
        if model.coords then
            for y=1, #model.coords do
                log('Setting generic cas model '..model.casModel..' with scale '..model.scale..' at '..model.coords[y].xCoord.." "..model.coords[y].yCoord)
                stratmap.objects.startDrawModelAt(model.id, model.coords[y].xCoord, model.coords[y].yCoord, model.scale)
            end
        end
    end
end