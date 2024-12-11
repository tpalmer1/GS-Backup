--[[
        Custom commands:

        Because /sch can be a thing... I've opted to keep this part 

        Shorthand versions for each strategem type that uses the version appropriate for
        the current Arts.
                                        Light Arts              Dark Arts
        gs c scholar light              Light Arts/Addendum
        gs c scholar dark                                       Dark Arts/Addendum
        gs c scholar cost               Penury                  Parsimony
        gs c scholar speed              Celerity                Alacrity
        gs c scholar aoe                Accession               Manifestation
		gs c scholar power				Rapture					Ebullience
        gs c scholar addendum           Addendum: White         Addendum: Black
    
        Toggle Function: 
        gs c toggle melee               Toggle Melee mode on / off for locking of weapons
        gs c toggle idlemode            Toggles between Refresh, DT and MDT idle mode.
        gs c toggle nukemode            Toggles between Normal and Accuracy mode for midcast Nuking sets (MB included)  
        gs c toggle mainweapon			cycles main weapons in the list you defined below
		gs c toggle subweapon			cycles main weapons in the list you defined below

        Casting functions:
        these are to set fewer macros (1 cycle, 5 cast) to save macro space when playing lazily with controler
        
        gs c nuke cycle                 Cycles element type for nuking
        gs c nuke cycledown             Cycles element type for nuking in reverse order    
	    gs c nuke enspellup             Cycles element type for enspell
	    gs c nuke enspelldown			Cycles element type for enspell in reverse order 

        gs c nuke t1                    Cast tier 1 nuke of saved element 
        gs c nuke t2                    Cast tier 2 nuke of saved element 
        gs c nuke t3                    Cast tier 3 nuke of saved element 
        gs c nuke t4                    Cast tier 4 nuke of saved element 
        gs c nuke t5                    Cast tier 5 nuke of saved element 
        gs c nuke helix                 Cast helix2 nuke of saved element 
        gs c nuke storm                 Cast Storm buff of saved element  if /sch
	    gs c nuke enspell		        Cast enspell of saved enspell element		

        HUD Functions:
        gs c hud hide                   Toggles the Hud entirely on or off
        gs c hud hidemode               Toggles the Modes section of the HUD on or off
        gs c hud hidejob		        Toggles the Job section of the HUD on or off
        gs c hud lite			        Toggles the HUD in lightweight style for less screen estate usage. Also on ALT-END
        gs c hud keybinds               Toggles Display of the HUD keybindings (my defaults) You can change just under the binds in the Gearsets file. Also on CTRL-END

        // OPTIONAL IF YOU WANT / NEED to skip the cycles...  
        gs c nuke Ice                   Set Element Type to Ice DO NOTE the Element needs a Capital letter. 
        gs c nuke Air                   Set Element Type to Air DO NOTE the Element needs a Capital letter. 
        gs c nuke Dark                  Set Element Type to Dark DO NOTE the Element needs a Capital letter. 
        gs c nuke Light                 Set Element Type to Light DO NOTE the Element needs a Capital letter. 
        gs c nuke Earth                 Set Element Type to Earth DO NOTE the Element needs a Capital letter. 
        gs c nuke Lightning             Set Element Type to Lightning DO NOTE the Element needs a Capital letter. 
        gs c nuke Water                 Set Element Type to Water DO NOTE the Element needs a Capital letter. 
        gs c nuke Fire                  Set Element Type to Fire DO NOTE the Element needs a Capital letter. 
--]]

include('organizer-lib') -- optional
res = require('resources')
texts = require('texts')
include('Modes.lua')

-- Define your modes: 
-- You can add or remove modes in the table below, they will get picked up in the cycle automatically. 
-- to define sets for idle if you add more modes, name them: sets.me.idle.mymode and add 'mymode' in the group.
-- Same idea for nuke modes. 
idleModes = M('normal', 'dt', 'mdt')
meleeModes = M('normal', 'acc', 'dt', 'mdt','th','enspell')
nukeModes = M('normal', 'acc')

------------------------------------------------------------------------------------------------------
-- Important to read!
------------------------------------------------------------------------------------------------------
-- This will be used later down for weapon combos, here's mine for example, you can add your REMA+offhand of choice in there
-- Add you weapons in the Main list and/or sub list.
-- Don't put any weapons / sub in your IDLE and ENGAGED sets'
-- You can put specific weapons in the midcasts and precast sets for spells, but after a spell is 
-- cast and we revert to idle or engaged sets, we'll be checking the following for weapon selection. 
-- Defaults are the first in each list

mainWeapon = M('Crocea Mors', 'Excalibur', 'Naegling', 'Murgleis', 'Tauret', 'Mandau', 'Maxentius','Almace', 'Daybreak','Sequence')
subWeapon = M('Sacro Bulwark','Thibron','Gleti\'s Knife','Daybreak')

rangeWeapon = M('','Ullr')
RangedAmmo = {TP="Chapuli Arrow",WS="Chapuli Arrow"}
------------------------------------------------------------------------------------------------------

----------------------------------------------------------
-- Auto CP Cape: Will put on CP cape automatically when
-- fighting Apex mobs and job is not mastered
----------------------------------------------------------
CP_CAPE = "" -- Put your CP cape here
----------------------------------------------------------

-- Setting this to true will stop the text spam, and instead display modes in a UI.
-- Currently in construction.
use_UI = true
hud_x_pos = 950   --important to update these if you have a smaller screen
hud_y_pos = 50     --important to update these if you have a smaller screen
hud_draggable = true
hud_font_size = 10
hud_transparency = 200 -- a value of 0 (invisible) to 255 (no transparency at all)
hud_font = 'Arial'



-- Setup your Key Bindings here:
	--windower.send_command('bind insert gs c nuke cycle')        -- insert to Cycles Nuke element
	--windower.send_command('bind delete gs c nuke cycledown')    -- delete to Cycles Nuke element in reverse order   
	--windower.send_command('bind f9 gs c toggle idlemode')       -- F9 to change Idle Mode    
	--windower.send_command('bind f8 gs c toggle meleemode')      -- F8 to change Melee Mode  
	--windower.send_command('bind !f9 gs c toggle melee') 		-- Alt-F9 Toggle Melee mode on / off, locking of weapons
	--windower.send_command('bind !f8 gs c toggle mainweapon')	-- Alt-F8 Toggle Main Weapon
	--windower.send_command('bind ^f8 gs c toggle subweapon')		-- CTRL-F8 Toggle sub Weapon.
	--windower.send_command('bind !` input /ma Stun <t>') 		-- Alt-` Quick Stun Shortcut.
	--windower.send_command('bind home gs c nuke enspellup')		-- Home Cycle Enspell Up
	--windower.send_command('bind PAGEUP gs c nuke enspelldown')  -- PgUP Cycle Enspell Down
	--windower.send_command('bind ^f10 gs c toggle mb')           -- F10 toggles Magic Burst Mode on / off.
	--windower.send_command('bind !f10 gs c toggle nukemode')		-- Alt-F10 to change Nuking Mode
	--windower.send_command('bind F10 gs c toggle matchsc')		-- CTRL-F10 to change Match SC Mode      	
	send_command('bind !end gs c hud lite')            -- Alt-End to toggle light hud version       
	send_command('bind ^end gs c hud keybinds')        -- CTRL-End to toggle Keybinds  
    send_command('bind f9 gs c toggle idlemode')
    send_command('bind f10 gs c toggle meleemode')

    send_command('bind f11 gs c toggle mainweapon')
    send_command('bind ^f11 gs c toggle subweapon')
    send_command('bind !f11 gs c toggle rangeweapon')

    send_command('bind f12 gs c toggle melee')
	send_command('bind home gs c toggle gainup')
	send_command('bind end gs c toggle gaindown')
    send_command('bind pageup gs c nuke enspellup')
    send_command('bind pagedown gs c nuke enspelldown')
	windower.send_command('bind insert gs c nuke cycle')        -- insert to Cycles Nuke element
	windower.send_command('bind delete gs c nuke cycledown')    -- delete to Cycles Nuke element in reverse order 
	windower.send_command('bind !f10 gs c toggle nukemode')
	
	send_command('bind !c input /ja "Composure" <me>')
	send_command('bind !s input /ja "Saboteur" <me>')

--[[
    This gets passed in when the Keybinds is turned on.
    IF YOU CHANGED ANY OF THE KEYBINDS ABOVE, edit the ones below so it can be reflected in the hud using the "//gs c hud keybinds" command
]]
keybinds_on = {}
keybinds_on['key_bind_idle'] = '(F9)'
keybinds_on['key_bind_melee'] = '(F10)'
keybinds_on['key_bind_mainweapon'] = '(F11)'
keybinds_on['key_bind_subweapon'] = '(CTRL-F11)'
keybinds_on['key_bind_rangeweapon'] = '(ALT-F11)'
keybinds_on['key_bind_element_cycle'] = '(INS + DEL)'
keybinds_on['key_bind_enspell_cycle'] = '(PgUP + PgDOWN)'
keybinds_on['key_bind_gain_cycle'] = '(HOME + END)'
keybinds_on['key_bind_lock_weapon'] = '(F12)'
keybinds_on['key_bind_movespeed_lock'] = '(ALT-F12)'
keybinds_on['key_bind_casting'] = '(ALT-F10)'
keybinds_on['key_bind_matchsc'] = '(CTRL-F10)'

-- Remember to unbind your keybinds on job change.
function user_unload()
    --send_command('unbind insert')
    --send_command('unbind delete')	
    send_command('unbind f9')
    --send_command('unbind !f9')
    --send_command('unbind f8')
    --send_command('unbind !f8')
    --send_command('unbind ^f8')
    send_command('unbind f10')
    send_command('unbind f11')
    send_command('unbind ^f11')
    sned_command('unbind !f11')
    send_command('unbind f12')
    send_command('unbind pageup')
    send_command('unbind pagedown')
    --send_command('unbind !`')
    --send_command('unbind home')
    --send_command('unbind !f10')	
    --send_command('unbind `f10')
    send_command('unbind !end')
	send_command('unbind !c')
	send_command('unbind !s')
    send_command('unbind ^end')  	
end

include('RDM_Lib.lua')

-- Optional. Swap to your sch macro sheet / book
set_macros(1,1) -- Sheet, Book
send_command('wait 6;input /lockstyleset 1')

refreshType = idleModes[1] -- leave this as is     

-- Setup your Gear Sets below:
function get_sets()
    
    -- JSE
    AF = {}         -- leave this empty
    RELIC = {}      -- leave this empty
    EMPY = {}       -- leave this empty


	-- Fill this with your own JSE. 
    --Atrophy
    AF.Head		=	"Atrophy Chapeau +3"
    AF.Body		=	"Atrophy Tabard +3"
    AF.Hands	=	"Atrophy Gloves +3"
    AF.Legs		=	"Atrophy Tights +3"
    AF.Feet		=	"Atrophy Boots +3"

    --Vitiation
    RELIC.Head		=	"Viti. Chapeau +3"
    RELIC.Body		=	"Viti. Tabard +3"
    RELIC.Hands 	=	"Viti. Gloves +3"
    RELIC.Legs		=	"Viti. Tights +3"
    RELIC.Feet		=	"Viti. Boots +3"

    --Lethargy
    EMPY.Head		=	"Leth. Chappel +3"
    EMPY.Body		=	"Lethargy Sayon +3"
    EMPY.Hands		=	"Leth. Ganth. +3"
    EMPY.Legs		=	"Leth. Fuseau +3"
    EMPY.Feet		=	"Leth. Houseaux +3"

	--Ambuscade
	Ambu = {}
	Ambu.S = {}
	Ambu.N = {}

	Ambu.S.Head = {name="Jhakri Coronal +2"}
	Ambu.S.Body = {name="Jhakri Robe +2"}
	Ambu.S.Hands = {name="Jhakri Cuffs +2"}
	Ambu.S.Legs = {name="Jhakri Slops +2"}
	Ambu.S.Feet = {name="Jhakri Pigaches +2"}

	Ambu.N.Head = {name="Aya. Zucchetto +2"}
	Ambu.N.Body = {name="Ayanmo Corazza +2"}
	Ambu.N.Hands = {name="Aya. Manopolas +2"}
	Ambu.N.Legs = {name="Aya. Cosciales +2"}
	Ambu.N.Feet = {name="Aya. Gambieras +2"}
    -- Capes:
    -- Sucellos's And such, add your own.
    RDMCape = {}
    RDMCape.Idle = { name="Sucellos's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity-10','Occ. inc. resist. to stat. ailments+10',}}
    RDMCape.STR = { name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
    RDMCape.TPDA = { name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}}
	--RDMCape.TPSTP = { name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}}
    RDMCape.Crit = { name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}}
	RDMCape.INTWSD = { name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','Weapon skill damage +10%',}}
	RDMCape.MNDFC = { name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10',}}
	RDMCape.Nuke = { name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}}
	RDMCape.EnmBlock = { name="Sucellos's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Enmity+10','Chance of successful block +5',}}
    -- SETS
     
    sets.me = {}        		-- leave this empty
    sets.buff = {} 			-- leave this empty
    sets.me.idle = {}			-- leave this empty
    sets.me.melee = {}          	-- leave this empty
    sets.weapons = {}			-- leave this empty
	
    -- Optional 
    include('AugGear.lua') -- I list all my Augmented gears in a sidecar file since it's shared across many jobs. 

    -- Leave weapons out of the idles and melee sets. You can/should add weapons to the casting sets though
    -- Your idle set
    sets.me.idle.normal = {
        ammo		=	"Homiliary",
        head		=	RELIC.Head,
        body		=	EMPY.Body,
        hands		=	"Volte Gloves",
        legs		=	"Malignance Tights",
        feet		=	"Malignance Boots",
        neck        =   "Sibyl Scarf",
        waist		=	"Carrier's Sash",
        --left_ear	=	"Etiolation Earring",
        left_ear    =   "Eabani Earring",
        right_ear	=	"Arete del Luna +1",
        left_ring	=	"Shneddick ring +1",
        right_ring	=	"Shadow Ring",
        back		=	RDMCape.Idle,
    }

    -- Your idle DT set
    sets.me.idle.dt = set_combine(sets.me.idle.refresh,{
        neck        =   "Loricate Torque +1",
        head		=	"Malignance Chapeau",
		body		=	"Malignance Tabard",
		hands		=	"Malignance Gloves",
    })  
    sets.me.idle.mdt = set_combine(sets.me.idle.refresh,{
        neck="Loricate Torque +1",

    })  
	-- Your MP Recovered Whilst Resting Set
    sets.me.resting = { 

    }
    
    sets.me.latent_refresh = {waist="Fucho-no-obi"}     
    
	-- Combat Related Sets
	------------------------------------------------------------------------------------------------------
	-- Dual Wield sets
	------------------------------------------------------------------------------------------------------
    sets.me.melee.normaldw = set_combine(sets.me.idle.refresh,{   
        ammo		=	"Coiste Bodhar",
        head		=	"Malignance Chapeau",
        body		=	"Malignance Tabard",
        hands		=	"Malignance Gloves",        
        legs		=	"Malignance Tights",
        feet		=	"Malignance Boots",
        neck		=	"Anu Torque",
        waist		=	"Reiki Yotai",
        left_ear	=	"Eabani Earring",
        right_ear	=	"Sherida Earring",
		left_ring	=	"Hetairoi Ring",
        right_ring	=	"Petrov Ring",
        back		=	RDMCape.TPDA,   
    })
    sets.me.melee.accdw = set_combine(sets.me.melee.normaldw,{
        --head		=	Carm.Head.D,
        neck		=	"Lissome Necklace",
        --right_ear	=	"Mache Earring +1",
        --waist		=	"Grunfeld Rope",
    })
    sets.me.melee.dtdw = set_combine(sets.me.melee.normaldw,{
        neck        =   "Loricate Torque +1",
		right_ear	=	"Odnowa Earring +1",
	    left_ring	=	"Defending Ring",
		right_ring	=	"Gelatinous Ring +1",
    })
    sets.me.melee.mdtdw = set_combine(sets.me.melee.normaldw,{

    })
    sets.me.melee.thdw = set_combine(sets.me.melee.normaldw,{
		ammo		=	"Per. Lucky Egg",
		head		=	"Volte Cap",
		waist		=	"Chaac Belt",
		feet		=	"Volte Boots"

    })
	sets.me.melee.enspelldw = {
		head = "Malignance Chapeau",
		body = "Malignance Tabard",
		hands = Ambu.N.Hands,
		legs = "Malignance Tights",
		feet = "Malignance Boots",
		waist = "Reiki Yotai",
		neck = "Dls. Torque +2",
		left_ear = "Eabani Earring",
		right_ear = "Telos Earring",
		left_ring = "Hetairoi Ring",
		right_ring = "Petrov Ring",
		back = RDMCape.TPDA,
		
	}
	------------------------------------------------------------------------------------------------------
	-- Single Wield sets. -- combines from DW sets
	-- So can just put what will be changing when off hand is a shield
 	------------------------------------------------------------------------------------------------------   
    sets.me.melee.normalsw = set_combine(sets.me.melee.normaldw,{   
		left_ear		=	"Brutal Earring",
		waist			=	"Sailfi Belt +1"
    })
    sets.me.melee.accsw = set_combine(sets.me.melee.accdw,{

    })
    sets.me.melee.dtsw = set_combine(sets.me.melee.dtdw,{
		left_ear		=	"Tuisto Earring"
    })
    sets.me.melee.mdtsw = set_combine(sets.me.melee.mdtdw,{

    })
	sets.me.melee.thsw = set_combine(sets.me.melee.thdw,{
		left_ear		=	"Tuisto Earring",
		waist			=	"Chaac Belt"

    })
    
	sets.me.melee.enspellsw = {	}
	------------------------------------------------------------------------------------------------------
    -- Weapon Skills sets just add them by name.
	------------------------------------------------------------------------------------------------------
    
    -- Sword

    sets.me["Savage Blade"] = {
        ammo		=	"Oshasha's Treatise",
        head		=	RELIC.Head,
        body		=	"Nyame Mail",
        hands		=	AF.Hands,
        legs		=	"Nyame Flanchard",
        feet		=	EMPY.Feet,
        neck        =   "Rep. Plat. Medal",
        waist		=	"Sailfi Belt +1",
        left_ear	=	{ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
        right_ear	=	"Ishvara Earring",
        left_ring   =   "Sroda Ring",
        right_ring	=	"Cornelia's Ring",
        back		=	RDMCape.STR,
	}
    
    sets.me["Knights of Round"] = set_combine(sets.me["Savage Blade"],{
		left_ear	=	"Sherida Earring"})

    sets.me["Death Blossom"] = set_combine(sets.me["Knights of Round"],{
		left_ring	=	"Metamorph Ring +1"
	})
    
    sets.me["Requiescat"] = {
        ammo        =   "Oshasha's Treatise",
        head        =   RELIC.Head,
        body        =   EMPY.Body,
        hands       =   EMPY.Hands,
        legs        =   EMPY.Legs,
        feet        =   EMPY.Feet,
        neck        =   "Fotia Gorget",
        waist       =   "Fotia Belt",
        left_ear	=	{ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
        right_ear   =   "Brutal Earring",
        left_ring   =   "Metamorph Ring +1",
        right_ring	=	"Rufescent Ring",
        back        =   RDMCape.STR,
    }
    sets.me["Chant du Cygne"] = {
        ammo		=	"Yetshila +1",
        head		=	"Blistering Sallet +1",
        body		=	EMPY.Body,
        hands		=	"Malignance Gloves",
        legs		=	"Zoar Subligar +1",
        feet		=	"Thereoid Greaves",
        neck		=	"Fotia Gorget",
        waist		=	"Fotia Belt",
        left_ear	=	"Mache Earring",
        right_ear	=	"Sherida Earring",
        left_ring	=	"Begrudging Ring",
        right_ring	=	"Ilabrat Ring",
        back		=	RDMCape.Crit,
    }
    sets.me["Sanguine Blade"] = {
		ammo		=	"Sroda Tathlum",
        head		=	"Pixie Hairpin +1",
        body		=	EMPY.Body,
        hands		=	Ambu.S.Hands,
        legs		=	EMPY.Legs,
        feet		=	EMPY.Feet,
        neck        =   "Sibyl Scarf",
        waist		=	"Orpheus's Sash",
        left_ear	=	"Regal Earring",
        right_ear	=	"Malignance Earring",
        left_ring	=	"Archon Ring",
        right_ring	=	"Cornelia's Ring",
        back		=	RDMCape.INTWSD,
    }
    sets.me["Red Lotus Blade"] = set_combine(sets.me["Sanguine Blade"],{
		head		=	EMPY.Head,
		right_ear	=	{ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
		left_ring	=	"Freke Ring"
	})
    
    sets.me["Seraph Blade"] = set_combine(sets.me["Sanguine Blade"],{
        head		=	EMPY.Head,
		right_ear	=	{ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
		left_ring	=	"Metamorph Ring +1",
    })

    -- Dagger

    sets.me["Aeolian Edge"] = set_combine(sets.me["Red Lotus Blade"],{})

    sets.me["Evisceration"] = set_combine(sets.me["Chant du Cygne"],{})

    sets.me["Exenterator"] = {

        neck        =   "Fotia Gorget",
        waist       =   "Fotia Belt"
    }
	
	sets.me["Mercy Stroke"] = set_combine(sets.me["Knights of Round"],{})
    
    -- Club

    sets.me["Black Halo"] = set_combine(sets.me["Death Blossom"],{})

    -- Ranged

    sets.me["Empyreal Arrow"] = {
		ammo		=	RangedAmmo.WS,
		head		=	"Malignance Cahpeau",
		body		=	"Malignance Tabard",
		hands		=	"Malignance Gloves",
		legs		=	"Malignance Tights",
		feet		=	"Malignance Boots",
		neck		=	"Fotia Gorget",
		waist		=	"Fotia Belt",
		left_ear	=	"Crep. Earring",
		right_ear	=	"Telos Earring",

    }
	
	sets.me["Flaming Arrow"] = {
		ammo	=	RangedAmmo.WS,
		head	=	"Nyame Helm",
		neck	=	"Fotia Gorget",
		body	=	"Nyame Mail",
		hands	=	"Nyame Gauntlets",
		legs	=	"Nyame Flanchard",
		feet	=	EMPY.Feet,
		lear	=	"Moonshade Earring",
		rear	=	"Ishvara Earring",
		lring	=	"Sroda Ring",
		rring	=	"Cornelia's Ring",
		waist	=	"Fotia Belt",
		back	=	RDMCape.INTWSD
	}
		

    -- Feel free to add new weapon skills, make sure you spell it the same as in game. These are the only two I ever use though 
	
	
    ---------------
    -- Casting Sets
    ---------------
    sets.precast = {}   		-- Leave this empty  
    sets.midcast = {}    		-- Leave this empty  
    sets.aftercast = {}  		-- Leave this empty  
    sets.midcast.nuking = {}		-- leave this empty
    sets.midcast.MB	= {}		-- leave this empty   
    sets.midcast.enhancing = {} 	-- leave this empty 
	sets.midcast.blue = {}		-- leave this empty
    ----------
    -- Precast
    ----------
      
    -- Generic Casting Set that all others take off of. Here you should add all your fast cast RDM need 50 pre JP 42 at master
    sets.precast.casting = {
        
        head        =   AF.Head,                --16
        body		=	RELIC.Body,             --15
		back		=	RDMCape.MNDFC,			--10
                    --Job Trait                 --38
    }											--Total: 79 

    sets.precast["Stun"] = set_combine(sets.precast.casting,{

    })
	
	sets.precast["Impact"] = {
		body	=	"Crepuscular Cloak"
	}

    -- Enhancing Magic, eg. Siegal Sash, etc
    sets.precast.enhancing = set_combine(sets.precast.casting,{

    })
  
    -- Stoneskin casting time -, works off of enhancing -
    sets.precast.stoneskin = set_combine(sets.precast.enhancing,{

    })
      
    -- Curing Precast, Cure Spell Casting time -
    sets.precast.cure = set_combine(sets.precast.casting,{
	    --back		=	"Pahtli Cape",
        --feet		=	"Telchine Pigaches",
	    --left_ring	=	"Lebeche Ring",		
    })
      
    ---------------------
    -- Ability Precasting
    ---------------------

    sets.precast["Chainspell"] = {body = RELIC.Body}
    sets.precast["Convert"] = {main = "Murgleis", sub = "Ammurapi Shield"}
	 

	
	----------
    -- Midcast
    ----------
	
    -- Just go make it, inventory will thank you and making rules for each is meh.
    sets.midcast.Obi = {
    	waist="Hachirin-no-Obi",
    }
    sets.midcast.Orpheus = {
        waist="Orpheus's Sash", -- Commented cause I dont have one yet
    }  
	-----------------------------------------------------------------------------------------------
	-- Helix sets automatically derives from casting sets. SO DONT PUT ANYTHING IN THEM other than:
	-- Belt that isn't Obi.
	-- Noctohelix automatically looks for pixie hairpin +1.
	-----------------------------------------------------------------------------------------------
    -- Make sure you have a non weather obi in this set. Helix get bonus naturally no need Obi.	
    sets.midcast.helix = {
	    waist		=	"Acuity Belt +1",
    }	
    -- Make sure you have a non weather obi in this set. Helix get bonus naturally no need Obi.	

    -- Whatever you want to equip mid-cast as a catch all for all spells, and we'll overwrite later for individual spells
    sets.midcast.casting = {
        --left_ring	=	"Shiva Ring",    
        --main		=	"Maxentius",
        --sub		=	"Ammurapi Shield",
        --ammo		=	"Pemphredo Tathlum",
        --head		=	Merl.Head.ACC,
        --body		=	Amal.Body.A,
        --hands		=	Amal.Hands.D,
        --legs		=	Amal.Legs.A,
        --feet		=	Amal.Feet.A,
        neck		=	"Dls. Torque +2",
        --waist		=	"Refoccilation Stone",
        --left_ear	=	"Friomisi Earring",
        --right_ear	=	"Enchntr. Earring +1",
        --back		=	RDMCape.MACC,
        --right_ring	=	"Freke Ring",
    }

    sets.midcast.nuking.normal = {
        main	    =	"Maxentius",
        sub		    =	"Ammurapi Shield",
        ammo		=	"Ghastly Tathlum +1",
        head		=	EMPY.Head,
        body		=	EMPY.Body,
        hands		=	EMPY.Hands,
        legs		=	EMPY.Legs,
        feet		=	EMPY.Feet,
        neck        =   "Sibyl Scarf",
		waist		=	"Acuity Belt +1",
		left_ear	=	"Regal Earring",
		right_ear	=	"Malignance Earring",
		back		=	RDMCape.Nuke,
		left_ring	=	"Freke Ring",
		right_ring	=	"Metamor. Ring +1",
    
    }
    -- used with toggle, default: F10
    -- Pieces to swap from freen nuke to Magic Burst
    sets.midcast.MB.normal = set_combine(sets.midcast.nuking.normal, {   
        --head		    =	"Ea Hat +1",
        --body		    =	"Ea Houppe. +1",
       	--hands			=	"Bunzi's Gloves",
    })
	
    sets.midcast.nuking.acc = {}
    -- used with toggle, default: F10
    -- Pieces to swap from freen nuke to Magic Burst
    sets.midcast.MB.acc = set_combine(sets.midcast.nuking.acc, {})	
	
    -- Enfeebling

	sets.midcast.Enfeebling = {} -- leave Empty
	--Type A-pure macc no potency mod
    sets.midcast.Enfeebling.macc = {
        main		    =	"Crocea Mors",
        sub			    =	"Ammurapi Shield",
		range			=	"Ullr",
        ammo		    =	"",
        head	    	=	AF.Head,
        body		    =	EMPY.Body,
        hands		    =	EMPY.Hands,
        --legs		    =	EMPY.Legs,
        legs			=	Chi.Macc,
		feet		    =	EMPY.Feet,
        neck		    =	"Dls. Torque +2",
        waist		    =	"Acuity Belt +1",
        left_ear	    =	"Snotra Earring",
        right_ear	    =	"Regal Earring",
        right_ring	    =	"Stikini Ring +1",
        left_ring		=	"Metamorph Ring +1",
        back		    =	"Aurist's Cape +1"
    }
	sets.midcast["Stun"] = set_combine(sets.midcast.Enfeebling.macc, {

	})
	--Type B-potency from: Mnd & "Enfeeb Potency" gear
    sets.midcast.Enfeebling.mndpot = set_combine(sets.midcast.Enfeebling.macc,{
		ammo				=	"Regal Gem"})

	-- Type C-potency from: Int & "Enfeeb Potency" gear
    sets.midcast.Enfeebling.intpot = set_combine(sets.midcast.Enfeebling.macc,{
		ammo				=	"Regal Gem"})

	--Type D-potency from: Enfeeb Skill & "Enfeeb Potency" gear
    sets.midcast.Enfeebling.skillpot = set_combine(sets.midcast.Enfeebling.macc,{
		ammo				=	"Regal Gem",
    })

	-- Tpe E-potency from: Enfeeb skill, Mnd, & "Enfeeb Potency" gear
    sets.midcast.Enfeebling.skillmndpot = set_combine(sets.midcast.Enfeebling.macc,{
		ammo				=	"Regal Gem"})

	-- Type F-potency from "Enfeebling potency" gear only
    sets.midcast.Enfeebling.potency = set_combine(sets.midcast.Enfeebling.macc,{
		ammo				=	"Regal Gem"})
	
    -- Enhancing yourself 
    sets.midcast.enhancing.duration = {
        main		=	"Colada",
        sub			=	"Ammurapi Shield",
        ammo		=	"Staunch Tathlum +1",
        head        =   { name="Telchine Cap", augments={'Enh. Mag. eff. dur. +10',}},
        body		=	RELIC.Body,
        hands		=	AF.Hands,
        legs		=	"Telchine Braconi",
        feet		=	EMPY.Feet,
        neck		=	"Dls. Torque +2",
        waist		=	"Embla Sash",
        left_ear	=	"Malignance Earring",
        right_ear	=	"Lethargy Earring +1",
		left_ring 	= 	"Kishar Ring",
        right_ring	=	"",
        back		=	"Ghostfyre Cape",
    }
    -- For Potency spells like Temper and Enspells
    sets.midcast.enhancing.potency = set_combine(sets.midcast.enhancing.duration, {
        main		=	"Pukulatmuj +1",
		sub			=	"Forfend +1",
		head		=	"Befouled Crown",
		hands		=	RELIC.Hands,
        legs		=	AF.Legs,
        feet		=	EMPY.Feet,
        neck		=	"Incanter's Torque",
        waist		=	"Olympus Sash",
        left_ear	=	"Mimir Earring",
        right_ear	=	"Andoaa Earring",
        --left_ring	=	{name="Stikini Ring +1",bag="wardrobe3"},
        right_ring	=	"Stikini Ring +1",
    }) 

    -- This is used when casting under Composure but enhancing someone else other than yourself. 
    sets.midcast.enhancing.composure = set_combine(sets.midcast.enhancing.duration, {
        head		=	EMPY.Head,
        body        =   EMPY.Body,
        legs		=	EMPY.Legs,
    })  


    -- Phalanx
    sets.midcast.phalanx =  set_combine(sets.midcast.enhancing.duration, {
		main		=	"Sakpata's Sword",
		sub			=	"Ammurapi Shield",
        head		=	"Chironic Hat",
        body		=	"Chironic Doublet",
        hands		=	"Chironic Gloves",
        legs		=	Chi.Phalanx,
        feet		=	"Chironic Slippers",
    })

    -- Stoneskin
    sets.midcast.stoneskin = set_combine(sets.midcast.enhancing.duration, {
	    waist		=	"Siegel Sash",
    })
    
    sets.midcast.refresh = set_combine(sets.midcast.enhancing.duration, {
        body    =   AF.Body,
        legs    =   EMPY.Legs,
        waist =   "Gishdubar Sash",
    })
	
	sets.midcast.statusremoval = {
		}
	
    sets.midcast.barstatus = set_combine(sets.midcast.enhancing.duration, {
        --neck      =   Sroda Necklace,
    })

    sets.midcast.aquaveil = set_combine(sets.midcast.refresh, {
		hands	=	"Regal Cuffs"
	})
	
    sets.midcast["Drain"] = set_combine(sets.midcast.nuking, {
        --main		=	"Rubicundity",
	    --head		=	"Pixie Hairpin +1",
	    --neck		=	"Erra Pendant",
    })
    sets.midcast["Aspir"] = sets.midcast["Drain"]
	
	sets.midcast["Impact"] = {
		main		=	"Murgleis",
		sub			=	"Ammurapi Shield",
		head 		=	"",
		body		=	"Crepuscular Cloak",
		hands		=	EMPY.Hands,
		legs		=	EMPY.Legs,
		feet		=	EMPY.Feet,
		left_ear	=	"Snorda Earring",
		right_ear	=	"Malignance Earring",
		left_ring	=	"Metamorph Ring +1"
		}
 	
    sets.midcast.cure = {} -- Leave This Empty
    -- Cure Potency
    sets.midcast.cure.normal = set_combine(sets.midcast.casting,{
        main		=	"Daybreak",
		sub			=	"Ammurapi Shield",
        --ammo		=	"Homiliary",
        --head		=	"Vanya Hood",
        --body		=	"Gende. Bilaut +1",
        --hands		=	"Telchine Gloves", 
        --legs		=	Chiro.Legs.Acc,
        --feet		=	RELIC.Feet,
        --neck		=	"Fylgja Torque +1",
        --waist		=	"Porous Rope",
        --left_ear	=	"Mendi. Earring",
        --right_ear	=	"Roundel Earring",
        --left_ring	=	"Stikini Ring +1",
        --right_ring	=	"Lebeche Ring",
        --back		=	"Ghostfyre Cape",
		head		=	"Kaykaus Mitra",
		neck		=	"Incanter's Torque",
		left_ear	=	"Regal Earring",
		right_ear	=	"Meili Earring",
		left_ring	=	"Sirona's Ring",
		legs		=	"Kaykaus Tights",
    })
    sets.midcast.cure.weather = set_combine(sets.midcast.cure.normal,{
		waist		=	"Haichirin-no-Obi",
		back		=	"Twilight Cape"
    })    
	sets.midcast.cure.normal.self = set_combine(sets.midcast.cure.normal,{
		neck		=	"Phalaina Locket",
		waist		=	"Gishdubar Sash",
		--right_ring		=	"Kunaji Ring"
	})
	sets.midcast.cure.weather.self = set_combine(sets.midcast.cure.weather,{
		neck		=	"Phalaina Locket",
		--right_ring		=	"Kunaji Ring"
	})
    ------------
    -- Regen
    ------------	
	sets.midcast.regen = set_combine(sets.midcast.enhancing.duration, {

    })
	---------------
    -- Blue Magic
    ---------------
	sets.midcast.blue.phys = {}
	sets.midcast.blue.macc = set_combine(sets.midcast.Enfeebling.macc,{})
	sets.midcast.blue.buff = {}
	sets.midcast.blue.nuke = {}
	sets.midcast.blue.nuke.mb ={}
	sets.midcast.blue.heal = {}
	sets.midcast.blue.heal.me = {}
	sets.midcast.blue.enm = {
		head =	"Halitus Helm",
		body =	"Emet Harness +1",
		neck = 	"Unmoving Collar +1",
		waist =	"Kasiri Belt",
		back = RDMCape.EnmBlock,
	}
	------------------------------------------------------------------------------------------------------
	-- Ranged sets. -- Pre/Mid for shots
 	------------------------------------------------------------------------------------------------------ 
	sets.precast.ra = {}
	sets.precast.ra.normal = {
		neck="Marked Gorget",
		waist="Yemaya Belt",
		hands="Carmine Fin. Ga. +1",
		
	}
	sets.precast.ra.flurry = set_combine(sets.precast.ra.normal,{
		neck="Ocachi Gorget"
	})
	sets.midcast.ra = {
		neck	=	"Marked Gorget",
		head	= 	"Malignance Chapeau",
		body	=	"Malignance Tabard",
		hands	=	"Malignance Gloves",
		legs	=	"Malignance Tights",
		feet	=	"Malignance Boots",
		waist	=	"Yemaya Belt",
		lear	=	"Crep. Earring",
		rear	=	"Telos Earring",
	}
	
    ------------
    -- Aftercast
    ------------
      
    -- I don't use aftercast sets, as we handle what to equip later depending on conditions using a function.
	
end
