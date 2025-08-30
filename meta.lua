---@meta

---@class OTB
---@field major_version integer Major version of the OTB file
---@field minor_version integer Minor version of the OTB file
---@field build_version integer Build version of the OTB file
---@field description string Description of the OTB file
---@field loaded boolean Indicates if the OTB file is loaded
---@field item_types ItemType[] List of item types
---@field item_type_by_server_id table<integer, ItemType> Map of item types by server ID
---@field item_type_by_client_id table<integer, ItemType> Map of item types by client ID
---@overload fun(): OTB
OTB = {}

---Loads an OTB file from disk
---@param file string Path of the OTB file to load (default "items.otb")
---@return boolean success True if loading was successful
function OTB:load(file) end

---Saves the OTB file to disk
---@param file string Path where to save the OTB file (default "items_out.otb")
---@return boolean success True if saving was successful
function OTB:save(file) end

---Adds a new item type to the OTB
---@param item_type ItemType The item type to add
function OTB:add_item_type(item_type) end

---Removes an item type from the OTB
---@param item_type ItemType The item type to remove
function OTB:remove_item_type(item_type) end

---Gets an item type by its server ID
---@param server_id integer Server ID
---@return ItemType|nil item_type The item type found or nil
function OTB:get_item_type_by_server_id(server_id) end

---Gets an item type by its client ID
---@param client_id integer Client ID
---@return ItemType|nil item_type The item type found or nil
function OTB:get_item_type_by_client_id(client_id) end

---Gets the total number of item types
---@return integer count Number of item types
function OTB:get_item_types_count() end

---Gets an item type by index
---@param index integer Index of the item type
---@return ItemType|nil item_type The item type at the specified index
function OTB:get_item_type_by_index(index) end

---Gets the last server ID
---@return integer last_id Last server ID
function OTB:get_last_server_id() end

---@class DAT
---@field signature integer DAT file signature
---@field revision integer DAT file revision
---@field items_count integer Number of items in the DAT
---@field outfits_count integer Number of outfits in the DAT
---@field effects_count integer Number of effects in the DAT
---@field missiles_count integer Number of missiles in the DAT
---@field items ThingList List of client items
---@field outfits ThingList List of client outfits
---@field effects ThingList List of client effects
---@field missiles ThingList List of client missiles
---@field loaded boolean Indicates if the DAT file is loaded
---@field version integer Client version
---@field spr SPR|nil Reference to the associated SPR file
---@field idle_animations boolean Indicates if it supports idle animations
---@field enhanced_animations boolean Indicates if it supports enhanced animations
---@field market_categories table[]|nil Market categories
---@overload fun(): DAT
DAT = {}

---Connects an SPR file with this DAT
---@param spr SPR The SPR file to connect
function DAT:connect_spr(spr) end

---Loads a DAT file from disk
---@param file string Path of the DAT file to load (default "tibia.dat")
---@param version ClientVersion Client version (default ClientVersion.Format_1100)
---@return boolean success True if loading was successful
function DAT:load(file, version) end

---Saves the DAT file to disk
---@param file string Path where to save the DAT file (default "tibia.dat")
---@return boolean success True if saving was successful
function DAT:save(file) end

---Gets the list of client items
---@return ThingList items List of client items
function DAT:get_client_items() end

---Gets the list of client outfits
---@return ThingList outfits List of client outfits
function DAT:get_client_outfits() end

---Gets the list of client effects
---@return ThingList effects List of client effects
function DAT:get_client_effects() end

---Gets the list of client missiles
---@return ThingList missiles List of client missiles
function DAT:get_client_missiles() end

---Gets an item by its client ID
---@param client_id integer Client ID
---@return ClientThing item The item found
function DAT:get_item_by_id(client_id) end

---Gets an outfit by its client ID
---@param client_id integer Client ID
---@return ClientThing outfit The outfit found
function DAT:get_outfit_by_id(client_id) end

---Gets an effect by its client ID
---@param client_id integer Client ID
---@return ClientThing effect The effect found
function DAT:get_effect_by_id(client_id) end

---Gets a missile by its client ID
---@param client_id integer Client ID
---@return ClientThing missile The missile found
function DAT:get_missile_by_id(client_id) end

---@class SPR
---@field signature integer SPR file signature
---@field extended boolean Indicates if it uses extended format
---@field transparent boolean Indicates if it supports transparency
---@field sprite_count integer Number of sprites in the file
---@field sprites Sprite[] List of sprites
---@field sprite_size integer Size of sprites (usually 32)
---@overload fun(): SPR
SPR = {}

---Loads an SPR file from disk
---@param file string Path of the SPR file to load (default "tibia.spr")
---@param extended boolean Indicates if to use extended format
---@param transparent boolean Indicates if to support transparency
---@return boolean success True if loading was successful
function SPR:load(file, extended, transparent) end

---Gets a sprite by its ID
---@param id integer Sprite ID
---@return Sprite? sprite The sprite found
function SPR:get_sprite(id) end

---@class ItemType
---@field group integer Item group
---@field flags integer Item flags
---@field server_id integer Server ID
---@field client_id integer Client ID
---@field name string|nil Item name
---@field description string|nil Item description
---@field speed integer|nil Item speed
---@field slot integer|nil Item slot
---@field container_size integer|nil Container size
---@field weight integer|nil Item weight
---@field weapon table|nil Weapon properties
---@field ammunition table|nil Ammunition properties
---@field armor table|nil Armor properties
---@field magic_level integer|nil Required magic level
---@field magic_field_type integer|nil Magic field type
---@field writable table|nil Writable properties
---@field rotate_to integer|nil ID to rotate to
---@field decay table|nil Decay properties
---@field sprite_hash integer|nil Sprite hash
---@field minimap_color integer|nil Minimap color
---@field max_text_length integer|nil Maximum text length
---@field max_text_length_once integer|nil Maximum text length once
---@field light table|nil Light properties
---@field top_order integer|nil Top order
---@field ware_id integer|nil Ware ID
---@field classification integer|nil Classification
---@field article string|nil Article
---@field category integer|nil Category
---@overload fun(): ItemType
ItemType = {}

---@class ClientThing
---@field id integer Client object ID
---@field category ThingCategory Object category
---@field width integer Object width
---@field height integer Object height
---@field real_size integer Real size
---@field layers integer Number of layers
---@field pattern_x integer Pattern X
---@field pattern_y integer Pattern Y
---@field pattern_z integer Pattern Z
---@field frames integer Number of frames
---@field num_sprites integer Number of sprites
---@field sprites integer[] List of sprite IDs
---@field attributes table Object attributes
---@field is_marketable fun(self:ClientThing): boolean Function to check if the object is marketable
---@field get_market_data fun(self:ClientThing): MarketData? Function to get the market data
---@overload fun(): ClientThing
ClientThing = {}

---Deserializes a ClientThing from a buffer
---@param spr SPR Associated SPR file
---@param buffer table Data buffer
---@param version integer Client version
---@param dat DAT Associated DAT file
function ClientThing:unserialize(spr, buffer, version, dat) end

---Serializes a ClientThing to a buffer
---@param buffer table Target buffer
---@param version integer Client version
---@param extended boolean Extended format
---@param enhanced_animations boolean Enhanced animations
function ClientThing:serialize(buffer, version, extended, enhanced_animations) end

---Checks if the object has a specific attribute
---@param attr ClientThingAttr Attribute to check
---@return boolean has_attr True if the object has the attribute
function ClientThing:has_attr(attr) end

---Gets the value of a specific attribute
---@param attr ClientThingAttr Attribute to get
---@return any value Value of the attribute or nil if not set
function ClientThing:get_attr(attr) end

---Sets the value of a specific attribute
---@param attr ClientThingAttr Attribute to set
---@param value any Value to set
function ClientThing:set_attr(attr, value) end

---Removes a specific attribute from the object
---@param attr ClientThingAttr Attribute to remove
function ClientThing:remove_attr(attr) end

---@class MarketData
---@field category integer Market category
---@field trade_as_object_id integer Trade object ID
---@field show_as_object_id integer Show object ID
---@field name string Market name
---@field restrict_profession integer Profession restriction
---@field required_level integer Required level
---@overload fun(): MarketData
MarketData = {}

---@class Sprite
---@field id integer Sprite ID
---@field transparent boolean Indicates if sprite supports transparency
---@field view_pos integer View position in buffer
---@field view_len integer View length in buffer
---@field base_color integer[] Base color array [255, 0, 255, 255]
---@field buffer table SPR buffer reference
---@overload fun(): Sprite
Sprite = {}

---Gets the pixels of the sprite as a 2D array
---@return table|nil pixels 2D array of pixels or nil if no data
function Sprite:get_pixels() end

---Saves the sprite as an image file
---@param file string Path where to save the image file [default "sprite.png"]
function Sprite:save(file) end

---Gets a raw sprite by ID from the buffer
---@param id integer Sprite ID
---@return Sprite sprite Raw sprite data
function Sprite.get_raw_sprite(id) end

---Gets multiple sprites from the buffer
---@param sprite_count integer Number of sprites to get
---@return Sprite[] sprites List of sprites
function Sprite.get_sprites(sprite_count) end

---Loads sprite data from a buffer
---@param buffer table Data buffer
function Sprite:load(buffer) end

---Gets a PIL image of the sprite
---@return table image PIL image of the sprite
function Sprite:get_image() end

---@class ThingList
---@field things ClientThing[] List of objects
ThingList = {}

---Resizes the object list
---@param size integer New size
function ThingList:resize(size) end

---Adds an object to the list
---@param thing ClientThing Object to add
function ThingList:append(thing) end

---Sets an object at a specific index
---@param index integer Index where to place the object
---@param thing ClientThing Object to set
function ThingList:set_thing(index, thing) end

---Enumeration of object categories
---@enum ThingCategory
ThingCategory = {
	Item = 0,
	Creature = 1,
	Effect = 2,
	Missile = 3,
	Invalid = 4,
	Last = 4
}

---Enumeration of client versions
---@enum ClientVersion
ClientVersion = {
	InvalidFormat = 0,
	Format_710 = 710,
	Format_740 = 740,
	Format_755 = 755,
	Format_780 = 780,
	Format_860 = 860,
	Format_960 = 960,
	Format_1000 = 1000,
	Format_1010 = 1010,
	Format_1050 = 1050,
	Format_1057 = 1057,
	Format_1092 = 1092,
	Format_1093 = 1093,
	Format_1100 = 1100
}

---Enumeration of frame group types
---@enum FrameGroupType
FrameGroupType = {
	Default = 0,
	Idle = 0,
	Moving = 1
}

--- Enumeration of item flags
---@enum ItemFlags
ItemFlags = {
	BLOCK_SOLID = 1 << 0,
	BLOCK_PROJECTILE = 1 << 1,
	BLOCK_PATHFIND = 1 << 2,
	HAS_HEIGHT = 1 << 3,
	USEABLE = 1 << 4,
	PICKUPABLE = 1 << 5,
	MOVEABLE = 1 << 6,
	STACKABLE = 1 << 7,
	FLOORCHANGEDOWN = 1 << 8,
	FLOORCHANGENORTH = 1 << 9,
	FLOORCHANGEEAST = 1 << 10,
	FLOORCHANGESOUTH = 1 << 11,
	FLOORCHANGEWEST = 1 << 12,
	ALWAYSONTOP = 1 << 13,
	READABLE = 1 << 14,
	ROTATABLE = 1 << 15,
	HANGABLE = 1 << 16,
	VERTICAL = 1 << 17,
	HORIZONTAL = 1 << 18,
	CANNOTDECAY = 1 << 19,
	ALLOWDISTREAD = 1 << 20,
	UNUSED = 1 << 21,
	CLIENTCHARGES = 1 << 22,
	LOOKTHROUGH = 1 << 23,
	ANIMATION = 1 << 24,
	FULLTILE = 1 << 25,
	FORCEUSE = 1 << 26
}

---Enumeration of client thing attributes
---@enum ClientThingAttr
ClientThingAttr = {
	ground = 0,
	ground_border = 1,
	on_bottom = 2,
	on_top = 3,
	container = 4,
	stackable = 5,
	force_use = 6,
	multi_use = 7,
	writable = 8,
	writable_once = 9,
	fluid_container = 10,
	splash = 11,
	not_walkable = 12,
	not_moveable = 13,
	block_projectile = 14,
	not_pathable = 15,
	pickupable = 16,
	hangable = 17,
	hook_south = 18,
	hook_east = 19,
	rotateable = 20,
	light = 21,
	dont_hide = 22,
	translucent = 23,
	displacement = 24,
	elevation = 25,
	lying_corpse = 26,
	animate_always = 27,
	minimap_color = 28,
	lens_help = 29,
	full_ground = 30,
	look = 31,
	cloth = 32,
	market = 33,
	usable = 34,
	wrapable = 35,
	unwrapable = 36,
	top_effect = 37,
	bones = 38,
	opacity = 100,
	not_pre_walkable = 101,
	floor_change = 252,
	no_movement_animation = 253,
	chargeable = 254,
	default = 255
}

---@class LupaObject:table
LupaObject = {}

---@class python
python = {}

---@overload fun(obj:OTB):fun():ItemType
---@overload fun(obj:SPR):fun():Sprite
---@overload fun(obj:ThingList):fun():ClientThing
function python.iter(obj) end
