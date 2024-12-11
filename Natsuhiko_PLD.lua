include('organizer-lib') -- optional
res = require('resources')
texts = require('texts')
include('Modes.lua')

-- Define your modes: 
-- You can add or remove modes in the table below, they will get picked up in the cycle automatically. 
-- to define sets for idle if you add more modes, name them: sets.me.idle.mymode and add 'mymode' in the group.
-- Same idea for nuke modes. 
idleModes = M('tank','refresh', 'dt', 'mdt')
meleeModes = M('tank', 'hybrid', 'acc')
castModes = M('normal','sir')
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

mainWeapon = M('Almace','Excalibur','Naegling','Malignance Sword','Sequence','Divinity', 'Takoba')
subWeapon = M('Duban','Blurred Shield +1','Tzacab Grip')

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
	send_command('bind !f12 gs c toggle cast')
	send_command('bind pageup gs c toggle runeup')
	send_command('bind pagedown gs c toggle runedown')

	send_command('bind !s input /ja "Sentinel" <me>')
	send_command('bind !m input /ja "Majesty" <me>')
	send_command('bind !p input /ja "Palisade" <me>')


keybinds_on = {}
keybinds_on['key_bind_idle'] = '(F9)'
keybinds_on['key_bind_melee'] = '(F10)'
keybinds_on['key_bind_mainweapon'] = '(F11)'
keybinds_on['key_bind_subweapon'] = '(CTRL-F11)'
keybinds_on['key_bind_cast'] = ''
keybinds_on['key_bind_lock_weapon'] = '(F12)'
keybinds_on['key_bind_movespeed_lock'] = '(ALT-F12)'
keybinds_on['key_bind_rune'] = '(PgUP + PgDOWN)'
keybinds_on['key_bind_lunge'] = ' '

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
	send_command('unbind ^m')
	send_command('unbind ^s')
	send_command('unbind ^p')
    send_command('unbind ^end')  	
end

include('PLD_Lib.lua')

-- Optional. Swap to your sch macro sheet / book
set_macros(1,4) -- Sheet, Book
send_command('wait 6;input /lockstyleset 2')

refreshType = idleModes[1] -- leave this as is     

function get_sets()
    
    -- JSE
    AF = {}         -- leave this empty
    RELIC = {}      -- leave this empty
    EMPY = {}       -- leave this empty


	-- Fill this with your own JSE. 
    --Reverence
    AF.Head		=	""
    AF.Body		=	"Rev. Surcoat +1"
    AF.Hands	=	""
    AF.Legs		=	"Rev. Breeches"
    AF.Feet		=	"Rev. Leggings"

    --Caballarius
    RELIC.Head		=	""
    RELIC.Body		=	""
    RELIC.Hands 	=	""
    RELIC.Legs		=	""
    RELIC.Feet		=	""

    --Chevalier
    EMPY.Head		=	"Chev. Armet +2"
    EMPY.Body		=	""
    EMPY.Hands		=	""
    EMPY.Legs		=	"Chev. Cuisses +2"
    EMPY.Feet		=	""

	-- Capes:
    -- Rudianos's and such, add your own.
	PLDCape = {}
	
	-- SETS
    sets.me = {}        		-- leave this empty
    sets.buff = {} 			-- leave this empty
    sets.me.idle = {}			-- leave this empty
    sets.me.melee = {}          	-- leave this empty
    sets.weapons = {}			-- leave this empty
	
	 -- Optional 
    include('AugGear.lua') -- I list all my Augmented gears in a sidecar file since it's shared across many jobs. 

	sets.me.idle.tank = {
		ammo	=	"Staunch Tathlum +1",
		head	=	EMPY.Head,
		neck	=	"Unmoving Collar +1",
		body	=	"Sakpata's Plate",
		hands	=	"Sakpata's Gauntlets",
		lear	=	"Tuisto Earring",
		rear	=	"Odnowa Earring +1",
		
		lring	=	"Shneddick Ring +1",
		rring	=	"Shadow Ring",
		back	=	"Rudianos's Mantle",
		waist	=	"Sailfi Belt +1",
		legs	=	EMPY.Legs,
		feet	=	"Sakpata's Leggings"
	}
	
	sets.me.idle.refresh = {}
	
	sets.me.idle.dt = {}
	
	sets.me.idle.mdt = {}
	
	sets.me.resting = {}
	
	sets.me.melee.tank2hn = {}
	
	
	sets.me.melee.hybrid2hn = {
		ammo	=	"Coiste Bodhar",
		head	=	"Sakpata's Helm",
		neck	=	"Combatant's Torque",
		lear	=	"Telos Earring",
		rear	=	"Odnowa Earring +1",
		body	=	"Sakpata's Plate",
		hands	=	"Sakpata's Gauntlets",
		lring	=	"Moonbeam Ring",
		rring	=	"Petrov Ring",
		back	=	"Bleating Mantle",
		waist	=	"Sailfi Belt +1",
		legs	=	"Sakpata's Cuisses",
		feet	=	"Sakpata's Leggings"
	}
	
	sets.me.melee.acc2hn = {}
	
	sets.me.melee.tanksw = {
		ammo	=	"Staunch Tathlum +1",
		head	=	EMPY.Head,
		neck	=	"Unmoving Collar +1",
		lear	=	"Tuisto Earring",
		rear	=	"Odnowa Earring +1",
		body	=	"Sakpata's Plate",
		hands	=	"Sakpata's Gauntlets",
		lring	=	"Defending Ring",
		rring	=	"Gelatinous Ring +1",
		back	=	"Rudianos's Mantle",
		waist	=	"Sailfi Belt +1",
		legs	=	EMPY.Legs,
		feet	=	"Sakpata's Leggings"
	}
	
	
	sets.me.melee.hybridsw = {
		ammo	=	"Coiste Bodhar",
		head	=	"Sakpata's Helm",
		neck	=	"Combatant's Torque",
		lear	=	"Telos Earring",
		rear	=	"Odnowa Earring +1",
		body	=	"Sakpata's Plate",
		hands	=	"Sakpata's Gauntlets",
		lring	=	"Moonbeam Ring",
		rring	=	"Petrov Ring",
		back	=	"Bleating Mantle",
		waist	=	"Sailfi Belt +1",
		legs	=	"Sakpata's Cuisses",
		feet	=	"Sakpata's Leggings"
	}
	
	sets.me.death = {}
	
	sets.me.enmity = {}
	
	sets.me.enmity.normal = {
		head	=	"Souveran Schaller",
		neck	=	"Unmoving Collar +1",
		body	=	"Souveran Cuirass",
		hands	=	"Souveran Handschuhs",
		lring	=	"Supershear Ring",
		rring	=	"Eihwaz Ring",
		waist	=	"Creed Baudrier",
	}
	
	sets.me.enmity.sir = set_combine(sets.me.enmity.normal,{
			})
	------------------------------------------------------------------------------------------------------
    -- Weapon Skills sets just add them by name.
	------------------------------------------------------------------------------------------------------
    
	-- Sword
	
	sets.me['Savage Blade'] = {
		ammo	=	"Oshasha's Treatise",
		head	=	"Nyame Helm",
		neck	=	"Rep. Plat. Medal",
		lear	=	"Thrud Earring",
		rear	=	"Moonshade Earring",
		body	=	"Nyame Mail",
		hands	=	"Nyame Gauntlets",
		legs	=	"Nyame Flanchard",
		feet	=	"Nyame Sollerets",
		lring	=	"Sroda Ring",
		rring	=	"Cornelia's Ring",
		waist	=	"Sailfi Belt +1"
	}
	
	sets.me['Atonement'] = sets.me.enmity.normal
	
	sets.me['Chant du Cygne'] = {
		hands	=	"Flamma Manopolas +2",
		neck	=	"Fotia Gorget",
		waist	=	"Fotia Belt",
		lear	=	"Mache Earring",
		rear	=	"Lugra Earring +1",
	}
	
	sets.me['Requiescat'] = {
		neck	=	"Fotia Gorget",
		waist	=	"Fotia Belt"
	}
	
    -- Great Sword
	
	sets.me['Resolution'] = {}
	
	
	sets.me['Torcleaver'] = sets.me['Savage Blade']
	
	-- Polearm
	
	sets.me['Impulse Drive'] = set_combine(sets.me['Savage Blade'],{})
	
	-- Club
	
	sets.me['Judgment'] = sets.me['Savage Blade']
	

	
	
	-- Feel free to add new weapon skills, make sure you spell it the same as in game. 
	
	
    ---------------
    -- Casting Sets
    ---------------
    sets.precast = {}   		-- Leave this empty  
    sets.midcast = {}    		-- Leave this empty 
    sets.aftercast = {}  		-- Leave this empty  
    sets.midcast.enhancing = {} 	-- leave this empty
	sets.midcast.cure = {}
	sets.midcast.divine = {}
	sets.midcast.blue = {}		-- leave this empty
	sets.midcast.blue.enm = {} -- leave this empty
	
	----------
    -- Precast
    ----------
      
    -- Generic Casting Set that all others take off of. Here you should add all your fast cast RDM need 50 pre JP 42 at master
    sets.precast.casting = {}
	
	
	-- Enhancing Magic, eg. Siegal Sash, etc
    sets.precast.enhancing = set_combine(sets.precast.casting,{

    })
  
    -- Stoneskin casting time -, works off of enhancing -
    sets.precast.stoneskin = set_combine(sets.precast.enhancing,{

    })
	
	---------------------
    -- Ability Precasting
    ---------------------
	sets.precast['Provoke'] = sets.me.enmity.normal
	
	sets.precast['Shield Bash'] = set_combine(sets.me.enmity.normal,{hands=RELIC.Hands})
	sets.precast['Sentinel'] = set_combine(sets.me.enmity.normal,{feet=RELIC.Feet})
	sets.precast['Holy Circle'] = set_combine(sets.me.enmity.normal,{feet=AF.Feet})
	sets.precast['Divine Emblem'] = set_combine(sets.me.enmity.normal,{feet=EMPY.Feet})
	sets.precast['Rampart'] = set_combine(sets.me.enmity.normal,{head=RELIC.Head})
	
	sets.precast['Fealty'] = set_combine(sets.me.enmity.normal,{body=RELIC.Body})
	sets.precast['Chivalry'] = set_combine(sets.me.enmity.normal,{hands=RELIC.Hands})
	
	sets.precast['Invincible'] = set_combine(sets.me.enmity.normal,{legs=RELIC.Legs})
	
	sets.me.lunge = {}
		
	sets.me.lunge.normal = {}
	
	sets.me.lunge.mb = set_combine(sets.me.lunge.normal,{})
    
	----------
    -- Midcast
    ----------
	
	-- Whatever you want to equip mid-cast as a catch all for all spells, and we'll overwrite later for individual spells
    sets.midcast.casting = {}
	
	sets.midcast.enhancing.duration = {}
	
	sets.midcast.enhancing.potency = {}
	
	sets.midcast.phalanx = {
		main	=	"Deacon Sword",
		sub		=	"Priwen",
		hands	=	"Souveran Handschuhs",
	
	}
	
	sets.midcast.stoneskin = {}
	
	sets.midcast.refresh = {}
	
	-- Enlight
	sets.midcast.divine.potency = {
		main	=	"Brilliance",
		head	=	"Jumalik Helm",
		body	=	AF.Body,
		neck	=	"Incanter's Torque",
		hands	=	"Eschite Gauntlets"
	}
	
	-- Banish/Holy
	sets.midcast.divine.nuke = {}
	
	-- Cure
	sets.midcast.cure.normal = {}
	
	sets.midcast.cure.sir = {}
	
	
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
	sets.midcast.blue.enm.normal = set_combine(sets.me.enmity.normal,{})
	sets.midcast.blue.enm.sir = set_combine(sets.me.enmity.sir,{})
	
	------------
    -- Aftercast
    ------------
      
    -- I don't use aftercast sets, as we handle what to equip later depending on conditions using a function.
	
end

