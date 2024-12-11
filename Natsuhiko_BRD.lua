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
idleModes = M('normal','refresh','dt')
meleeModes = M('normal', 'acc', 'dt', 'mdt','th')
nukeModes = M('normal', 'acc')
dummySongs = M(false)

------------------------------------------------------------------------------------------------------
-- Important to read!
------------------------------------------------------------------------------------------------------
-- This will be used later down for weapon combos, here's mine for example, you can add your REMA+offhand of choice in there
-- Add you weapons in the Main list and/or sub list.
-- Don't put any weapons / sub in your IDLE and ENGAGED sets'
-- You can put specific weapons in the midcasts and precast sets for spells, but after a spell is 
-- cast and we revert to idle or engaged sets, we'll be checking the following for weapon selection. 
-- Defaults are the first in each list

mainWeapon = M('Sangoma', 'Naegling', 'Tauret', 'Mandau')
subWeapon = M('Genmei Shield', 'Fusetto +1', 'Taming Sari', 'Ternion Dagger +1')
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
    --send_command('bind !f11 gs c toggle rangeweapon')

    send_command('bind f12 gs c toggle melee')
	send_command('bind delete gs c toggle dummysongs')
	--send_command('bind home gs c toggle gainup')
	--send_command('bind end gs c toggle gaindown')
    --send_command('bind pageup gs c nuke enspellup')
    --send_command('bind pagedown gs c nuke enspelldown')
	--windower.send_command('bind insert gs c nuke cycle')        -- insert to Cycles Nuke element
	--windower.send_command('bind delete gs c nuke cycledown')    -- delete to Cycles Nuke element in reverse order 
	--windower.send_command('bind !f10 gs c toggle nukemode')
	
	--send_command('bind ^c input /ja "Composure" <me>')
	--send_command('bind ^s input /ja "Saboteur" <me>')

	send_command('bind !p input /ja "Pianissimo" <me>')
	send_command('bind !n input /ja "Nightingale" <me>')
	send_command('bind !t input /ja "Troubadour" <me>')

--[[
    This gets passed in when the Keybinds is turned on.
    IF YOU CHANGED ANY OF THE KEYBINDS ABOVE, edit the ones below so it can be reflected in the hud using the "//gs c hud keybinds" command
]]
keybinds_on = {}
keybinds_on['key_bind_idle'] = '(F9)'
keybinds_on['key_bind_melee'] = '(F10)'
keybinds_on['key_bind_mainweapon'] = '(F11)'
keybinds_on['key_bind_subweapon'] = '(ALT+F11)'
keybinds_on['key_bind_movespeed_lock'] = '        '

keybinds_on['key_bind_lock_weapon'] = '(F12)'
keybinds_on['key_bind_dummy_songs'] = '(ALT+F12)'

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
	send_command('unbind ^c')
	send_command('unbind ^s')
    send_command('unbind ^end')  	
end

include('BRD_Lib.lua')

-- Optional. Swap to your sch macro sheet / book
set_macros(1,2) -- Sheet, Book
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
    AF.Head		=	""
    AF.Body		=	"Brioso Just. +1"
    AF.Hands	=	"Brioso Cuffs +1"
    AF.Legs		=	""
    AF.Feet		=	""

    --Vitiation
    RELIC.Head		=	""
    RELIC.Body		=	""
    RELIC.Hands 	=	""
    RELIC.Legs		=	""
    RELIC.Feet		=	""

    --Fili
    EMPY.Head		=	"Fili Calot +2"
    EMPY.Body		=	"Fili Hongreline +2"
    EMPY.Hands		=	"Fili Manchettes +2"
    EMPY.Legs		=	"Fili Rhingrave +2"
    EMPY.Feet		=	"Fili Cothurnes +2"

	--Ambuscade
	Ambu = {}
	Ambu.S = {}
	Ambu.N = {}

	Ambu.S.Head = {name=""}
	Ambu.S.Body = {name="Inyanga Jubbah +2"}
	Ambu.S.Hands = {name="Inyan. Dastanas +2"}
	Ambu.S.Legs = {name="Inyanga Shalwar +2"}
	Ambu.S.Feet = {name=""}

	Ambu.N.Head = {name="Aya. Zucchetto +2"}
	Ambu.N.Body = {name="Ayanmo Corazza +2"}
	Ambu.N.Hands = {name="Aya. Manopolas +2"}
	Ambu.N.Legs = {name="Aya. Cosciales +2"}
	Ambu.N.Feet = {name="Aya. Gambieras +2"}
    -- Capes:
    -- Sucellos's And such, add your own.
    BRDCape = {}
	BRDCape.Idle = {"Intarabus's Cape"}
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
		range	=	"Linos",
		head	=	EMPY.Head,
		neck	=	"Loricate Torque +1",
		body	=	Ambu.S.Body,
		hands	=	EMPY.Hands,
		legs	=	EMPY.Legs,
		feet	=	EMPY.Feet,
		lring	=	"Defending Ring",
		rring	=	"Inyanga Ring",
		lear	=	"Eabani Earring",
		rear	=	"Arete del Luna +1",
		waist	=	"Carrier's Sash",
		
	}
	
    sets.me.idle.refresh = {
    }

    -- Your idle DT set
    sets.me.idle.dt = set_combine(sets.me.idle.normal,{
        neck        =   "Loricate Torque +1",
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
			range	=	"Linos",
			head	=	Ambu.N.Head,
			neck	=	"Lissome Necklace",
			body	=	Ambu.N.Body,
			hands	=	Ambu.N.Hands,
			legs	=	Ambu.N.Legs,
			feet	=	Ambu.N.Feet,
			lear	=	"Eabani Earring",
			rear	=	"Telos Earring",
			waist	=	"Reiki Yotai",
			lring	=	"Hetairoi Ring",
			rring	=	"Petrov Ring",
			back	=	BRDCape.Idle
    })
    sets.me.melee.accdw = set_combine(sets.me.melee.normaldw,{
        --head		=	Carm.Head.D,
        neck		=	"Lissome Necklace",
        --right_ear	=	"Mache Earring +1",
        --waist		=	"Grunfeld Rope",
    })
    sets.me.melee.dtdw = set_combine(sets.me.melee.normaldw,{
    })
    sets.me.melee.mdtdw = set_combine(sets.me.melee.normaldw,{

    })
    sets.me.melee.thdw = set_combine(sets.me.melee.normaldw,{

    })
	------------------------------------------------------------------------------------------------------
	-- Single Wield sets. -- combines from DW sets
	-- So can just put what will be changing when off hand is a shield
 	------------------------------------------------------------------------------------------------------   
    sets.me.melee.normalsw = set_combine(sets.me.melee.normaldw,{   
    })
    sets.me.melee.accsw = set_combine(sets.me.melee.accdw,{

    })
    sets.me.melee.dtsw = set_combine(sets.me.melee.dtdw,{
    })
    sets.me.melee.mdtsw = set_combine(sets.me.melee.mdtdw,{

    })
	sets.me.melee.thsw = set_combine(sets.me.melee.thdw,{
    })
    
	------------------------------------------------------------------------------------------------------
    -- Weapon Skills sets just add them by name.
	------------------------------------------------------------------------------------------------------
    
    -- Sword

    sets.me["Savage Blade"] = {
		head	=	"Nyame Helm",
		neck	=	"Rep. Plat. Medal",
		body	=	"Nyame Mail",
		hands	=	"Nyame Gauntlets",
		legs	=	"Nyame Flanchard",
		feet	=	"Nyame Sollerets",
		waist	=	"Sailfi Belt",
		lear	=	"Moonshade Earring",
		rear	=	"Ishvara Earring",
		lring	=	"Sroda Ring",
		rring	=	"Cornelia's Ring",
	}
    
    -- Dagger

    sets.me["Aeolian Edge"] = {}

    sets.me["Evisceration"] = {}

    sets.me["Exenterator"] = {

        neck        =   "Fotia Gorget",
        waist       =   "Fotia Belt"
    }
	
	sets.me["Mercy Stroke"] = set_combine(sets.me["Savage Blade"],{})
	
	sets.me["Rudra's Storm"] = {
		head	=	"Nyame Helm",
		neck	=	"Rep. Plat. Medal",
		body	=	"Nyame Mail",
		hands	=	"Nyame Gauntlets",
		legs	=	"Nyame Flanchard",
		feet	=	"Nyame Sollerets",
		waist	=	"Kentarch Belt +1",
		lear	=	"Moonshade Earring",
		rear	=	"Mache Earring",
		lring	=	"Ilabrat Ring",
		rring	=	"Cornelia's Ring",
	}
	
	sets.me["Mordant Rime"] = {
		head	=	"Nyame Helm",
		neck	=	"Rep. Plat. Medal",
		body	=	"Nyame Mail",
		hands	=	"Nyame Gauntlets",
		legs	=	"Nyame Flanchard",
		feet	=	"Nyame Sollerets",
		waist	=	"Sailfi Belt",
		lear	=	"Regal Earring",
		rear	=	"Ishvara Earring",
		lring	=	"Metamorph Ring +1",
		rring	=	"Cornelia's Ring",
	}
    

    -- Feel free to add new weapon skills, make sure you spell it the same as in game. These are the only two I ever use though 
	
	
    ---------------
    -- Casting Sets
    ---------------
    sets.precast = {}   		-- Leave this empty 
    sets.midcast = {}    		-- Leave this empty  
    sets.aftercast = {}  		-- Leave this empty   
    sets.midcast.enhancing = {} 	-- leave this empty 
	sets.midcast.blue = {}		-- leave this empty
    ----------
    -- Precast
    ----------
      
    -- Generic Casting Set that all others take off of.
    sets.precast.casting = {
    }

	sets.precast.songs = {
		main	=	"Kali",
		sub		=	"Genmei Shield",
		range	=	"Linos",
		head	=	EMPY.Head,
		neck	=	"Loricate Torque +1",
		body	=	Ambu.S.Body,
		hands	=	"Gendewitha Gages +1",
		legs	=	"Kaykus Tights",
		feet	=	EMPY.Feet,
		waist	=	"Plat. Mog. Belt",
		back	=	BRDCape.Idle
		
	}
	sets.precast["Honor March"] = set_combine(sets.precast.songs,{
		range	=	"Marsyas"
		})

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

    
	 

	
	----------
    -- Midcast
    ----------
	
    -- Just go make it, inventory will thank you and making rules for each is meh.
    sets.midcast.Obi = {
    	waist="Hachirin-no-Obi",
    }
    sets.midcast.Orpheus = {
        --waist="Orpheus's Sash", -- Commented cause I dont have one yet
    }  


    -- Whatever you want to equip mid-cast as a catch all for all spells, and we'll overwrite later for individual spells
    sets.midcast.casting = {
        }
	sets.midcast.songs = {
		main	=	"Kali",
		range	=	"Linos",
		head	=	EMPY.Head,
		neck	=	"Moonbow Whistle",
		body	=	EMPY.Body,
		hands	=	EMPY.Hands,
		legs	=	Ambu.S.Legs,
		feet	=	EMPY.Feet
		
		}
	sets.midcast.songs.dummy = {
		range	=	"Daurdabla"
	}
	sets.midcast["Honor March"] = set_combine(sets.midcast.songs,{
		range	=	"Marsyas"
		})
    -- Enfeebling

	sets.midcast.Enfeebling = {} -- leave Empty
	--Type A-pure macc no potency mod
    sets.midcast.Enfeebling.macc = {
    }
	sets.midcast["Stun"] = set_combine(sets.midcast.Enfeebling.macc, {

	})
	--Type B-potency from: Mnd & "Enfeeb Potency" gear
    sets.midcast.Enfeebling.mndpot = set_combine(sets.midcast.Enfeebling.macc,{
	})

	-- Type C-potency from: Int & "Enfeeb Potency" gear
    sets.midcast.Enfeebling.intpot = set_combine(sets.midcast.Enfeebling.macc,{
	})

	--Type D-potency from: Enfeeb Skill & "Enfeeb Potency" gear
    sets.midcast.Enfeebling.skillpot = set_combine(sets.midcast.Enfeebling.macc,{
    })

	-- Tpe E-potency from: Enfeeb skill, Mnd, & "Enfeeb Potency" gear
    sets.midcast.Enfeebling.skillmndpot = set_combine(sets.midcast.Enfeebling.macc,{
	})

	-- Type F-potency from "Enfeebling potency" gear only
    sets.midcast.Enfeebling.potency = set_combine(sets.midcast.Enfeebling.macc,{
	})
	
    -- Enhancing yourself 
    sets.midcast.enhancing.duration = {
    }
    -- For Potency spells like Temper and Enspells
    sets.midcast.enhancing.potency = set_combine(sets.midcast.enhancing.duration, {
    }) 

    -- Phalanx
    sets.midcast.phalanx =  set_combine(sets.midcast.enhancing.duration, {
        head		=	"Chironic Hat",
        body		=	"Chironic Doublet",
        hands		=	"Chironic Gloves",
        legs		=	"Chironic Hose",
        feet		=	"Chironic Slippers",
    })

    -- Stoneskin
    sets.midcast.stoneskin = set_combine(sets.midcast.enhancing.duration, {
	    waist		=	"Siegel Sash",
	})
    
    sets.midcast.refresh = set_combine(sets.midcast.enhancing.duration, {
        waist =   "Gishdubar Sash",
    })
	
	sets.midcast.statusremoval = {
		}
    sets.midcast.aquaveil = set_combine(sets.midcast.refresh, {
	
	})
	
   
    sets.midcast.cure = {} -- Leave This Empty
    -- Cure Potency
    sets.midcast.cure.normal = set_combine(sets.midcast.casting,{
    })
    sets.midcast.cure.weather = set_combine(sets.midcast.cure.normal,{
    })    
	sets.midcast.cure.normal.self = set_combine(sets.midcast.cure.normal,{
	
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
	sets.midcast.blue.enm = {}
    ------------
    -- Aftercast
    ------------
      
    -- I don't use aftercast sets, as we handle what to equip later depending on conditions using a function.
	
end
