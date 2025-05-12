
-------------------------------------------------------------------------------------------------------------------
-- Spell mappings allow defining a general category or description that each of sets of related
-- spells all fall under.
-------------------------------------------------------------------------------------------------------------------
spell_maps = {
    ['Cure']='Cure',['Cure II']='Cure',['Cure III']='Cure',['Cure IV']='Cure',['Cure V']='Cure',['Cure VI']='Cure',
    ['Full Cure']='Cure',
    ['Cura']='Curaga',['Cura II']='Curaga',['Cura III']='Curaga',
    ['Curaga']='Curaga',['Curaga II']='Curaga',['Curaga III']='Curaga',['Curaga IV']='Curaga',['Curaga V']='Curaga',
    -- Status Removal doesn't include Esuna or Sacrifice, since they work differently than the rest
    ['Poisona']='StatusRemoval',['Paralyna']='StatusRemoval',['Silena']='StatusRemoval',['Blindna']='StatusRemoval',['Cursna']='StatusRemoval',
    ['Stona']='StatusRemoval',['Viruna']='StatusRemoval',['Erase']='StatusRemoval',
    -- Barelements
    ['Barfire']='BarElement',['Barstone']='BarElement',['Barwater']='BarElement',['Baraero']='BarElement',['Barblizzard']='BarElement',['Barthunder']='BarElement',
    ['Barfira']='BarElement',['Barstonra']='BarElement',['Barwatera']='BarElement',['Baraera']='BarElement',['Barblizzara']='BarElement',['Barthundra']='BarElement',
    -- Barstatus
    ['Baramnesia']='BarStatus',['Barvirus']='BarStatus',['Barparalyze']='BarStatus',['Barsilence']='BarStatus',['Barpetrify']='BarStatus',['Barpoison']='BarStatus',['Barblind']='BarStatus',['Barsleep']='BarStatus',
    ['Barvira']='BarStatus',['Barparalyzra']='BarStatus',['Barsilencere']='BarStatus',['Barpetra']='BarStatus',['Barpoisonra']='BarStatus',['Barblindra']='BarStatus',['Barsleepra']='BarStatus',
    -- Remove-KO
    ['Raise']='Raise',['Raise II']='Raise',['Raise III']='Raise',['Arise']='Raise',
    -- Bar-KO
    ['Reraise']='Reraise',['Reraise II']='Reraise',['Reraise III']='Reraise',['Reraise IV']='Reraise',
    -- Pro/Shell
    ['Protect']='Protect',['Protect II']='Protect',['Protect III']='Protect',['Protect IV']='Protect',['Protect V']='Protect',
    ['Shell']='Shell',['Shell II']='Shell',['Shell III']='Shell',['Shell IV']='Shell',['Shell V']='Shell',
    ['Protectra']='Protectra',['Protectra II']='Protectra',['Protectra III']='Protectra',['Protectra IV']='Protectra',['Protectra V']='Protectra',
    ['Shellra']='Shellra',['Shellra II']='Shellra',['Shellra III']='Shellra',['Shellra IV']='Shellra',['Shellra V']='Shellra',
    -- Regen/Refresh
    ['Regen']='Regen',['Regen II']='Regen',['Regen III']='Regen',['Regen IV']='Regen',['Regen V']='Regen',
    ['Refresh']='Refresh',['Refresh II']='Refresh',['Refresh III']='Refresh',
    ['Teleport-Holla']='Teleport',['Teleport-Dem']='Teleport',['Teleport-Mea']='Teleport',['Teleport-Altep']='Teleport',['Teleport-Yhoat']='Teleport',
    ['Teleport-Vahzl']='Teleport',['Recall-Pashh']='Teleport',['Recall-Meriph']='Teleport',['Recall-Jugner']='Teleport',
    ['Valor Minuet']='Minuet',['Valor Minuet II']='Minuet',['Valor Minuet III']='Minuet',['Valor Minuet IV']='Minuet',['Valor Minuet V']='Minuet',
    ["Knight's Minne"]='Minne',["Knight's Minne II"]='Minne',["Knight's Minne III"]='Minne',["Knight's Minne IV"]='Minne',["Knight's Minne V"]='Minne',
    ['Advancing March']='March',['Victory March']='March',
    ['Sword Madrigal']='Madrigal',['Blade Madrigal']='Madrigal',
    ["Hunter's Prelude"]='Prelude',["Archer's Prelude"]='Prelude',
    ['Sheepfoe Mambo']='Mambo',['Dragonfoe Mambo']='Mambo',
    ['Raptor Mazurka']='Mazurka',['Chocobo Mazurka']='Mazurka',
    ['Sinewy Etude']='Etude',['Dextrous Etude']='Etude',['Vivacious Etude']='Etude',['Quick Etude']='Etude',['Learned Etude']='Etude',['Spirited Etude']='Etude',['Enchanting Etude']='Etude',
    ['Herculean Etude']='Etude',['Uncanny Etude']='Etude',['Vital Etude']='Etude',['Swift Etude']='Etude',['Sage Etude']='Etude',['Logical Etude']='Etude',['Bewitching Etude']='Etude',
    ["Mage's Ballad"]='Ballad',["Mage's Ballad II"]='Ballad',["Mage's Ballad III"]='Ballad',
    ["Army's Paeon"]='Paeon',["Army's Paeon II"]='Paeon',["Army's Paeon III"]='Paeon',["Army's Paeon IV"]='Paeon',["Army's Paeon V"]='Paeon',["Army's Paeon VI"]='Paeon',
    ['Fire Carol']='Carol',['Ice Carol']='Carol',['Wind Carol']='Carol',['Earth Carol']='Carol',['Lightning Carol']='Carol',['Water Carol']='Carol',['Light Carol']='Carol',['Dark Carol']='Carol',
    ['Fire Carol II']='Carol',['Ice Carol II']='Carol',['Wind Carol II']='Carol',['Earth Carol II']='Carol',['Lightning Carol II']='Carol',['Water Carol II']='Carol',['Light Carol II']='Carol',['Dark Carol II']='Carol',
    ['Foe Lullaby']='Lullaby',['Foe Lullaby II']='Lullaby',['Horde Lullaby']='Lullaby',['Horde Lullaby II']='Lullaby',
    ['Fire Threnody']='Threnody',['Ice Threnody']='Threnody',['Wind Threnody']='Threnody',['Earth Threnody']='Threnody',['Lightning Threnody']='Threnody',['Water Threnody']='Threnody',['Light Threnody']='Threnody',['Dark Threnody']='Threnody',
    ['Fire Threnody II']='Threnody',['Ice Threnody II']='Threnody',['Wind Threnody II']='Threnody',['Earth Threnody II']='Threnody',['Lightning Threnody II']='Threnody',['Water Threnody II']='Threnody',['Light Threnody II']='Threnody',['Dark Threnody II']='Threnody',
    ['Battlefield Elegy']='Elegy',['Carnage Elegy']='Elegy',
    ['Foe Requiem']='Requiem',['Foe Requiem II']='Requiem',['Foe Requiem III']='Requiem',['Foe Requiem IV']='Requiem',['Foe Requiem V']='Requiem',['Foe Requiem VI']='Requiem',['Foe Requiem VII']='Requiem',
    ['Utsusemi: Ichi']='Utsusemi',['Utsusemi: Ni']='Utsusemi',['Utsusemi: San']='Utsusemi',
    ['Katon: Ichi'] = 'ElementalNinjutsu',['Suiton: Ichi'] = 'ElementalNinjutsu',['Raiton: Ichi'] = 'ElementalNinjutsu',
    ['Doton: Ichi'] = 'ElementalNinjutsu',['Huton: Ichi'] = 'ElementalNinjutsu',['Hyoton: Ichi'] = 'ElementalNinjutsu',
    ['Katon: Ni'] = 'ElementalNinjutsu',['Suiton: Ni'] = 'ElementalNinjutsu',['Raiton: Ni'] = 'ElementalNinjutsu',
    ['Doton: Ni'] = 'ElementalNinjutsu',['Huton: Ni'] = 'ElementalNinjutsu',['Hyoton: Ni'] = 'ElementalNinjutsu',
    ['Katon: San'] = 'ElementalNinjutsu',['Suiton: San'] = 'ElementalNinjutsu',['Raiton: San'] = 'ElementalNinjutsu',
    ['Doton: San'] = 'ElementalNinjutsu',['Huton: San'] = 'ElementalNinjutsu',['Hyoton: San'] = 'ElementalNinjutsu',
    ['Banish']='Banish',['Banish II']='Banish',['Banish III']='Banish',['Banishga']='Banish',['Banishga II']='Banish',
    ['Holy']='Holy',['Holy II']='Holy',['Drain']='Drain',['Drain II']='Drain',['Drain III']='Drain',['Aspir']='Aspir',['Aspir II']='Aspir',
    ['Absorb-Str']='Absorb',['Absorb-Dex']='Absorb',['Absorb-Vit']='Absorb',['Absorb-Agi']='Absorb',['Absorb-Int']='Absorb',['Absorb-Mnd']='Absorb',['Absorb-Chr']='Absorb',
    ['Absorb-Acc']='Absorb',['Absorb-TP']='Absorb',['Absorb-Attri']='Absorb',
    ['Enlight']='Enlight',['Enlight II']='Enlight',['Endark']='Endark',['Endark II']='Endark',
    ['Burn']='ElementalEnfeeble',['Frost']='ElementalEnfeeble',['Choke']='ElementalEnfeeble',['Rasp']='ElementalEnfeeble',['Shock']='ElementalEnfeeble',['Drown']='ElementalEnfeeble',
    ['Pyrohelix']='Helix',['Cryohelix']='Helix',['Anemohelix']='Helix',['Geohelix']='Helix',['Ionohelix']='Helix',['Hydrohelix']='Helix',['Luminohelix']='Helix',['Noctohelix']='Helix',
    ['Pyrohelix II']='Helix',['Cryohelix II']='Helix',['Anemohelix II']='Helix',['Geohelix II']='Helix',['Ionohelix II']='Helix',['Hydrohelix II']='Helix',['Luminohelix II']='Helix',['Noctohelix II']='Helix',
    ['Firestorm']='Storm',['Hailstorm']='Storm',['Windstorm']='Storm',['Sandstorm']='Storm',['Thunderstorm']='Storm',['Rainstorm']='Storm',['Aurorastorm']='Storm',['Voidstorm']='Storm',
    ['Firestorm II']='Storm',['Hailstorm II']='Storm',['Windstorm II']='Storm',['Sandstorm II']='Storm',['Thunderstorm II']='Storm',['Rainstorm II']='Storm',['Aurorastorm II']='Storm',['Voidstorm II']='Storm',
    ['Fire Maneuver']='Maneuver',['Ice Maneuver']='Maneuver',['Wind Maneuver']='Maneuver',['Earth Maneuver']='Maneuver',['Thunder Maneuver']='Maneuver',['Water Maneuver']='Maneuver',['Light Maneuver']='Maneuver',['Dark Maneuver']='Maneuver',
    ['Enstone']='Enspell',['Enwater']='Enspell',['Enaero']='Enspell',['Enfire']='Enspell',['Enblizzard']='Enspell',['Enthunder']='Enspell',
	['Gain-AGI']='Gain',['Gain-CHR']='Gain',['Gain-DEX']='Gain',['Gain-INT']='Gain',['Gain-MND']='Gain',['Gain-STR']='Gain',['Gain-VIT']='Gain',

}

enfeeb_maps = {
    ['Dia']='potency', ['Dia II']='potency', ['Dia III']='potency',
    ['Bio']='potency', ['Bio II']='potency', ['Bio III']='potency',
    ['Paralyze']='mndpot', ['Paralyze II']='mndpot', 
    ['Slow']='mndpot', ['Slow II']='mndpot', 
    ['Addle']='mndpot', ['Addle II']='mndpot',
    ['Sleep']='macc', ['Sleep II']='macc', ['Sleepga']='macc', 
    ['Silence']='macc', 
    ['Inundation']='macc', 
    ['Dispel']='macc', 
    ['Break']='macc', 
    ['Bind']='macc', 
    ['Blind']='intpot', ['Blind II']='intpot', 
    ['Gravity']='potency', ['Gravity II']='potency',
    -- We leave Fazzle and FrazzleII as pure macc to help land it in cases its a high resist. 
    -- This lets us follow up with a high potency Frazzle3 
    ['Frazzle']='macc', ['Frazzle II']='macc', ['Frazzle III']='skillmndpot', 
    ['Distract']='skillmndpot', ['Distract II']='skillmndpot', ['Distract III']='skillmndpot', 
    ['Poison']='skillpot', ['Poison II']='skillpot', ['Poisonga']='skillpot',
	
}

blue_maps = {
	['Pollen']='heal',['Sandspin']='nuke',['Foot Kick']='phys',['Sprout Smack']='phys',['Wild Oats']='phys',['Power Attack']='phys',['Cocoon']='buff',
	['Metallic Body']='buff',['Queasyshroom']='phys',['Battle Dance']='phys',['Feather Storm']='phys',['Head Butt']='phys',['Healing Breeze']='heal',
	['Sheep Song']='enm',['Helldive']='phys',['Cursed Sphere']='nuke',['Blastbomb']='nuke',['Bludgeon']='phys',['Blood Drain']='macc',['Claw Cyclone']='phys',
	['Poison Breath']='nuke',['Soporific']='macc',['Screwdriver']='phys',['Bomb Toss']='nuke',['Grand Slam']='phys',['Wild Carrot']='heal',['Chaotic Eye']='macc',
	['Sound Blast']='macc',['Death Ray']='nuke',['Smite of Rage']='phys',['Digest']='macc',['Pinecone Bomb']='phys',['Blank Gaze']='enm',['Jet Stream']='phys',
	['Uppercut']='phys',['Mysterious Light']='nuke',['Terror Touch']='phys',['MP Drainkiss']='macc',['Venom Shell']='macc',['Stinking Gas']='macc',
	['Blitzstrahl']='nuke',['Mandibular Bite']='phys',['Awful Eye']='macc',['Geist Wall']='enm',['Magnetite Cloud']='nuke',['Jettatura']='enm',['Blood Saber']='macc',
	['Refueling']='buff',['Sickle Slash']='phys',['Ice Break']='nuke',['Self-Destruct']='nuke',['Frightful Roar']='macc',['Cold Wave']='macc',
	['Filamented Hold']='macc',['Hecatomb Wave']='nuke',['Radiant Breath']='nuke',['Feather Barrier']='buff',['Light of Penance']='macc',['Flying Hip Press']='nuke',
	['Magic Fruit']='heal',
	
}

-- Set Macros for your RUN's macro page, book.
function set_macros(sheet,book)
    if book then 
        send_command('@input /macro book '..tostring(book)..';wait .1;input /macro set '..tostring(sheet))
        return
    end
    send_command('@input /macro set '..tostring(sheet))
end

hud_padding = 10

pName = player.name
-- Saying hello
windower.add_to_chat(8,'----- Welcome back to your RUN.lua, '..pName..' -----')

--------------------------------------------------------------------------------------------------------------
-- HUD STUFF
--------------------------------------------------------------------------------------------------------------
-- Colors for Text
Colors = {
    ["Fire"] = "\\cs(204, 0, 0)", 
    ["Water"] = "\\cs(0, 102, 204)", 
    ["Air"] = "\\cs(51, 102, 0)", 
    ["Light"] = "\\cs(255, 255, 255)", 
    ["Earth"] = "\\cs(139, 139, 19)", 
    ["Ice"] = "\\cs(0, 204, 204)", 
    ["Lightning"] = "\\cs(102, 0, 204)",
    ['Dark']="\\cs(92, 92, 92)"
}


textHideMode = M(false)
textHideOptions = M(false)
textHideJob = M(false)
textHideBattle = M(false)
textHideHUB = M(false)
useLightMode = M(false)
hud_bottom = false

const_on = "\\cs(32, 255, 32)ON\\cr"
const_off = "\\cs(255, 32, 32)OFF\\cr"

hud_x_pos_og = hud_x_pos
hud_y_pos_og = hud_y_pos
hud_font_size_og = hud_font_size
hud_padding_og = hud_padding
hud_transparency_og = hud_transparency

--time_start = 0

-- Standard Mode
hub_mode_std = [[\cs(255, 115, 0)Modes: \cr              
\cs(255, 255, 64)${key_bind_idle} \cs(200, 200, 200)Idle:\cr \cs(125,125,255)${player_current_idle|Refresh}
\cs(255, 255, 64)${key_bind_melee} \cs(200, 200, 200)Melee:\cr \cs(125,125,255)${player_current_melee|Refresh}
\cs(255, 255, 64)${key_bind_mainweapon} \cs(200, 200, 200)Main Weapon:\cr \cs(125,125,255)${player_current_mainweapon|Epeolatry}
\cs(255, 255, 64)${key_bind_subweapon} \cs(200, 200, 200)Sub Weapon:\cr \cs(125,125,255)${player_current_subweapon|Utu Grip}
\cs(255, 255, 64)${key_bind_cast}\cs(200, 200, 200)Cast:\cr \cs(125,125,255)${toggle_cast_cycle|Normal}
]]

hub_options_std = [[ \cs(255, 115, 0)Options: \cr         
\cs(255, 255, 64)${key_bind_lock_weapon} \cs(200, 200, 200)Lock Weapon:\cr ${toggle_lock_weapon}
\cs(255, 255, 64)${key_bind_movespeed_lock}\cs(200, 200, 200)Carm Cuisses:\cr ${toggle_movespeed_lock}
]]

hub_job_std = [[ \cs(255, 115, 0)${player_job}: \cr             
\cs(255, 255, 64)${key_bind_rune} \cs(200, 200, 200)Rune:\cr ${rune_color|\\cs(0, 204, 204)}${toggle_rune_cycle|Ice}	
]]

hub_battle_std = [[ \cs(255, 115, 0)Battle: \cr	

	]]

-- LITE Mode
hub_mode_lte = [[ \cs(255, 115, 0) == Modes: \cr              \cs(255, 255, 64)${key_bind_idle} \cs(200, 200, 200)Idle:\cr \cs(125,125,255)${player_current_idle|Refresh}              \cs(255, 255, 64)${key_bind_melee} \cs(200, 200, 200)Melee:\cr \cs(125,125,255)${player_current_melee|Refresh}              \cs(255, 255, 64)${key_bind_mainweapon} \cs(200, 200, 200)Main / Sub Weapon:\cr \cs(125,125,255)${player_current_mainweapon|Epeolatry} / ${player_current_subweapon|Utu Grip}	\cs(255, 255, 64)${key_bind_cast} \cs(200, 200, 200)Cast:\cr \cs(125,125,255)${toggle_cast_cycle|Normal} ]]


hub_options_lte = [[ \cs(255, 115, 0)== Options: \cr              \cs(255, 255, 64)${key_bind_lock_weapon} \cs(200, 200, 200)Lock Weapon:\cr ${toggle_lock_weapon}            \cs(255, 255, 64)${key_bind_movespeed_lock}\cs(200, 200, 200)Carm. Cuisses:\cr ${toggle_movespeed_lock} ]]

hub_job_lte = [[ \cs(255, 115, 0) == ${player_job}: \cr             \cs(255, 255, 64)${key_bind_rune} \cs(200, 200, 200)Rune:\cr ${rune_color|\\cs(0, 204, 204)}${toggle_rune_cycle|Ice}]]

hub_battle_lte = [[ \cs(255, 115, 0) == Battle: \cr]]


-- init style
hub_mode = hub_mode_std
hub_options = hub_options_std
hub_job = hub_job_std
hub_battle = hub_battle_std
--[[
    This gets passed in when the Keybinds are turned off.
    For not it simply sets the variable to an empty string
    (Researching better way to handle this)
]]
keybinds_off = {}
keybinds_off['key_bind_idle'] = '       '
keybinds_off['key_bind_melee'] = '       '
keybinds_off['key_bind_mainweapon'] = '       '
keybinds_off['key_bind_subweapon'] = '       '

keybinds_off['key_bind_lock_weapon'] = '       '
keybinds_off['key_bind_movespeed_lock'] = '        '
keybinds_off['key_bind_rune'] = '        '
keybinds_off['key_bind_cast'] = '        '

function validateTextInformation()

    --Mode Information
    main_text_hub.player_current_idle = idleModes.current
    main_text_hub.player_current_melee = meleeModes.current
    main_text_hub.player_current_mainweapon = mainWeapon.current
    main_text_hub.player_current_subweapon = subWeapon.current
    main_text_hub.player_job = player.job
    if meleeing.value then
        main_text_hub.toggle_lock_weapon = const_off
    else
        main_text_hub.toggle_lock_weapon = const_on
    end

    if runspeed.value then
        main_text_hub.toggle_movespeed_lock =  const_on
    else
        main_text_hub.toggle_movespeed_lock =  const_off
    end
    
    if keybinds.value then
        texts.update(main_text_hub, keybinds_on)
    else 
        texts.update(main_text_hub, keybinds_off)
    end
	main_text_hub.rune_color = Colors[runeElements.current]
	main_text_hub.toggle_rune_cycle = runeElements.current
	main_text_hub.toggle_cast_cycle = castModes.current

end

--Default To Set Up the Text Window
function setupTextWindow()

    local default_settings = {}
    default_settings.pos = {}
    default_settings.pos.x = hud_x_pos
    default_settings.pos.y = hud_y_pos
    default_settings.bg = {}

    default_settings.bg.alpha = hud_transparency
    default_settings.bg.red = 40
    default_settings.bg.green = 40
    default_settings.bg.blue = 55
    default_settings.bg.visible = true
    default_settings.flags = {}
    default_settings.flags.right = false
    default_settings.flags.bottom = false
    default_settings.flags.bold = true
    default_settings.flags.draggable = hud_draggable
    default_settings.flags.italic = false
    default_settings.padding = hud_padding
    default_settings.text = {}
    default_settings.text.size = hud_font_size
    default_settings.text.font = hud_font
    default_settings.text.fonts = {}
    default_settings.text.alpha = 255
    default_settings.text.red = 147
    default_settings.text.green = 161
    default_settings.text.blue = 161
    default_settings.text.stroke = {}
    default_settings.text.stroke.width = 1
    default_settings.text.stroke.alpha = 255
    default_settings.text.stroke.red = 0
    default_settings.text.stroke.green = 0
    default_settings.text.stroke.blue = 0

    --Creates the initial Text Object will use to create the different sections in
    if not (main_text_hub == nil) then
        texts.destroy(main_text_hub)
    end
    main_text_hub = texts.new('', default_settings, default_settings)

    --Appends the different sections to the main_text_hub
    texts.append(main_text_hub, hub_mode)
    texts.append(main_text_hub, hub_options)
    texts.append(main_text_hub, hub_job)
    texts.append(main_text_hub, hub_battle)
    --We then do a quick validation
    validateTextInformation()
	toggleHudStyle(useLightMode.value)
    --Finally we show this to the user
    main_text_hub:show()
    
end
--[[
    This handles hiding the different sections
]]
function hideTextSections()

    --For now when hiding a section its easier to recreate the entire window
    texts.clear(main_text_hub)
    
    --Below we check to make sure this is true by default these are false
    if not textHideMode.value then
        texts.append(main_text_hub, hub_mode)

    end
    if not textHideOptions.value then
        texts.append(main_text_hub, hub_options)
    end
    if not textHideJob.value then
        texts.append(main_text_hub, hub_job)
    end
    if not textHideBattle.value then
        texts.append(main_text_hub, hub_battle)
    end
    validateTextInformation()

end

function toggleHudStyle( useLightMode )
    texts.clear(main_text_hub)
    if useLightMode then
        hud_x_pos = 0     
        hud_y_pos = 0
        hud_font_size = 8
        hud_padding = 2
        hud_transparency = 0
        hud_strokewidth = 2
        hub_options = hub_options_lte
        hub_mode = hub_mode_lte
        hub_job = hub_job_lte
        hub_battle = hub_battle_lte
    else
        hud_x_pos = hud_x_pos_og
        hud_y_pos = hud_y_pos_og
        hud_font_size = hud_font_size_og
        hud_padding = hud_padding_og
        hud_transparency = hud_transparency_og
        hud_strokewidth = 1
        hub_options = hub_options_std
        hub_mode = hub_mode_std
        hub_battle = hub_battle_std
        hub_job = hub_job_std
    end
    texts.pos(main_text_hub, hud_x_pos, hud_y_pos)
    texts.size(main_text_hub, hud_font_size)
    texts.pad(main_text_hub, hud_padding)
    texts.bg_alpha(main_text_hub, hud_transparency)
    texts.stroke_width(main_text_hub, hud_strokewidth)      
    hideTextSections()
end
--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------

function hud_command(command)
 
    local commandArgs = command
    
    if #commandArgs:split(' ') >= 2 then
        commandArgs = T(commandArgs:split(' '))
        
        if commandArgs[1]:lower() == "hud" then --First variable is hide lets find out what

            if commandArgs[2]:lower() == "hide" then -- Hides/Shows the HUB
                textHideHUB:toggle()

                if textHideHUB.value == true then
                    texts.hide(main_text_hub)
                else 
                    texts.show(main_text_hub)
                end

                hideTextSections()
            elseif commandArgs[2]:lower() == "keybinds" then --Hides/Show Keybinds
                keybinds:toggle()

                if keybinds.value then
                    texts.update(main_text_hub, keybinds_on) --If ON then we pass in Table for keybinds to update the variables
                else 
                    texts.update(main_text_hub, keybinds_off) --Otherwise we set them to blank
                end

                hideTextSections()
            elseif commandArgs[2]:lower() == "hidemodes" then --Hides the Mode
                textHideMode:toggle()
                hideTextSections()
            elseif commandArgs[2]:lower() == "hideoptions" then --Hides/Show Scholar sectio
                textHideOptions:toggle()
                hideTextSections()
            elseif commandArgs[2]:lower() == "hidejob" then --Hides/Show Battle section
                textHideJob:toggle()
                hideTextSections()
            elseif commandArgs[2]:lower() == "hidebattle" then --Hides/Show Battle section
                textHideBattle:toggle()
                hideTextSections()
            elseif commandArgs[2]:lower() == "lite" then --Hides/Show Options
                useLightMode:toggle()
                toggleHudStyle(useLightMode.value)
            
            end
        end
    end
end



runeElements =  M('Ice', 'Air', 'Earth', 'Lightning', 'Water', 'Fire','Light','Dark')
runes ={['Ice']="Gelus",['Air']="Flabra",['Earth']="Tellus",['Lightning']="Sulpor",['Water']="Unda",['Fire']="Ignis",['Light']="Lux",['Dark']="Tenebrae"}

meleeing = M(true)
runspeed = M(false)
keybinds = M(false)
deathresist	= M(false)

if use_UI == true then
    setupTextWindow()
else   
    windower.add_to_chat(211,'Idle mode now set to: '..tostring(idleModes.current))     
end

Buff = 
    {
		['Inspiration'] = false,
		['Burst Affinity'] = false
    }
    
-- Get a spell mapping for the spell.
function get_spell_map(spell)
    return spell_maps[spell.name]
end
-- Get a spell mapping for blue magic.
function get_blue_map(spell)
	return blue_maps[spell.name]
end
-- Reset the state vars tracking strategems.
function update_active_ja(name, gain)
    Buff['Inspiration'] = buffactive['Valiance'] or buffactive['Vallation'] or false
	Buff['Burst Affinity'] = buffactive['Burst Affinity'] or false
end

function buff_refresh(name,buff_details)
    if use_UI == true then
        validateTextInformation()
    end
end

function sub_job_change(new,old)
	send_command('wait 2;input /lockstyleset 3')
end


function buff_change(name,gain,buff_details)
    if use_UI == true then
        validateTextInformation()
    end
end
 
function precast(spell)

    local spellMap = get_spell_map(spell)
    
    update_active_ja()
    local spell_recasts = windower.ffxi.get_spell_recasts()

    -- Auto use Echo Drops if you are trying to cast while silenced --    
    if spell.action_type == 'Magic' and buffactive['Silence'] then 
        cancel_spell()
        send_command('input /item "Echo Drops" <me>')     
        add_to_chat(8, '****** ['..spell.name..' CANCELLED - Using Echo Drops] ******')
        return        
    end       

    if spell.action_type  == 'Magic' and spell_recasts[spell.recast_id] > 0 then
        cancel_spell()
        add_to_chat(8, '****** ['..spell.name..' CANCELLED - Spell on Cooldown.] ******')
        return
    end

    -- Moving on to other types of magic
    if spell.type:contains('Magic') or spell.type == 'Ninjutsu' then
     
        -- Stoneskin Precast
        if spell.name == 'Stoneskin' then
         
            windower.ffxi.cancel_buff(37)--[[Cancels stoneskin, not delayed incase you get a Quick Cast]]
            equip(sets.precast.stoneskin)
             
        -- Cure Precast
        elseif spell.name:match('Cure') or spell.name:match('Cura') then
         
            equip(sets.precast.cure)         
        -- Enhancing Magic
        elseif spell.skill == 'Enhancing Magic' then
         
            equip(sets.precast.enhancing)            
            if spell.name == 'Sneak' and spell.target.type == 'SELF' then
                windower.ffxi.cancel_buff(71)--[[Cancels Sneak]]
            end
        elseif spellMap == 'Utsusemi' then
            if buffactive['Copy Image (3)'] or buffactive['Copy Image (4+)'] then
                cancel_spell()
                add_to_chat(123, '**!! '..spell.english..' Canceled: [3+ IMAGES] !!**')
            elseif buffactive['Copy Image'] or buffactive['Copy Image (2)'] then
                send_command('cancel 66; cancel 444; cancel Copy Image; cancel Copy Image (2)')
            end
            equip(sets.precast.casting)

        else
			if Buff['Inspiration'] then
				equip(sets.precast.casting.inspiration)
			else
            	-- For everything else we go with max fastcast
            	equip(sets.precast.casting)
			end
        end
    end
    -- Job Abilities
    -- We use a catch all here, if the set exists for an ability, use it
    -- This way we don't need to write a load of different code for different abilities, just make a set
	if spell.name == 'Lunge' or 'Swipe' then
		equip(sets.me.lunge[lungeModes.current])
	end
	
    if sets.precast[spell.name] then
        equip(sets.precast[spell.name])        
    end
end
 
function midcast(spell)
    -- Get the spell mapping, since we'll be passing it to various functions and checks.
    local spellMap = get_spell_map(spell)

    -- No need to annotate all this, it's fairly logical. Just equips the relevant sets for the relevant magic
    -- Curing
    if spell.name:match('Cure') or spell.name:match('Cura') then
        if spell.element == world.weather_element or spell.element == world.day_element then
            if spell.target.type == "SELF" then
				equip(sets.midcast.cure.weather.self)
			else
				equip(sets.midcast.cure.weather)
			end
        else
			if spell.target.type == "SELF" then
				equip(sets.midcast.cure.normal.self)
			else
            	equip(sets.midcast.cure.normal)
			end
        end

    -- Enhancing
    elseif spell.skill == 'Enhancing Magic' then

        if spell.name:match('Protect') or spell.name:match('Shell') then
	    	equip(sets.midcast.enhancing.duration,{rring="Sheltered Ring"})		
        elseif spell.name:match('Refresh') then
            equip(sets.midcast.refresh)
        elseif spell.name:match('Regen') then
            equip(sets.midcast.regen)
        elseif spell.name:match('Phalanx') then
            equip(sets.midcast.phalanx)
        elseif spell.name:match('Stoneskin') then
            equip(sets.midcast.stoneskin)
		elseif spell.name:match('Aquaveil') then
			equip(sets.midcast.aquaveil)
        elseif spell.name:match('Temper') then
            equip(sets.midcast.enhancing.potency)
        else
            equip(sets.midcast.enhancing.duration) -- fall back to duration if not specified above 
        end
	elseif spell.skill == 'Divine Magic' then
		if spell.name:match('Flash') then
			equip(sets.midcast.divine.recast)
		end
	-- Blue Magic
	elseif spell.type == 'BlueMagic' then
		local blueMap = get_blue_map(spell)
		if blueMap == 'nuke' then
			if Buff[BurstAffinity] then
				equip(sets.midcast.blue.nuke.mb)
			end
		elseif blueMap == 'heal' and spell.target.type == "SELF" then
			equip(sets.midcast.blue.heal.me)
		elseif blueMap == 'enm' then
			equip(sets.midcast.blue.enm)
		else
			equip(sets.midcast.blue[blueMap])
		end
    -- Fail safe
    elseif spell.type ~= "WeaponSkill" then
        equip(sets.midcast.casting)
    end
    -- And our catch all, if a set exists for this spell name, use it
    if sets.midcast[spell.name] then
        equip(sets.midcast[spell.name])
    -- Catch all for tiered spells (use mapping), basically if no set for spell name, check set for spell mapping. AKA Drain works for all Drain tiers.
    elseif sets.midcast[spellMap] then
        equip(sets.midcast[spellMap])
    end
    
    --SIRD
    if castModes.current == 'sird' then
		if sets.midcast[spell.name] then
			equip(sets.midcast[spell.name][sird])
		elseif sets.midcast[spellMap] then
			equip(sets.midcast[spellMap][sird])
		else
			equip(sets.midcast.sird)
		end
	end
    -- Weapon skills
    -- sets.me["Insert Weaponskill"] are basically how I define any non-magic spells sets, aka, WS, JA, Idles, etc.
    if sets.me[spell.name] then
        equip(sets.me[spell.name])

        -- Sanguine BBlade belt optim
        if spell.name == 'Sanguine Blade' or spell.name == 'Aeolian Edge' then
            -- Dark day and dark weather
            if spell.element == world.day_element and spell.element == world.weather_element then
                equip(sets.midcast.Obi)
            -- Double dark weather aka Dynamis
            elseif spell.element == world.weather_element and get_weather_intensity() == 2 then
                equip(sets.midcast.Obi)
            else
                equip(sets.midcast.Orpheus)                
            end
        end
    end
end

function aftercast(spell) 

    -- Then initiate idle function to check which set should be equipped
    update_active_ja()
    idle()
end

function idle()
    -- This function is called after every action, and handles which set to equip depending on what we're doing
    -- We check if we're meleeing because we don't want to idle in melee gear when we're only engaged for trusts
    if player.status=='Engaged' then
        if subWeapon.current:match('Shield') or subWeapon.current:match('Bulwark') or subWeapon.current:match('Buckler') then
            equip(sets.me.melee[meleeModes.value..'sw'])
        else
            equip(sets.me.melee[meleeModes.value..'2hn'])
        end
    else
        equip(sets.me.idle[idleModes.value])
        -- Checks MP for Fucho-no-Obi
    end
    equip({main = mainWeapon.current, sub = subWeapon.current})
end
 
function status_change(new,old)
    if new == 'Engaged' then  
        -- If we engage check our meleeing status
        idle()     
    elseif new=='Resting' then
        -- We're resting
        equip(sets.me.resting)          
    else
        idle()
    end
end

function self_command(command)
    hud_command(command)
    local commandArgs = command
     
    if #commandArgs:split(' ') >= 2 then
        commandArgs = T(commandArgs:split(' '))
        
        if commandArgs[1] == 'toggle' then
            if commandArgs[2] == 'melee' then
                -- //gs c toggle melee will toggle melee mode on and off.
                -- This basically locks the slots that will cause you to lose TP if changing them,
                -- As well as equip your melee set if you're engaged
                meleeing:toggle()
                lockMainHand(meleeing.value)

            elseif commandArgs[2] == 'runspeed' then
                runspeed:toggle()
                --updateRunspeedGear(runspeed.value) 

            elseif commandArgs[2] == 'idlemode' then
                idleModes:cycle()
                idle()
                if use_UI == true then
                    validateTextInformation()
                else
                    windower.add_to_chat(4,"----- Idle mode Now focus on: "..tostring(idleModes.value))
                end
            elseif commandArgs[2] == 'meleemode' then
                    meleeModes:cycle()
                    idle()
                    if use_UI == true then
                        validateTextInformation()
                    else
                        windower.add_to_chat(4,"----- Idle mode Now focus on: "..tostring(idleModes.value))
            end
            elseif commandArgs[2] == 'mainweapon' then
                if meleeing.value then
                    mainWeapon:cycle()
                    idle()
                    if use_UI == true then
                        validateTextInformation()
                    else
                        windower.add_to_chat(4,"----- Main Weapon set now: "..tostring(mainWeapon.value))
                    end
                end
            elseif commandArgs[2] == 'subweapon' then
                if meleeing.value then
                    subWeapon:cycle()
                    idle()
                    if use_UI == true then
                        validateTextInformation()
                    else
                        windower.add_to_chat(4,"----- Sub Weapons set now: "..tostring(subWeapon.value))
                    end
                end
			elseif commandArgs[2] == 'runeup' then
				runeElements:cycle()
				idle()
                    if use_UI == true then
                        validateTextInformation()
                    else
                        windower.add_to_chat(4,"----- Runes set to: "..tostring(runeElements.value))
                    end
			elseif commandArgs[2] == 'runedown' then
				runeElements:cycleback()
				idle()
                    if use_UI == true then
                        validateTextInformation()
                    else
                        windower.add_to_chat(4,"----- Runes set to: "..tostring(runeElements.value))
                    end
			elseif commandArgs[2] == 'cast' then
				castModes:cycle()
				if use_UI == true then
                        validateTextInformation()
                    else
                        windower.add_to_chat(4,"----- Casting set to: "..tostring(enmModes.value))
                    end
			end
		elseif commandArgs[1]:lower() == 'cast' then
			if commandArgs[2] == 'rune' then
				send_command('input /ja '..runes[runeElements.current]..' <me>')
			end
        
        end
    end
end

function updateRunspeedGear( value )   
    
    if not value then
        if use_UI == true then
            validateTextInformation()
        else
            windower.add_to_chat(8,"----- Locking Off Carmine Cuisses +1 -----")   
        end
        enable('legs')
        idle()
    else
        if use_UI == true then
            validateTextInformation()
        else
            windower.add_to_chat(8,"----- Locking On Carmine Cuisses +1 -----")
        end
        equip({legs="Carmine Cuisses +1"})
        disable('legs')
        idle()
    end
end

function lockMainHand( meleeing )   
    
    if meleeing then
        enable('main','sub')
        if use_UI == true then
            validateTextInformation()
        else
            windower.add_to_chat(8,'----- Weapons Unlocked, WILL LOSE TP -----')
        end
        idle()
    else
        disable('main','sub')
        if use_UI == true then
            validateTextInformation()
        else
            windower.add_to_chat(8,'----- Weapons Locked, WILL NOT LOSE TP -----')
        end

        idle()
    end
end


if player and player.index and windower.ffxi.get_mob_by_index(player.index) then

    mov = {counter=0}
    if player and player.index and windower.ffxi.get_mob_by_index(player.index) then
        mov.x = windower.ffxi.get_mob_by_index(player.index).x
        mov.y = windower.ffxi.get_mob_by_index(player.index).y
        mov.z = windower.ffxi.get_mob_by_index(player.index).z
    end
    moving = false

    windower.raw_register_event('prerender',function()
        mov.counter = mov.counter + 1;
        if mov.counter>30 then
            local pl = windower.ffxi.get_mob_by_index(player.index)
            if pl and pl.x and mov.x then
                local movement = math.sqrt( (pl.x-mov.x)^2 + (pl.y-mov.y)^2 + (pl.z-mov.z)^2 ) > 0.1
                if movement and not moving then
                    send_command('gs c toggle runspeed')
                    moving = true
                elseif not movement and moving then
                    send_command('gs c toggle runspeed')
                    moving = false
                end
            end

            if pl and pl.x then
                mov.x = pl.x
                mov.y = pl.y
                mov.z = pl.z
            end
            mov.counter = 0
        end
    end)


    function movingCheck()
        pSpeed = (player.x+player.y) - (pX+pY)
        if pSpeed ~= 0.0 or pSpeed > 0.25 or pSpeed < 0.25 then
            moving = true
        else
            moving = false
        end
    end
end

