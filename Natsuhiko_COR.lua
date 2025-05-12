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
idleModes = M('normal', 'regen', 'refresh')
meleeModes = M('normal', 'acc', 'hybrid')
rangedModes = M('normal', 'acc')
nukeModes = M('normal', 'acc')

QDMode = M('normal', 'stp','utility')
EleQDMode = M('Ice', 'Air', 'Earth', 'Lightning', 'Water', 'Fire')

------------------------------------------------------------------------------------------------------
-- Important to read!
------------------------------------------------------------------------------------------------------
-- This will be used later down for weapon combos, here's mine for example, you can add your REMA+offhand of choice in there
-- Add you weapons in the Main list and/or sub list.
-- Don't put any weapons / sub in your IDLE and ENGAGED sets'
-- You can put specific weapons in the midcasts and precast sets for spells, but after a spell is 
-- cast and we revert to idle or engaged sets, we'll be checking the following for weapon selection. 
-- Defaults are the first in each list

mainWeapon = M('RostamA','RostamB','Kustawi +1','Naegling')
subWeapon = M('Nusku Shield','Tauret', 'Kustawi +1','Gleti\'s Knife')

rangeWeapon = M('Ataktos','Fomalhaut','Armageddon')
------------------------------------------------------------------------------------------------------

RollOne = M('Chaos Roll', 'Samurai Roll', 'Hunter\'s Roll', 'Wizard\'s Roll', 'Warlock\'s Roll', 'Drachen Roll', 'Beast Roll', 'Companion\'s Roll', 'Magus\'s Roll', 'Gallant\'s Roll', 
	'Runeist\'s Roll', 'Tactician\'s Roll', 'Allies\' Roll')
RollTwo = M('Samurai Roll', 'Hunter\'s Roll', 'Wizard\'s Roll', 'Warlock\'s Roll', 'Drachen Roll', 'Beast Roll', 'Companion\'s Roll', 'Magus\'s Roll', 'Gallant\'s Roll', 
	'Runeist\'s Roll', 'Tactician\'s Roll', 'Allies\' Roll', 'Chaos Roll')
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
	
	send_command('bind home gs c toggle qdmodeup')
	send_command('bind end gs c toggle qdmodedown')
	send_command('bind ^home gs c toggle eleqdup')
	send_command('bind ^end gs c toggle eleqddown')
    send_command('bind pageup gs c toggle rolloneup')
    send_command('bind pagedown gs c toggle rollonedown')
	send_command('bind ^pageup gs c toggle rolltwoup')
	send_command('bind ^pagedown gs c toggle rolltwodown')
	windower.send_command('bind insert gs c nuke cycle')        -- insert to Cycles Nuke element
	windower.send_command('bind delete gs c nuke cycledown')    -- delete to Cycles Nuke element in reverse order 
	windower.send_command('bind !f10 gs c toggle nukemode')
	

	send_command('bind !c input /ja "Crooked Cards" <me>')
	send_command('bind !d input /ja "Double-Up" <me>')
	send_command('bind !b input /ja "Bolter\'s Roll" <me>') 
	send_command('bind !t input /ja "Triple Shot" <me>')

--[[
    This gets passed in when the Keybinds is turned on.
    IF YOU CHANGED ANY OF THE KEYBINDS ABOVE, edit the ones below so it can be reflected in the hud using the "//gs c hud keybinds" command
]]
keybinds_on = {}
keybinds_on['key_bind_idle'] = '(F9)'
keybinds_on['key_bind_melee'] = '(F10)'
keybinds_on['key_bind_ranged'] = '       '
keybinds_on['key_bind_mainweapon'] = '(F11)'
keybinds_on['key_bind_subweapon'] = '(CTRL-F11)'
keybinds_on['key_bind_rangeweapon'] = '(ALT-F11)'
keybinds_on['key_bind_element_cycle'] = '(INS + DEL)'
keybinds_on['key_bind_lock_weapon'] = '(F12)'
keybinds_on['key_bind_movespeed_lock'] = '(ALT-F12)'
keybinds_on['key_bind_casting'] = '(ALT-F10)'
keybinds_on['key_bind_matchsc'] = '(CTRL-F10)'
keybinds_on['key_bind_rollone_cycle'] = '(PgUP + PgDown)'
keybinds_on['key_bind_rolltwo_cycle'] = '(HOME + END)'
keybinds_on['key_bind_qd_mode'] = '        '
keybinds_on['key_bind_ele_qd'] = '        '

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
	send_command('unbind !d')
	sned_command('unbind !b')
    send_command('unbind ^end')  	
end

include('COR_Lib.lua')

-- Optional. Swap to your sch macro sheet / book
set_macros(1,2) -- Sheet, Book
send_command('wait 6;input /lockstyleset 2')

refreshType = idleModes[1] -- leave this as is     

-- Setup your Gear Sets below:
function get_sets()
    
    -- JSE
    AF = {}         -- leave this empty
    RELIC = {}      -- leave this empty
    EMPY = {}       -- leave this empty


	-- Fill this with your own JSE. 
    --Atrophy
    AF.Head		=	"Laksa. Tricorne +3"
    AF.Body		=	"Laksa. Frac +3"
    AF.Hands	=	"Laksa. Gants +2"
    AF.Legs		=	"Laksa. Trews +2"
    AF.Feet		=	"Laksa. Bottes +3"

    --Vitiation
    RELIC.Head		=	"Lanun Tricorne +3"
    RELIC.Body		=	"Lanun Frac +3"
    RELIC.Hands 	=	"Lanun Gants +3"
    RELIC.Legs		=	"Lanun Trews +3"
    RELIC.Feet		=	"Lanun Bottes +3"

    --Lethargy
    EMPY.Head		=	"Chass. Tricorne +3"
    EMPY.Body		=	"Chasseur's Frac +3"
    EMPY.Hands		=	"Chasseur's Gants +3"
    EMPY.Legs		=	"Chas. Culottes +3"
    EMPY.Feet		=	"Chass. Bottes +3"

    -- Capes:
    -- Camulus's And such, add your own.
    CORCape = {}
    CORCape.Idle = { name="Camulus's Mantle", augments={'INT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Snapshot"+10','Occ. inc. resist. to stat. ailments+10',}}
    CORCape.TPDW = { name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dual Wield"+10','Damage taken-5%',}}
    CORCape.MagicWSD = { name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}}
	CORCape.SB = { name="Camulus's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
	CORCape.Midshot = { name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','"Store TP"+10',}}
	CORCape.LS = { name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Weapon skill damage +10%',}}
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
		ammo = "Chrono Bullet",
		head = EMPY.Head,
		body = EMPY.Body,
		lear = "Eabani Earring",
		rear = "Arete del Luna +1",
		neck = "Rep. Plat. Medal",
		hands = "Malignance Gloves",
		waist = "Carrier's Sash",
		legs = "Malignance Tights",
		feet = "Malignance Boots",
		lring = "Shneddick Ring +1",
		right_ring	=	"Shadow Ring",
		back = CORCape.Idle
     
    }

    -- Your idle DT set
    sets.me.idle.regen = set_combine(sets.me.idle.normal,{

    })  
    sets.me.idle.refresh = set_combine(sets.me.idle.normal,{

    })  
	-- Your MP Recovered Whilst Resting Set
    sets.me.resting = { 

    }
    
    sets.me.latent_refresh = {waist="Fucho-no-obi"}     
    
	-- Combat Related Sets
	------------------------------------------------------------------------------------------------------
	-- Dual Wield sets
	------------------------------------------------------------------------------------------------------
    sets.me.melee.normaldw = {
		head = "Malignance Chapeau",
		body = "Malignance Tabard",
		hands = "Malignance Gloves",
		legs = "Samnuha Tights",
		feet = "Malignance Boots",
		neck = "Null Loop",
		lring = "Epona's Ring",
		rring = "Petrov Ring",
		waist = "Windbuffet Belt +1",
		lear = "Telos Earring",
		rear = "Suppanomimi",
		back = CORCape.TPDW
		
    }
    sets.me.melee.accdw = set_combine(sets.me.melee.normaldw,{
    })
    sets.me.melee.hybriddw = set_combine(sets.me.melee.normaldw,{
			head = "Malignance Chapeau",
			body = "Malignance Tabard",
			hands = "Malignance Gloves",
			legs = EMPY.Legs,
			feet = "Malignance Boots"
    })
	------------------------------------------------------------------------------------------------------
	-- Single Wield sets. -- combines from DW sets
	-- So can just put what will be changing when off hand is a shield
 	------------------------------------------------------------------------------------------------------   
    sets.me.melee.normalsw = set_combine(sets.me.melee.normaldw,{
		back = "Null Shawl"
    })
    sets.me.melee.accsw = set_combine(sets.me.melee.accdw,{

    })
    sets.me.melee.hybridsw = set_combine(sets.me.melee.hybriddw,{
    })
	------------------------------------------------------------------------------------------------------
    -- Weapon Skills sets just add them by name.
	------------------------------------------------------------------------------------------------------
    
    -- Sword

    sets.me["Savage Blade"] = {
		ammo = "Chrono Bullet",
		head = "Nyame Helm",
		body = "Nyame Mail",
		hands = EMPY.Hands,
		legs = "Nyame Flanchard",
		feet = RELIC.Feet,
		lear = "Moonshade Earring",
		rear = "Ishvara Earring",
		lring = "Sroda Ring",
		rring = "Cornelia's Ring",
		neck = "Rep. Plat. Medal",
		waist = "Sailfi Belt +1",
		back = CORCape.SB
	}
    
    sets.me["Requiescat"] = {
    }

    -- Dagger

    sets.me["Aeolian Edge"] = {
	
		head = "Nyame Helm",
		body = RELIC.Body,
		hands = "Nyame Gauntlets",
		legs = "Nyame Flanchard",
		feet = RELIC.Feet,
		lear = "Moonshade Earring",
		rear = "Friomisi Earring",
		lring = "Dingir Ring",
		rring = "Cornelia's Ring",
		neck = "Sibyl Scarf",
		waist = "Orpheus's Sash",
		back = CORCape.MagicWSD
	}

    sets.me["Evisceration"] = {}

    sets.me["Exenterator"] = {

        neck        =   "Fotia Gorget",
        waist       =   "Fotia Belt"
    }
	
    -- Ranged
	sets.me["Leaden Salute"] = {
		ammo = "Devastating Bullet",
		head = "Pixie Hairpin +1",
		body = RELIC.Body,
		hands = "Nyame Gauntlets",
		legs = "Nyame Flanchard",
		feet = RELIC.Feet,
		lear = "Moonshade Earring",
		rear = "Friomisi Earring",
		lring = "Dingir Ring",
		rring = "Cornelia's Ring",
		neck = "Comm. Charm +2",
		waist = "Orpheus's Sash",
		back = CORCape.MagicWSD
	}
	
	sets.me["Wildfire"] = set_combine(sets.me["Leaden Salute"],{
		ammo = "Devastating Bullet",
		head = "Nyame Helm",
		lear = "Crematio Earring",		
	})
	
	sets.me["Last Stand"] = {
			ammo = "Chrono Bullet",
			head = "Nyame Helm",
			body = "Ikenga's Vest",
			hands = EMPY.Hands,
			legs = "Malignance Tights",
			feet = RELIC.Feet,
			lear = "Moonshade Earring",
			rear = "Ishvara Earring",
			lring = "Dingir Ring",
			rring = "Cornelia's Ring",
			neck = "Comm. Charm +2",
			waist = "Fotia Belt",
			back = CORCape.LS
	}

	sets.me["Hot Shot"] = set_combine(sets.me["Leaden Salute"],{
			ammo = "Devastating Bullet",
			head = "Nyame Helm",
			body = "Nyame Mail",
			neck = "Fotia Gorget",
			hands = EMPY.Hands,
	})
    -- Feel free to add new weapon skills, make sure you spell it the same as in game. These are the only two I ever use though 
	
	
    ---------------
    -- Casting Sets
    ---------------
    sets.precast = {}   		-- Leave this empty  
    sets.precast.qd = {}		-- Leave this empty
	sets.midcast = {}    		-- Leave this empty  
    sets.aftercast = {}  		-- Leave this empty  
    sets.midcast.nuking = {}		-- leave this empty
    sets.midcast.MB	= {}		-- leave this empty   
    sets.midcast.enhancing = {} 	-- leave this empty 
	sets.midcast.blue = {}		-- leave this empty
    ----------
    -- Precast
    ----------
     
	sets.precast.roll = set_combine(sets.me.idle.normal,{
		main = { name="Rostam", augments={'Path: C',}},
		sub = 'Nusku Shield',
		range = "Compensator",
		head = RELIC.Head,
		hands = EMPY.Hands,
		legs = "Desultor Tassets",
		neck = "Regal Necklace",
		rring = "Luzaf's Ring"
	})
	
	-- Quick Draw Damage
	sets.precast.qd.normal = {
		body = RELIC.Body,
		hands = "Carmine Fin. Ga. +1",
		legs = "Nyame Flanchard",
		feet = RELIC.Feet,
		
		lear = "Crematio Earring",
		rear = "Friomisi Earring",
		lring = "Dingir Ring",
		waist = "Orpheus's Sash",
		back = CORCape.MagicWSD
		
	}
	-- Quick Draw STP
	sets.precast.qd.stp = {}
	-- Quick Draw Elemental DMG+ (Empy Feet)
	sets.precast.qd.utility = {}
	-- Light/Dark Shot
	sets.precast.qd.macc = {}
    
	-- Generic Casting Set that all others take off of. Here you should add all your fast cast RDM need 50 pre JP 42 at master
    sets.precast.casting = {
        
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

	sets.precast["Wild Card"] = {feet = RELIC.Feet}
    sets.precast["Random Deal"] = {body = RELIC.Body}
	
	sets.precast["Snake Eye"] = {legs = RELIC.Legs}
	sets.precast["Fold"] = {hands = RELIC.Hands}
	 

	
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
	    waist		=	"Eschan Stone",
    }	
    -- Make sure you have a non weather obi in this set. Helix get bonus naturally no need Obi.	

    -- Whatever you want to equip mid-cast as a catch all for all spells, and we'll overwrite later for individual spells
    sets.midcast.casting = {
    }

    sets.midcast.nuking.normal = {
    }
    -- used with toggle, default: F10
    -- Pieces to swap from freen nuke to Magic Burst
    sets.midcast.MB.normal = set_combine(sets.midcast.nuking.normal, {})
	
    sets.midcast.nuking.acc = {}
    -- used with toggle, default: F10
    -- Pieces to swap from freen nuke to Magic Burst
    sets.midcast.MB.acc = set_combine(sets.midcast.nuking.acc, {})	
	
    -- Enfeebling

	sets.midcast.Enfeebling = {} -- leave Empty
	--Type A-pure macc no potency mod
    sets.midcast.Enfeebling.macc = {
    }
	sets.midcast["Stun"] = set_combine(sets.midcast.Enfeebling.macc, {

	})
	--Type B-potency from: Mnd & "Enfeeb Potency" gear
    sets.midcast.Enfeebling.mndpot = set_combine(sets.midcast.Enfeebling.macc,{})

	-- Type C-potency from: Int & "Enfeeb Potency" gear
    sets.midcast.Enfeebling.intpot = set_combine(sets.midcast.Enfeebling.macc,{})

	--Type D-potency from: Enfeeb Skill & "Enfeeb Potency" gear
    sets.midcast.Enfeebling.skillpot = set_combine(sets.midcast.Enfeebling.macc,{})

	-- Tpe E-potency from: Enfeeb skill, Mnd, & "Enfeeb Potency" gear
    sets.midcast.Enfeebling.skillmndpot = set_combine(sets.midcast.Enfeebling.macc,{})

	-- Type F-potency from "Enfeebling potency" gear only
    sets.midcast.Enfeebling.potency = set_combine(sets.midcast.Enfeebling.macc,{})
	
    -- Enhancing yourself 
    sets.midcast.enhancing.duration = {
    }
    -- For Potency spells like Temper and Enspells
    sets.midcast.enhancing.potency = set_combine(sets.midcast.enhancing.duration, {
    }) 


    -- Phalanx
    sets.midcast.phalanx =  set_combine(sets.midcast.enhancing.duration, {})

    -- Stoneskin
    sets.midcast.stoneskin = set_combine(sets.midcast.enhancing.duration, {})
    
    sets.midcast.refresh = set_combine(sets.midcast.enhancing.duration, {})
	
	sets.midcast.statusremoval = {
		}
	
    sets.midcast.barstatus = set_combine(sets.midcast.enhancing.duration, {})

    sets.midcast.aquaveil = set_combine(sets.midcast.refresh, {})
 	
    sets.midcast.cure = {} -- Leave This Empty
    -- Cure Potency
    sets.midcast.cure.normal = set_combine(sets.midcast.casting,{
    })
    sets.midcast.cure.weather = set_combine(sets.midcast.cure.normal,{
		waist		=	"Haichirin-no-Obi",
    })    
	sets.midcast.cure.normal.self = set_combine(sets.midcast.cure.normal,{
	})
	sets.midcast.cure.weather.self = set_combine(sets.midcast.cure.weather,{
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
	sets.midcast.blue.enm = {}
	------------------------------------------------------------------------------------------------------
	-- Ranged sets. -- Pre/Mid for shots
 	------------------------------------------------------------------------------------------------------ 
	sets.precast.ra = {}
	sets.midcast.ra = {} -- Leave this empty
	sets.precast.ra.normal = {
		head = EMPY.Head,
		body = "Oshosi Vest +1",
		hands = "Carmine Fin. Ga. +1",
		legs = "Adhemar Kecks +1",
		feet = "Meg. Jam. +2",
		waist = "Impulse Belt",
		rring = "Crepuscular Ring",
		back = CORCape.Idle
	}
	sets.precast.ra.flurry = set_combine(sets.precast.ra.normal, {
		body = AF.Body,
		waist = "Yemaya Belt"
	})
	sets.precast.ra.flurry2 = set_combine(sets.precast.ra.flurry, {
		feet = "Pursuer's Gaiters"
	})
	
	sets.midcast.ra.normal = {
		head = EMPY.Head,
		body = EMPY.Body,
		hands = EMPY.Hands,
		legs = EMPY.Legs,
		feet = EMPY.Boots,
		neck = "Iskur Gorget",
		lear = "Telos Earring",
		rear = "Crep. Earring",
		lring = "Ilabrat Ring",
		rring = "Crepuscular Ring",
		waist = "Yemaya Belt",
		back = CORCape.Midshot,
	}
	sets.midcast.ra.acc = {}
	sets.midcast.ra.crit = {
		hands = EMPY.Hands,
		lring = "Dingir Ring",
		rring = "Begrudging Ring",
	}
	sets.midcast.ra.ts = set_combine(sets.midcast.ra,{
		body = EMPY.Body,
		hands = RELIC.Hands,
	})
	
    ------------
    -- Aftercast
    ------------
      
    -- I don't use aftercast sets, as we handle what to equip later depending on conditions using a function.
	
end
