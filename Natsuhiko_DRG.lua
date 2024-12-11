include('organizer-lib') -- optional
res = require('resources')
texts = require('texts')
include('Modes.lua')

-- Define your modes: 
-- You can add or remove modes in the table below, they will get picked up in the cycle automatically. 
-- to define sets for idle if you add more modes, name them: sets.me.idle.mymode and add 'mymode' in the group.
-- Same idea for nuke modes. 
idleModes = M('normal', 'dt','refresh')
meleeModes = M('normal', 'acc','hybrid')
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

mainWeapon = M('Shining One','Naegling')
subWeapon = M('Utu Grip', 'Regis')

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
	send_command('unbind ^c')
	send_command('unbind ^s')
    send_command('unbind ^end')  	
end

include('DRG_Lib.lua')

-- Optional. Swap to your sch macro sheet / book
set_macros(1,1) -- Sheet, Book
send_command('wait 6;input /lockstyleset 2')

refreshType = idleModes[1] -- leave this as is     

function get_sets()
    
    -- JSE
    AF = {}         -- leave this empty
    RELIC = {}      -- leave this empty
    EMPY = {}       -- leave this empty


	-- Fill this with your own JSE. 
    --Vishap
    AF.Head		=	"Vishap Armet +1"
    AF.Body		=	"Vishap Mail +1"
    AF.Hands	=	"Vishap F. G. +1"
    AF.Legs		=	"Vishap Brais +1"
    AF.Feet		=	"Vishap Greaves +1"

    --Pteroslayer
    RELIC.Head		=	"Ptero. Armet +2"
    RELIC.Body		=	"Ptero. Mail +2"
    RELIC.Hands 	=	"Ptero. Fin. G. +2"
    RELIC.Legs		=	"Ptero. Brais +2"
    RELIC.Feet		=	"Ptero. Greaves +2"

    --Peltast's
    EMPY.Head		=	"Peltast's Mezail +2"
    EMPY.Body		=	"Pelt. Plackart +2"
    EMPY.Hands		=	"Pel. Vambraces +2"
    EMPY.Legs		=	"Pelt. Cuissots +2"
    EMPY.Feet		=	"Pelt. Schynbalds +2"

	-- Capes:
    -- Brigantia's and such, add your own.
	DRGCape = {}
		DRGCape.TPDA = { name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10','Damage taken-5%',}}
		DRGCape.STRWSD = { name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}
	
	-- SETS
    sets.me = {}        		-- leave this empty
    sets.buff = {} 			-- leave this empty
    sets.me.idle = {}			-- leave this empty
    sets.me.melee = {}          	-- leave this empty
    sets.weapons = {}			-- leave this empty
		 -- Optional 
    --include('AugGear.lua') -- I list all my Augmented gears in a sidecar file since it's shared across many jobs. 

	sets.me.idle.normal = {
		ammo	=	"Staunch Tathlum +1",
		head	=	"Flamma Zucchetto +2",
		neck	=	"Loricate Torque +1",
		lear	=	"Sroda Earring",
		rear	=	"Sherida Earring",
		body	=	"Sacro Breastplate",
		hands	=	"Gleti's Gauntlets",
		lring	=	"Shneddick Ring",
		rring	=	"Niqmaddu Ring",
		back	=	DRGCape.TPDA,
		waist	=	"Ioskeha Belt",
		legs	=	RELIC.Legs,
		feet	=	"Gleti's Boots"}
	
	sets.me.idle.refresh = {}
	
	sets.me.idle.dt = {}
		
	sets.me.resting = {}
	
	sets.me.melee.normal2hn = {
		ammo	=	"Coiste Bodhar",
		head	=	"Flamma Zucchetto +2",
		neck	=	"Vim Torque +1",
		lear	=	"Sroda Earring",
		rear	=	"Sherida Earring",
		body	=	EMPY.Body,
		hands	=	EMPY.Hands,
		lring	=	"Moonbeam Ring",
		rring	=	"Niqmaddu Ring",
		back	=	DRGCape.TPDA,
		waist	=	"Ioskeha Belt",
		legs	=	RELIC.Legs,
		feet	=	"Flamma Gambieras +2"
	}
	
	sets.me.melee.hybrid2hn = set_combine(sets.me.melee.normal2hn,{
		head 	=	"Hjarrandi Helm",
		neck	=	"Elite Royal Collar",
		body	=	"Hjarrandi Breast.",
			})
	
	sets.me.melee.acc2hn = {}
	
	sets.me.melee.normalsw = {
		ammo	=	"Coiste Bodhar",
		head	=	"Flamma Zucchetto +2",
		neck	=	"Vim Torque +1",
		lear	=	"Sroda Earring",
		rear	=	"Sherida Earring",
		body	=	EMPY.Body,
		hands	=	EMPY.Hands,
		lring	=	"Moonbeam Ring",
		rring	=	"Niqmaddu Ring",
		back	=	DRGCape.TPDA,
		waist	=	"Ioskeha Belt",
		legs	=	RELIC.Legs,
		feet	=	"Flamma Gambieras +2"
	}
	
	sets.me.melee.hybridsw = set_combine(sets.me.melee.normalsw,{
		head 	=	"Hjarrandi Helm",
		neck	=	"Elite Royal Collar",
		body	=	"Hjarrandi Breast.",
			})
	
	sets.me.melee.accsw = {}
	
	sets.me.death = {}
	
	sets.me.enmity = {}
	
	sets.me.enmity.normal = {}
	
	sets.me.enmity.sir = set_combine(sets.me.enmity.normal,{
			})
	
	------------------------------------------------------------------------------------------------------
    -- Weapon Skills sets just add them by name.
	------------------------------------------------------------------------------------------------------
    
	-- Polearm
	
	sets.me['Stardiver'] = {
		ammo = "Knobkierrie",
		head = EMPY.Head,
		neck = "Fotia Gorget",
		lear = "Moonshade Earring",
		rear = "Sherida Earring",
		waist = "Fotia Belt",
		lring = "Ephramad's Ring",
		rring = "Niqmaddu Ring",
		back = DRGCape.STRWSD}
	
	sets.me['Camlann\'s Torment'] = {
		ammo = "Knobkierrie",
		head = EMPY.Head,
		lear = "Thrud Earring",
		lring = "Ephramad's Ring",
		rring = "Niqmaddu Ring",
		back = DRGCape.STRWSD}
	
	sets.me['Drakesbane'] = {
		ammo = "Knobkierrie",
		head = EMPY.Head,
		body = "Hjarrandi Breast.",
		lear = "Thrud Earring",
		legs = EMPY.Legs,
		lring = "Begrudging Ring",
		rring = "Niqmaddu Ring",
		back = DRGCape.STRWSD}
	
	sets.me['Impulse Drive'] = {
		ammo = "Knobkierrie",
		head = EMPY.Head,
		lear = "Moonshade Earring",
		rear = "Thrud Earring",
		lring = "Ephramad's Ring",
		rring = "Niqmaddu Ring",
		back = DRGCape.STRWSD}
	
	sets.me['Sonic Thrust'] = {
		ammo = "Knobkierrie",
		head = EMPY.Head,
		legs = AF.Legs,
		lear = "Moonshade Earring",
		rear = "Thrud Earring",
		lring = "Ephramad's Ring",
		rring = "Niqmaddu Ring",
		back = DRGCape.STRWSD}
	
	-- Sword
	
	sets.me['Savage Blade'] = set_combine(sets.me['Sonic Thrust'],{})
	
	-- Club
	
	sets.me['Judgment'] = set_combine(sets.me['Sonic Thrust'],{})
	
	
	-- Staff
	
	sets.me['Full Swing'] = {}
	
	sets.me['Retribution'] = {}
	
	sets.me['Shattersoul'] = {}
	
	sets.me['Cataclysm'] = {}
	
	
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
	
	sets.precast['Call Wyvern'] = {body=RELIC.Body}
	
	sets.precast['Ancient Circle'] = {legs=AF.Legs}
	
	sets.precast['Spirit Link'] = {
		head = AF.Head,
		hands = EMPY.Hands,
		feet = RELIC.Feet,
		lear = "Pratik Earring"}
	
	sets.precast['Steady Wing'] = {
		neck = "Chanoix's Gorget",
		hands = "Despair Gauntlets",
		legs = AF.Legs,
		feet = RELIC.Feet,
		back = "Updraft Mantle"
	}
	
	sets.precast['Jump'] = {
		ammo	=	"Ginsen",
		head	=	"Flamma Zucchetto +2",
		neck	=	"Vim Torque +1",
		lear	=	"Sroda Earring",
		rear	=	"Brutal",
		body	=	RELIC.Body,
		hands	=	AF.Hands,
		lring	=	"Flamma Ring",
		rring	=	"Rajas Ring",
		back	=	DRGCape.TPDA,
		waist	=	"Ioskeha Belt",
		legs	=	RELIC.Legs,
		feet	=	"Ostro Greaves"}
	
	sets.precast['High Jump'] = sets.precast['Jump']
	
	sets.precast['Spirit Jump'] = set_combine(sets.precast['Jump'],{
		feet = EMPY.Feet})
	
	sets.precast['Soul Jump'] = set_combine(sets.precast['Jump'],{})
	
	sets.precast['Angon'] = {
		ammo = "Angon"}
	
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
	
	}
	
	sets.midcast.stoneskin = {}
	
	sets.midcast.refresh = {}
	
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
