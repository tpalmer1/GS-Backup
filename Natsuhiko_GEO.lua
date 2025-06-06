
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
        gs c toggle melee               Toggle Melee mode on / off and locking of weapons
        gs c toggle mb                  Toggles Magic Burst Mode on / off.
        gs c toggle runspeed            Toggles locking on / off Herald's Gaiters
        gs c toggle idlemode            Toggles between Refresh and DT idle mode. Activating Sublimation JA will auto replace refresh set for sublimation set. DT set will superceed both.        
        gs c toggle regenmode           Toggles between Hybrid, Duration and Potency mode for regen set  
        gs c toggle nukemode            Toggles between Normal and Accuracy mode for midcast Nuking sets (MB included)  
        gs c toggle matchsc             Toggles auto swapping element to match the last SC that just happenned.
		
        Casting functions:
        these are to set fewer macros (2 cycle, 5 cast) to save macro space when playing lazily with controler
        
        gs c nuke cycle              	Cycles element type for nuking & SC
		gs c nuke cycledown				Cycles element type for nuking & SC	in reverse order
        gs c nuke t1                    Cast tier 1 nuke of saved element 
        gs c nuke t2                    Cast tier 2 nuke of saved element 
        gs c nuke t3                    Cast tier 3 nuke of saved element 
        gs c nuke t4                    Cast tier 4 nuke of saved element 
        gs c nuke t5                    Cast tier 5 nuke of saved element 
        gs c nuke ra1                   Cast tier 1 -ra nuke of saved element 
        gs c nuke ra2                   Cast tier 2 -ra nuke of saved element 
        gs c nuke ra3                   Cast tier 3 -ra nuke of saved element
		gs c nuke helix					Cast helix of saved element
		gs c nuke storm					Cast storm of saved element
		
		gs c geo geocycle				Cycles Geomancy Spell
		gs c geo geocycledown			Cycles Geomancy Spell in reverse order
		gs c geo indicycle				Cycles IndiColure Spell
		gs c geo indicycledown			Cycles IndiColure Spell in reverse order
		gs c geo geo					Cast saved Geo Spell
		gs c geo indi					Cast saved Indi Spell

        HUD Functions:
        gs c hud hide                   Toggles the Hud entirely on or off
        gs c hud hidemode               Toggles the Modes section of the HUD on or off
        gs c hud hidejob                Toggles the job section of the HUD on or off
        gs c hud hidebattle             Toggles the Battle section of the HUD on or off
        gs c hud lite                   Toggles the HUD in lightweight style for less screen estate usage. Also on ALT-END
        gs c hud keybinds               Toggles Display of the HUD keybindings (my defaults) You can change just under the binds in the Gearsets file.

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


include('organizer-lib') -- Remove if you dont use Organizer

--------------------------------------------------------------------------------------------------------------
res = require('resources')      -- leave this as is    
texts = require('texts')        -- leave this as is    
include('Modes.lua')            -- leave this as is      
--------------------------------------------------------------------------------------------------------------

-- Define your modes: 
-- You can add or remove modes in the table below, they will get picked up in the cycle automatically. 
-- to define sets for idle if you add more modes, name them: sets.me.idle.mymode and add 'mymode' in the group.
-- to define sets for regen if you add more modes, name them: sets.midcast.regen.mymode and add 'mymode' in the group.
-- Same idea for nuke modes. 
idleModes = M('normal', 'dt', 'mdt')
-- To add a new mode to nuking, you need to define both sets: sets.midcast.nuking.mynewmode as well as sets.midcast.MB.mynewmode
nukeModes = M('normal', 'acc')

-- Setting this to true will stop the text spam, and instead display modes in a UI.
-- Currently in construction.
use_UI = true
hud_x_pos = 950    --important to update these if you have a smaller screen
hud_y_pos = 50     --important to update these if you have a smaller screen
hud_draggable = true
hud_font_size = 10
hud_transparency = 200 -- a value of 0 (invisible) to 255 (no transparency at all)
hud_font = 'Arial'

-- Setup your Key Bindings here:  
    windower.send_command('bind insert gs c nuke cycle')            -- insert Cycles Nuke element
    windower.send_command('bind delete gs c nuke cycledown')        -- delete Cycles Nuke element in reverse order   
    windower.send_command('bind home gs c geo geocycle') 			-- home Cycles Geomancy Spell
    windower.send_command('bind end gs c geo geocycledown') 		-- end Cycles Geomancy Spell in reverse order	
    windower.send_command('bind PAGEUP gs c geo indicycle') 		-- PgUP Cycles IndiColure Spell
    windower.send_command('bind PAGEDOWN gs c geo indicycledown') 	    -- PgDown Cycles IndiColure Spell in reverse order	
    windower.send_command('bind !f12 gs c toggle runspeed') 			-- Alt-F9 toggles locking on / off Herald's Gaiters
	windower.send_command('bind !f10 gs c toggle mb')				-- F10 toggles Magic Burst Mode on / off.
    windower.send_command('bind f10 gs c toggle nukemode')         -- Alt-F10 to change Nuking Mode
    windower.send_command('bind ^F10 gs c toggle matchsc')          -- CTRL-F10 to change Match SC Mode         
    windower.send_command('bind f12 gs c toggle melee')				-- F12 Toggle Melee mode on / off and locking of weapons
	windower.send_command('bind f9 gs c toggle idlemode')			-- F9 Toggles between MasterRefresh or MasterDT when no luopan is out
	windower.send_command('bind ^end gs c hud keybinds')
	windower.send_command('bind !end gs c hud lite')  

	windower.send_command('bind !f input /ja "Full Circle" <me>')
	windower.send_command('bind !n input /ja "Entrust" <me>')
	windower.send_command('bind !m input /ja "Radial Arcana" <me>')
	windower.send_command('bind !b input /ja "Blaze of Glory" <me>')
	windower.send_command('bind !e input /ja "Ecliptic Attrition" <me>')
	windower.send_command('bind !d input /ja "Dematerialize" <me>')
--[[
    This gets passed in when the Keybinds is turned on.
    Each one matches to a given variable within the text object
    IF you changed the Default Keybind above, Edit the ones below so it can be reflected in the hud using "//gs c hud keybinds" command
]]																	-- or between Full Pet Regen+DT or Hybrid PetDT and MasterDT when a Luopan is out
keybinds_on = {}
keybinds_on['key_bind_idle'] = '(F9)'
keybinds_on['key_bind_regen'] = '(END)'
keybinds_on['key_bind_casting'] = '(F10)'
keybinds_on['key_bind_mburst'] = '(ALT-F10)'
keybinds_on['key_bind_matchsc'] = '(CTRL-F10)'

keybinds_on['key_bind_element_cycle'] = '(INS + DEL)'
keybinds_on['key_bind_geo_cycle'] = '(HOME + END)'
keybinds_on['key_bind_indi_cycle'] = '(PgUP + PgDOWN)'
keybinds_on['key_bind_lock_weapon'] = '(F12)'
keybinds_on['key_bind_movespeed_lock'] = '(ALT-F12)'


-- Remember to unbind your keybinds on job change.
function user_unload()
    send_command('unbind insert')
    send_command('unbind delete')
    send_command('unbind home')
    send_command('unbind PAGEUP')
    send_command('unbind PAGEDOWN')
    send_command('unbind end')
    send_command('unbind f10')
    send_command('unbind f12')
    send_command('unbind f9')
    send_command('unbind !f12')
	send_command('unbind !end')
	
	send_command('unbind !f')
	send_command('unbind !n')
	send_command('unbind !m')
	send_command('unbind !b')
	send_command('unbind !e')
	send_command('unbind !d')
end

--------------------------------------------------------------------------------------------------------------
include('GEO_Lib.lua')          -- leave this as is     
--------------------------------------------------------------------------------------------------------------

geomancy:set('Geo-Frailty')     -- Geo Spell Default      (when you first load lua / change jobs the saved spells is this one)
indicolure:set('Indi-Haste')    -- Indi Spell Default     (when you first load lua / change jobs the saved spells is this one)
validateTextInformation()

-- Optional. Swap to your geo macro sheet / book
set_macros(1,5) -- Sheet, Book 
send_command('wait 6;input /lockstyleset 5')
    
-- Setup your Gear Sets below:
function get_sets()
  	AF = {}
	RELIC = {}
	EMPY ={}
	
	AF.Head = "Geomancy Galero +1"
	AF.Body = "Geomancy Tunic +1"
	AF.Hands = "Geomancy Mitaines +2"
	AF.Legs = "Geomancy Pants +1"
	AF.Feet = "Geomancy Sandals +1"
	
	RELIC.Head = "Bagua Galero +1"
	RELIC.Body = "Bagua Tunic"
	RELIC.Hands = "Bagua Mitaines +3"
	RELIC.Legs = "Bagua Pants +3"
	RELIC.Feet = "Bagua Sandals +2"
	
	EMPY.Head = "Azimuth Hood +3"
	EMPY.Body = "Azimuth Coat +3"
	EMPY.Hands = "Azimuth Gloves +3"
	EMPY.Legs = "Azimuth Tights +3"
	EMPY.Feet = "Azimuth Gaiters +3"
	
	GEOCape = {}
	
	GEOCape.Idle = {}
	GEOCape.PetIdle = { name="Nantosuelta's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Pet: "Regen"+10','Pet: "Regen"+5',}}
	GEOCape.Nuke = { name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10','Damage taken-5%',}}
	GEOCape.FC = { name="Nantosuelta's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10',}}
	GEOCape.TPDA = { name="Nantosuelta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}}
	
    -- My formatting is very easy to follow. All sets that pertain to my character doing things are under 'me'.
    -- All sets that are equipped to faciliate my.pan's behaviour or abilities are under .pan', eg, Perpetuation, Blood Pacts, etc
      
    sets.me = {}        -- leave this empty
    sets.pan = {}       -- leave this empty
	sets.me.idle = {}	-- leave this empty    
	sets.pan.idle = {}	-- leave this empty 

	-- sets starting with sets.me means you DONT have a luopan currently out.
	-- sets starting with sets.pan means you DO have a luopan currently out.

    -- Your idle set when you DON'T have a luopan out
    sets.me.idle.normal = {
		main = "Daybreak",
		sub = "Genmei Shield",
		range = "Dunna",
		neck = "Rep. Plat. Medal",
		head = "Befouled Crown",
		body = EMPY.Body,
		hands = RELIC.Hands,
		legs = EMPY.Legs,
		feet = EMPY.Feet,
		left_ear = "Eabani Earring",
		right_ear	=	"Arete del Luna +1",
		left_ring = "Shneddick Ring +1",
		right_ring	=	"Shadow Ring",
		waist = "Carrier's Sash",
		back = GEOCape.PetIdle,

    }
	
	-- This or herald gaiters or +1 +2 +3... 
	sets.me.movespeed = {feet=AF.Feet}	
	
    -- Your idle MasterDT set (Notice the sets.me, means no Luopan is out)
    sets.me.idle.dt = set_combine(sets.me.idle.normal,{
			head = "Nyame Helm",
			body = "Nyame Mail",
			hands = "Nyame Gauntlets",
			legs = "Nyame Flanchard",
			feet = "Nyame Sollerets"

    })
    sets.me.idle.mdt = set_combine(sets.me.idle.normal,{

    })	
    -- Your MP Recovered Whilst Resting Set
    sets.me.resting = { 

    }
	
	sets.me.latent_refresh = {waist="Fucho-no-obi"}
	
	
    -----------------------
    -- Luopan Perpetuation
    -----------------------
      
    -- Luopan's Out --  notice sets.pan 
    -- This is the base for all perpetuation scenarios, as seen below
    sets.pan.idle.normal = {
		main = "Idris",
		sub = "Genmei Shield",
		range = "Dunna",
		head = EMPY.Head,
		body = "Nyame Mail",
		neck = "Loricate Torque +1",
		hands = AF.Hands,
		legs = EMPY.Legs,
		feet = RELIC.Feet,
		left_ear = "Eabani Earring",
		right_ear = "Odnowa Earring +1",
		left_ring = "Defending Ring",
		right_ring = "Shadow Ring",
		waist = "Isa Belt",
		back = GEOCape.PetIdle,

    }
	
	-- This is when you have a Luopan out but want to sacrifice some slot for master DT, put those slots in.
    sets.pan.idle.dt = set_combine(sets.pan.idle.normal,{
			legs = "Nyame Flanchard"

    })   
    sets.pan.idle.mdt = set_combine(sets.pan.idle.normal,{

    })   
    -- Combat Related Sets
      
    -- Melee
    -- Anything you equip here will overwrite the perpetuation/refresh in that slot.
	-- No Luopan out
	-- they end in [idleMode] so it will derive from either the normal or the dt set depending in which mode you are then add the pieces filled in below.
    sets.me.melee = set_combine(sets.me.idle[idleMode],{
		head = "Nyame Helm",
		body = "Nyame Mail",
		hands = "Gazu Bracelets +1",
		legs = "Nyame Flanchard",
		feet = "Nyame Sollerets",
		neck = "Null Loop",
		waist = "Grunfeld Rope",
		left_ear = "Telos Earring",
		right_ear = "Crep. Earring",
		left_ring	=	{name="Chirich Ring +1",bag="wardrobe1"},
        right_ring	=	{name="Chirich Ring +1",bag="wardrobe2"},
        back = GEOCape.TPDA
    })
	
    -- Luopan is out
	sets.pan.melee = set_combine(sets.pan.idle[idleMode],{
		head = "Nyame Helm",
		body = "Nyame Mail",
		hands = "Gazu Bracelets +1",
		legs = "Nyame Flanchard",
		feet = "Nyame Sollerets",
		neck = "Null Loop",
		waist = "Grunfeld Rope",
		left_ear = "Telos Earring",
		right_ear = "Crep. Earring",
		left_ring	=	{name="Chirich Ring +1",bag="wardrobe1"},
        right_ring	=	{name="Chirich Ring +1",bag="wardrobe2"},
        back = GEOCape.TPDA

    }) 
    
    -- Weapon Skill sets
	-- Example:
	sets.me["Hexa Strike"] = {
		head = "Nyame Helm",
		body = "Nyame Mail",
		hands = "Nyame Gauntlets",
		legs = "Nyame Flanchard",
		feet = "Nyame Sollerets",
		neck = "Fotia Gorget",
		waist = "Fotia Belt"
	}
	sets.me["Judgment"] = {
		ammo = "Oshasha's Treatise",
		head = "Nyame Helm",
		body = "Nyame Mail",
		hands = "Nyame Gauntlets",
		legs = "Nyame Flanchard",
		feet = "Nyame Sollerets",
		neck = "Rep. Plat. Medal",
		left_earring = "Moonshade Earring",
		right_earring = "Brutal Earring",
		
		left_ring = "Rufescent Ring",
		right_ring = "Cornelia's Ring",
	}
	
    sets.me["Flash Nova"] = {
		head = "Nyame Helm",
		body = "Nyame Mail",
		hands = "Nyame Gauntlets",
		legs = "Nyame Flanchard",
		feet = "Nyame Sollerets",
		left_ring = "Weather. Ring +1",
		right_ring = "Cornelia's Ring",
    }
	
	sets.me["Seraph Strike"] = sets.me["Flash Nova"]
	
	sets.me["Black Halo"] = {
		ammo = "Oshasha's Treatise",
		head = "Nyame Helm",
		body = "Nyame Mail",
		hands = "Nyame Gauntlets",
		legs = "Nyame Flanchard",
		feet = "Nyame Sollerets",
		neck = "Rep. Plat. Medal",
		left_earring = "Moonshade Earring",
		right_earring = "Brutal Earring",
		
		left_ring = "Rufescent Ring",
		right_ring = "Cornelia's Ring",
		
	}

    sets.me["Realmrazer"] = {
		head = "Nyame Helm",
		body = "Nyame Mail",
		hands = "Nyame Gauntlets",
		legs = "Nyame Flanchard",
		feet = "Nyame Sollerets",
		neck = "Fotia Gorget",
		waist = "Fotia Belt",
    }
	
    sets.me["Exudation"] = {
		ammo = "Oshasha's Treatise",
		head = "Nyame Helm",
		body = "Nyame Mail",
		hands = "Nyame Gauntlets",
		legs = "Nyame Flanchard",
		feet = "Nyame Sollerets",
		neck = "Sibyl Scarf",
		waist = "Acuity Belt +1",
		left_ear = "Malignance Earring",
		right_ear = "Regal Earring",
		left_ring = "Metamor. Ring +1",
		right_ring = "Cornelia's Ring"

    }
	
	sets.me["Cataclysm"] = {
		head = "Pixie Hairpin +1",
		body = EMPY.Body,
		hands = EMPY.Hands,
		legs = EMPY.Legs,
		feet = EMPY.Feet,
		neck = "Sibyl Scarf",
		waist = "Eschan Stone",
		left_ear = "Malignance Earring",
		right_ear =	"Moonshade Earring",
		left_ring = "Archon Ring",
		right_ring = "Metamorph Ring +1"
		
	}
	
	sets.me["Aeolian Edge"] = set_combine(sets.me["Cataclysm"],{
			head = EMPY.Head,
			left_ring	=	""
			})
    -- Feel free to add new weapon skills, make sure you spell it the same as in game.
  
    ---------------
    -- Casting Sets
    ---------------
      
    sets.precast = {}               -- leave this empty    
    sets.midcast = {}               -- leave this empty    
    sets.aftercast = {}             -- leave this empty    
    sets.midcast.nuking = {}        -- leave this empty
    sets.midcast.MB = {}            -- leave this empty    
    ----------
    -- Precast
    ----------
      
    -- Generic Casting Set that all others take off of. Here you should add all your fast cast  
    sets.precast.casting = {
		main = "Solstice",
		range = "Dunna",
		body = "Merlinic Jubbah",
		legs = AF.Legs,
		left_ear = "Malignance Earring",
		left_ring = "Kishar Ring",
		back = GEOCape.FC

    }   

    sets.precast.geomancy = set_combine(sets.precast.casting,{
        
    })
    -- Enhancing Magic, eg. Siegal Sash, etc
    sets.precast.enhancing = set_combine(sets.precast.casting,{

    })
  
    -- Stoneskin casting time -, works off of enhancing -
    sets.precast.stoneskin = set_combine(sets.precast.enhancing,{

    })
      
    -- Curing Precast, Cure Spell Casting time -
    sets.precast.cure = set_combine(sets.precast.casting,{

    })
    sets.precast.regen = set_combine(sets.precast.casting,{

    })     
    ---------------------
    -- Abilities
    ---------------------
	
	-- JAs on yourself
    sets.precast["Life Cycle"] = {
    	body = AF.Body,
    }
    sets.precast["Bolster"] = {
    	body = RELIC.Body,
    }
    sets.precast["Full Circle"] = {
    	head = EMPY.Head,
		hands = RELIC.Hands, -- Curative Recantation
    }
	
	-- JAs that emanate from the loupan
    sets.pan["Mending Halation"] = {
    	legs = RELIC.Legs,
    }
    sets.pan["Radial Arcana"] = {
    	feet = RELIC.Feet,
    }
	sets.pan["Concentric Pulse"] = {
		head = RELIC.Head
	}

    ----------
    -- Midcast
    ----------
            
    -- Whatever you want to equip mid-cast as a catch all for all spells, and we'll overwrite later for individual spells
    sets.midcast.casting = {
		head = EMPY.Head

    }
	
	-- For Geo spells /
    sets.midcast.geo = set_combine(sets.midcast.casting,{
			main = "Idris",
			sub = "Genmei Shield",
			range = "Dunna",
			head = EMPY.Head,
			body = RELIC.Body,
			hands = AF.Hands,
			legs = RELIC.Legs,
			feet = EMPY.Feet,
			neck = "Incanter's Torque",
			back = "Lifestream Cape",
			right_ear = "Azimuth Earring"
			

    })
	-- For Indi Spells
    sets.midcast.indi = set_combine(sets.midcast.geo,{

    })
	sets.midcast.indi.entrust = set_combine(sets.midcast.indi,{
			main = "Gada"
    })

	sets.midcast.Obi = {
	    waist="Hachirin-no-Obi",
	}
	-- Nuking
    sets.midcast.nuking.normal = set_combine(sets.midcast.casting,{
		main = "Bunzi's Rod",
		sub = "Ammurapi Shield",
		ammo = "Ghastly Tathlum +1",
		head = EMPY.Head,
		body = EMPY.Body,
		hands = EMPY.Hands,
		legs = EMPY.Legs,
		feet = EMPY.Feet,
		neck = "Sibyl Scarf",
		left_ear = "Malignance Earring",
		right_ear = "Azimuth Earring",
		waist = "Eschan Stone",
		left_ring = "Freke Ring",
		right_ring = "Metamor. Ring +1",
		back = GEOCape.Nuke


    })
	sets.midcast.MB.normal = set_combine(sets.midcast.nuking.normal, {
			
	})
    sets.midcast.nuking.acc = set_combine(sets.midcast.nuking.normal,{

    })
    sets.midcast.MB.acc = set_combine(sets.midcast.MB.normal, {

    })
	-----------------------------------------------------------------------------------------------
	-- Helix sets automatically derives from casting sets. SO DONT PUT ANYTHING IN THEM other than:
	-- Belt that isn't Obi.
	-- Noctohelix automatically looks for pixie hairpin +1.
	-----------------------------------------------------------------------------------------------
    -- Make sure you have a non weather obi in this set. Helix get bonus naturally no need Obi.
	sets.midcast.helix =  {
			
	}

	-- Enfeebling
	sets.midcast.IntEnfeebling = set_combine(sets.midcast.casting,{

    })
	sets.midcast.MndEnfeebling = set_combine(sets.midcast.casting,{

    })
	
    -- Enhancing
    sets.midcast.enhancing = set_combine(sets.midcast.casting,{
		head	=	"Telchine Cap",
		legs	=	"Telchine Braconi",
    })
	
    -- Stoneskin
    sets.midcast.stoneskin = set_combine(sets.midcast.enhancing,{
		neck = "Stone Gorget"

    })
    sets.midcast.refresh = set_combine(sets.midcast.enhancing,{
    })
    sets.midcast.aquaveil = set_combine(sets.midcast.refresh, {
		main = "Vadose Rod",
		sub = "Ammurapi Shield"
	})
	
	sets.midcast["Drain"] = set_combine(sets.midcast.IntEnfeebling, {
		-- Sinister Reign Club
		-- Omen Shield
		head = RELIC.Head,
		body = AF.Body,
		hands = "", --Merlinic
		legs = EMPY.Legs,
		feet = "", --Agwu
		neck = "Erra Pendant",
		left_ring = "Archon Ring",
		right_ring = "Evanescence Ring"
	})

	sets.midcast["Aspir"] = sets.midcast["Drain"]
	
	sets.midcast["Absorb-TP"] = {}
     
    sets.midcast.cure = {} -- Leave This Empty
    -- Cure Potency
    sets.midcast.cure.normal = set_combine(sets.midcast.casting,{
			main = "Daybreak",
			sub = "Ammurapi Shield",
			head = "Vanya Hood",
			body = "Vanya Robe",
			hands = "Vanya Cuffs",
			legs = "Vanya Slops",
			feet = "Vanya Clogs",
			left_ear = "Meili Earring",
			right_ear = "Mendi. Earring",

    })
    sets.midcast.cure.weather = set_combine(sets.midcast.cure.normal,{

    })    
    sets.midcast.regen = set_combine(sets.midcast.enhancing,{

    }) 
   
    ------------
    -- Aftercast
    ------------
      
    -- I don't use aftercast sets, as we handle what to equip later depending on conditions using a function, eg, do we have a Luopan pan out?
  
end
