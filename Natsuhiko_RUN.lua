include('organizer-lib') -- optional
res = require('resources')
texts = require('texts')
include('Modes.lua')

-- Define your modes: 
-- You can add or remove modes in the table below, they will get picked up in the cycle automatically. 
-- to define sets for idle if you add more modes, name them: sets.me.idle.mymode and add 'mymode' in the group.
-- Same idea for nuke modes. 
idleModes = M('normal', 'dt', 'mdt')
meleeModes = M('tank', 'dps', 'hybrid', 'acc')
castModes = M('normal','sird')
lungeModes = M('normal','mb')

------------------------------------------------------------------------------------------------------
-- Important to read!
------------------------------------------------------------------------------------------------------
-- This will be used later down for weapon combos, here's mine for example, you can add your REMA+offhand of choice in there
-- Add you weapons in the Main list and/or sub list.
-- Don't put any weapons / sub in your IDLE and ENGAGED sets'
-- You can put specific weapons in the midcasts and precast sets for spells, but after a spell is 
-- cast and we revert to idle or engaged sets, we'll be checking the following for weapon selection. 
-- Defaults are the first in each list

mainWeapon = M('Epeolatry','Lionheart','Morgelai','Aettir','Lycurgos','Naegling','Malignance Sword','Dolichenus')
subWeapon = M('Refined Grip +1','Utu Grip',"Chanter's Shield")

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
	send_command('bind !end gs c hud lite')            -- Alt-End to toggle light hud version       
	send_command('bind ^end gs c hud keybinds')        -- CTRL-End to toggle Keybinds  
    send_command('bind f9 gs c toggle idlemode')
    send_command('bind f10 gs c toggle meleemode')

    send_command('bind f11 gs c toggle mainweapon')
    send_command('bind ^f11 gs c toggle subweapon')

	send_command('bind f12 gs c toggle melee')
	send_command('bind end gs c toggle cast')
	--send_command('bind !f12 gs c toggle runspeed')
	send_command('bind pageup gs c toggle runeup')
	send_command('bind pagedown gs c toggle runedown')

	send_command('bind !e input /ja "Embolden" <me>; gs equip sets.midcast.phalanx; input /p Embolden: Please Phalanx!')
	send_command('bind !b input /ja "Battuta" <me>')
	send_command('bind !r gs c cast rune')
	send_command('bind !~r input /ja "Rayke" <t>')
	send_command('bind !v input /ja "Vallation" <me>')
	send_command('bind !~v input /ja "Valiance" <me>')
	send_command('bind !o input /ja "One for All" <me>')


keybinds_on = {}
keybinds_on['key_bind_idle'] = '(F9)'
keybinds_on['key_bind_melee'] = '(F10)'
keybinds_on['key_bind_mainweapon'] = '(F11)'
keybinds_on['key_bind_subweapon'] = '(CTRL-F11)'

keybinds_on['key_bind_lock_weapon'] = '(F12)'
keybinds_on['key_bind_movespeed_lock'] = '(ALT-F12)'
keybinds_on['key_bind_rune'] = '(PgUP + PgDOWN)'

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
	send_command('unbind !b')
	send_command('unbind !e')
end

include('RUN_Lib.lua')

-- Optional. Swap to your sch macro sheet / book
set_macros(1,3) -- Sheet, Book
send_command('wait 6;input /lockstyleset 3')

refreshType = idleModes[1] -- leave this as is     

function get_sets()
    
    -- JSE
    AF = {}         -- leave this empty
    RELIC = {}      -- leave this empty
    EMPY = {}       -- leave this empty


	-- Fill this with your own JSE. 
    --Atrophy
    AF.Head		=	"Runeist Bandeau +2"
    AF.Body		=	"Runeist Coat +2"
    AF.Hands	=	"Runeist Mitons +2"
    AF.Legs		=	"Runeist Trousers +2"
    AF.Feet		=	"Runeist Bottes +2"

    --Vitiation
    RELIC.Head		=	"Futhark Bandeau +3"
    RELIC.Body		=	"Futhark Coat +3"
    RELIC.Hands 	=	"Futhark Mitons +3"
    RELIC.Legs		=	"Futhark Trousers +3"
    RELIC.Feet		=	"Futhark Boots +3"

    --Lethargy
    EMPY.Head		=	"Erilaz Galea +2"
    EMPY.Body		=	"Erilaz Surcoat +2"
    EMPY.Hands		=	"Erilaz Gauntlets +2"
    EMPY.Legs		=	"Erilaz Leg Guards +2"
    EMPY.Feet		=	"Erilaz Greaves +2"

	-- Capes:
    -- Ogma's and such, add your own.
	RUNCape = {}
	RUNCape.Parry = { name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Enmity+10','Parrying rate+5%',}}
	RUNCape.TPDA = { name="Ogma's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}}
	--RUNCape.STP = { name="Ogma's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10',}}
	RUNCape.STRDA = { name="Ogma's Cape", augments={'STR+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}}
	RUNCape.Sird = { name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Enmity+10','Spell interruption rate down-10%',}}
	
	-- SETS
    sets.me = {}        	-- leave this empty
    sets.buff = {} 			-- leave this empty
    sets.me.idle = {}		-- leave this empty
    sets.me.melee = {}      -- leave this empty
	sets.me.am = {}			-- leave this empty
    sets.weapons = {}		-- leave this empty
	
	 -- Optional 
    include('AugGear.lua') -- I list all my Augmented gears in a sidecar file since it's shared across many jobs. 

	sets.me.idle.normal = {
		ammo		=	"Homiliary",
		head		=	"Rawhide Mask",
		neck		=	"Rep. Plat. Medal",
		left_ear	=	"Tuisto Earring",
		right_ear	=	"Odnowa Earring +1",
		body		=	AF.Body,
		hands		=	EMPY.Hands,
		left_ring	=	"Shneddick Ring +1",
		right_ring	=	"Moonbeam Ring",
		waist		=	"Engraved Belt",
		legs		=	"Rawhide Trousers",
		back		=	RUNCape.Parry,
		feet		=	EMPY.Feet
	}
	
	sets.me.idle.dt = set_combine(sets.me.idle.refresh, {
			ammo	=	"Eluder's Sachet",
			head	=	"Nyame Helm",
			body	=	EMPY.Body,
			neck	=	"Null Loop",
			hands	=	"Turms Mittens +1",
			legs	=	EMPY.Legs,
			lring	=	"Defending Ring"
	})
	
	sets.me.idle.mdt = {}
	
	sets.me.resting = {}
	
	sets.me.melee.tank2hn = {
		ammo		=	"Staunch Tathlum +1",
		head		=	"Nyame Helm",
		neck		=	"Null Loop",
		left_ear	=	"Tuisto Earring",
		right_ear	=	"Odnowa Earring +1",
		body		=	EMPY.Body,
		hands		=	"Turms Mittens",
		left_ring	=	"Defending Ring",
		right_ring	=	"Gelatinous Ring +1",
		waist		=	"Plat. Mog. Belt",
		legs		=	EMPY.Legs,
		back		=	RUNCape.Parry,
		feet		=	EMPY.Feet
	}
	
	sets.me.melee.dps2hn = {
		ammo		=	"Coiste Bodhar",
		head		=	"Nyame Helm",
		neck		=	"Anu Torque",
		left_ear	=	"Telos Earring",
		right_ear	=	"Sherida Earring",
		body		=	"Ayanmo Corazza +2",
		hands		=	"Adhemar Wristbands",
		left_ring	=	"Epona's Ring",
		right_ring	=	"Niqmaddu Ring",
		waist		=	"Ioskeha Belt +1",
		legs		=	"Samnuha Tights",
		back		=	RUNCape.TPDA,
		feet		=	"Herculean Boots"
	
	}
	
	sets.me.melee.hybrid2hn = set_combine(sets.me.melee.dps2hn, {
		head		=	"Nyame Helm",
		neck		=	"Null Loop",
		body		=	"Nyame Mail",
		hands		=	"Nyame Gauntlets",
		legs		=	"Nyame Flanchard",
		feet		=	"Nyame Sollerets",
	})
	
	sets.me.melee.acc2hn = {}
	
	sets.me.melee.tanksw = {}
	
	sets.me.melee.dpssw = {}
	
	sets.me.melee.hybridsw = {}
	
	
	
	sets.me.death = {}
	
	
	------------------------------------------------------------------------------------------------------
    -- Weapon Skills sets just add them by name.
	------------------------------------------------------------------------------------------------------
    
    -- Great Sword
	
	sets.me['Resolution'] = {
		ammo		=	"Coiste Bodhar",
		neck		=	"Fotia Gorget",
		body		=	"Nyame Mail",
		left_ear	=	"Moonshade Earring",
		right_ear	=	"Sherida Earring",
		hands		=	EMPY.Hands,
		waist		=	"Sailfi Belt +1",
		legs		=	"Nyame Flanchard",
		feet		=	"Nyame Sollerets",
		lring		=	"Sroda Ring",
		rring		=	"Niqmaddu Ring",
		back		=	RUNCape.STRDA
	}
	
	
	sets.me['Dimidiation'] = {
		ammo		=	"Knobkierrie",
		head		=	"Nyame Helm",
		neck		=	"Rep. Plat. Medal",
		body		=	"Nyame Mail",
		left_ear	=	"Moonshade Earring",
		right_ear	=	"Odr Earring",
		hands		=	"Nyame Gauntlets",
		waist		=	"Sailfi Belt +!",
		legs		=	"Nyame Flanchard",
		feet		=	"Nyame Sollerets",
		lring		=	"Regal Ring",
		rring		=	"Niqmaddu Ring"
	}
	
	
	-- Sword
	
	sets.me['Savage Blade'] = {
		ammo		=	"Knobkierrie",
		neck		=	"Rep. Plat. Medal",
		left_ear	=	"Moonshade Earring",
		right_ear	=	"Sherida Earring",
		waist		=	"Sailfi Belt +1",
	
	
	}
	
	sets.me['Requiescat'] = {}
	

	-- Great Axe
	
	sets.me['Upheval'] = {}
	
	sets.me['Fell Cleave'] = {}
	
	-- Club
	
	
	-- Feel free to add new weapon skills, make sure you spell it the same as in game. 
	sets.me.enmity = {
		ammo		=	"Sapience Orb",
		head		=	"Halitus Helm",
		body		=	"Emet Harness +1",
		neck		= 	"Unmoving Collar +1",
		waist		=	"Kasiri Belt",
		legs		=	EMPY.Legs,
		feet		=	EMPY.Feet,
		rear		=	"Cryptic Earring",
		lring		=	"Supershear Ring",
		rring		=	"Eiwaz Ring",
		back		=	RUNCape.Parry
	}
	
    ---------------
    -- Casting Sets
    ---------------
    sets.precast = {}   		-- Leave this empty  
    sets.midcast = {}    		-- Leave this empty  
    sets.aftercast = {}  		-- Leave this empty  
    sets.midcast.enhancing = {} 	-- leave this empty 
	sets.midcast.blue = {}		-- leave this empty
	sets.midcast.blue.enm = {} -- leave this empty
	
	----------
    -- Precast
    ----------
      
    -- Generic Casting Set that all others take off of. Here you should add all your fast cast RDM need 50 pre JP 42 at master
    sets.precast.casting = {
		ammo		=	"Sapience Orb",
		head		=	AF.Head,
		neck		=	"", --Voltsurge
		left_ear	=	"Loquacious Earring", --Etiolation
		right_ear	=	"Odnowa Earring +1",
		body		=	EMPY.Body,
		hands		=	"Leyline Gloves",
		legs		=	"Agwu's Slops",
		feet		=	"Carmine Greaves +1",
		left_ring	=	"Kishar's Ring",
		right_ring	=	"Gelatinous Ring +1",
		waist		=	"Kasiri Belt",}
	
	sets.precast.casting.inspiration = {}
	
	-- Enhancing Magic, eg. Siegal Sash, etc
    sets.precast.enhancing = set_combine(sets.precast.casting,{
		legs		=	RELIC.Legs,
		waist		=	"Siegel Sash",

    })
	
	-- Inspiration (5/5 assumed)
	sets.precast.inspiration = set_combine(sets.precast.casting, {
		head		=	"Nyame Helm",
		hands		=	"Nyame Gauntlets",
		legs		=	RELIC.Legs,
		feet		=	"Nyame Sollerets",
	})
  
    -- Stoneskin casting time -, works off of enhancing -
    sets.precast.stoneskin = set_combine(sets.precast.enhancing,{

    })
	
	---------------------
    -- Ability Precasting
    ---------------------
	
	sets.precast['Elemental Sforzo'] = set_combine(sets.me.enmity,{
		body=RELIC.Body
	})
	
	sets.precast['Swordplay'] = set_combine(sets.me.enmity,{
		hands=RELIC.Hands
	})
	
	sets.precast['Vallation'] = set_combine(sets.me.enmity,{
		body=AF.Body
	})
	
	sets.precast['Valiance'] = sets.precast['Vallation']
	
	sets.precast['Vivacious Pulse'] = set_combine(sets.me.enmity,{
		main="Morgelai",
		head=EMPY.Head,
		
	})
	
	sets.precast['Gambit'] = set_combine(sets.me.enmity,{
		hands=AF.Hands
	})
	
	sets.precast['Battuta'] = set_combine(sets.me.enmity,{
		head=RELIC.Head
	})
	
	sets.precast['Rayke'] = set_combine(sets.me.enmity,{
		feet=RELIC.Feet
	})
	
	sets.precast['Liement'] = set_combine(sets.me.enmity,{
		body=RELIC.Body
	})
	
	sets.precast['One for All'] = {
		head		=	AF.Head,
		body		=	AF.Body,
		hands		=	"", --Regal
		legs		=	RELIC.Legs,
		feet		=	"", --Turms
	
	}
	
	sets.me.lunge = {}
	
	
	sets.me.lunge.normal = {}
	
	sets.me.lunge.mb = set_combine(sets.me.lunge.normal,{})
	
	-- /DRK
	
	sets.precast['Last Resort'] = {}
	
	sets.precast['Weapon Bash'] = {}
	
	-- /WAR
	
	sets.precast['Provoke'] = {}
	
    
	----------
    -- Midcast
    ----------
	
	-- Whatever you want to equip mid-cast as a catch all for all spells, and we'll overwrite later for individual spells
    sets.midcast.casting = {}
	
	sets.midcast.enhancing.duration = {
		head		=	EMPY.Head,
		neck		=	"Incanter's Torque",
		left_ear	=	"Mimir Earring",
		right_ear	=	"Odnowa Earring +1",
		hands		=	AF.Hands,
		waist		=	"Olympus Sash",
		legs		=	RELIC.Legs}
	
	-- Temper
	sets.midcast.enhancing.potency = {
	
		neck		=	"Incanter's Torque",
		hands		=	AF.Hands,
		legs		=	"Carmine Cuisses +1",
		waist		=	"Olympus Sash",
		back		=	"Merciful Cape"
		
	}
	
	sets.midcast.divine ={}
	-- Flash
	sets.midcast.divine.recast = {}
	
	sets.midcast.sird	=	{
		main = "Morgelai",
		sub = "Utu Grip",
		ammo = "Staunch Tathlum +1",
		head = EMPY.Head,
		body = "Adamantite Armor",
		hands = "Rawhide Gloves",
		legs = "Carmine Cuisses +1",
		feet = EMPY.Feet,
		lear = "Magnetic Earring",
		rear = "Erilaz Earring +1",
		lring = "Defending Ring",
		rring = "Gelantinous Ring +1",
		back = RUNCape.Sird,
	}
	
	
	
	sets.midcast.phalanx = {
		head		=	RELIC.Head,
		body		=	"Herculean Vest",
		legs		=	"Herculean Trousers"
	}
		
	sets.midcast.stoneskin = {}
	
	sets.midcast.refresh = {
		waist		=	"Gishdubar Sash"
	}
	
	sets.midcast.aquaveil = {}
	
	
	
	---------------
    -- Blue Magic
    ---------------
	sets.midcast.blue.phys = {}
	sets.midcast.blue.macc = {}
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

