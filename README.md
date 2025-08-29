
# LuaOTB

A Lua-based program for reading and writing Tibia .otb, .dat, and .spr files. This tool provides a complete API for analyzing and modifying Tibia client and server files, making it easy to work with items, sprites, and game data.

## Installation

### Windows x64 (Recommended)

1. Download the latest release or clone this repository
2. Run the installer as administrator:
   ```cmd
   install.bat
   ```
3. Close all terminal windows and open a new one to use the `luaotb` command globally

### Manual Installation

1. Extract the files to your desired directory
2. Add the directory to your system PATH
3. Run `luaotb.exe` from any terminal

## Usage

### Basic Usage

```cmd
luaotb script.lua
```

Run your Lua script with full access to the OTB, DAT, and SPR APIs.

### Command Line Examples

```cmd
# Analyze an items.otb file
luaotb analyze_items.lua

# Convert sprites to images
luaotb extract_sprites.lua

# Modify item properties
luaotb modify_items.lua
```

## API Reference

LuaOTB provides three main classes for working with Tibia files:

### OTB Class - Server Items

The OTB class handles server-side item definitions:

```lua
-- Create and load an OTB file
local otb = OTB()
otb:load("items.otb")

-- Access item properties
print("OTB Version:", otb.major_version, otb.minor_version, otb.build_version)
print("Total items:", otb:get_item_types_count())

-- Get item by server ID
local item = otb:get_item_type_by_server_id(2148) -- gold coin
if item then
    print("Item name:", item.name)
    print("Client ID:", item.client_id)
end

-- Iterate through all items
for item_type in python.iter(otb) do
    print("Server ID:", item_type.server_id, "Name:", item_type.name)
end
```

### DAT Class - Client Objects

The DAT class manages client-side object definitions:

```lua
-- Load DAT file
local dat = DAT()
dat:load("Tibia.dat", ClientVersion.Format_1100)

print("Items count:", dat.items_count)
print("Client version:", dat.version)

-- Get client item
local client_item = dat:get_item_by_id(2148)
print("Sprites:", client_item.num_sprites)
print("Dimensions:", client_item.width, "x", client_item.height)
```

### SPR Class - Sprites

The SPR class handles sprite data:

```lua
-- Load sprite file
local spr = SPR()
spr:load("Tibia.spr", true, true) -- extended, transparent

-- Connect DAT with SPR for complete functionality
dat:connect_spr(spr)

-- Extract sprite as image
local sprite = spr:get_sprite(1000)
if sprite then
    sprite:save("sprite_1000.png")
end
```

### Complete Example

```lua
-- Load all three file types
local otb = OTB()
local dat = DAT()
local spr = SPR()

-- Load files
otb:load("items.otb")
dat:load("Tibia.dat", ClientVersion.Format_1100)
spr:load("Tibia.spr", true, true)

-- Connect DAT and SPR
dat:connect_spr(spr)

-- Find items with specific properties
for item_type in python.iter(otb) do
    if item_type.client_id and item_type.client_id > 0 then
        local client_item = dat:get_item_by_id(item_type.client_id)
        
        if client_item and client_item.num_sprites > 0 then
            print(string.format("Item: %s (Server: %d, Client: %d, Sprites: %d)", 
                item_type.name or "Unknown", 
                item_type.server_id, 
                item_type.client_id, 
                client_item.num_sprites))
        end
    end
end
```

### Available Enumerations

```lua
-- Client versions
ClientVersion.Format_1100  -- Latest supported
ClientVersion.Format_1092
-- ... more versions available

-- Item flags
ItemFlags.STACKABLE
ItemFlags.MOVEABLE
ItemFlags.USEABLE
-- ... more flags available

-- Thing categories
ThingCategory.Item
ThingCategory.Creature
ThingCategory.Effect
ThingCategory.Missile
```

## System Requirements

- Windows x64
- Compatible with [TFS master](https://github.com/otland/forgottenserver)

## Notes

If you need a more complete graphical program, consider using [LapisItemEditor](https://github.com/giuinktse7/LapisItemEditor).

