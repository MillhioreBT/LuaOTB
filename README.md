# LuaOTB
This is a small items.otb program for read/write and is compatible with TFS master written in Python and packaged with pyinstaller to make it portable.

## Usage
Prepare your `main.lua` file for the task you need and then run `LuaOTB.exe`

<details>

<summary> Read and Write - Header </summary>

### How to open an OTB file?
```lua
local otb = OTB()
otb:load("items.otb")

print(otb.majorVersion)
print(otb.minorVersion)
print(otb.buildVersion)
print(otb.description)
```
*The console output should look something like this:*

![image](https://user-images.githubusercontent.com/28090948/216741932-bcd1bce6-aa63-4395-ba24-45b1c1a3af7f.png)

*You can also modify these variables to customize the file header:*
```lua
local otb = OTB()
otb:load("items.otb")

otb.minorVersion = 10
otb.majorVersion = 20
otb.buildVersion = 1
otb.description = "My Custom OTB"

otb:save("items_out.otb")
```

*How to see if the changes happened?*
```lua
local otb = OTB()
otb:load("items_out.otb")

print(otb.minorVersion)
print(otb.majorVersion)
print(otb.buildVersion)
print(otb.description)
```

![image](https://user-images.githubusercontent.com/28090948/216744700-35a324fa-2bff-461a-9392-598ad0f4a66d.png)

</details>

<details>

<summary> Read and Write - ItemTypes </summary>

### How to find an item to review or modify it?
```lua
local otb = OTB()
otb:load("items.otb")

local itemType = otb:getItemType(2160)
print(itemType)

-- modify the item
itemType.NAME = "My new name"
itemType.CLIENT_ID = 6666

otb:save("items_out.otb")
```
*The console output should look something like this:*

![image](https://user-images.githubusercontent.com/28090948/216742198-3f26486c-ec4b-4ca6-b716-03dd2eec52f4.png)

*You should also see a new items_out.otb file in the directory.*

![image](https://user-images.githubusercontent.com/28090948/216742286-db68b091-6513-499e-85f4-7333832cd7e7.png)

### How to know if the new file actually has the changes?
*You can open the new OTB and review it.*
```lua
local otb = OTB()
otb:load("items_out.otb")

local itemType = otb:getItemType(2160)
print(itemType)
```
*The console output should look something like this:*

![image](https://user-images.githubusercontent.com/28090948/216742391-30b74a43-11e0-4699-84f3-87122538876c.png)

### How to add new items or maybe remove them?
```lua
local otb = OTB()
otb:load("items_out.otb")

local itemType = ItemType()
itemType.GROUP = 1
itemType.FLAGS = 0
itemType.NAME = "My new item"
itemType.SERVER_ID = 6666
itemType.CLIENT_ID = 6666

otb:addItemType(itemType)
otb:save("items_out.otb")
```
*To remove them you can use the method `removeItemType`*
```lua
local otb = OTB()
otb:load("items_out.otb")

otb:removeItemType(2160)
otb:save("items_out.otb")
```

### How to know the count of items?
```lua
local otb = OTB()
otb:load("items_out.otb")

print(otb:getItemTypesCount())
```

![image](https://user-images.githubusercontent.com/28090948/216743869-ccd6d03d-565f-4336-ae77-0b8a4d6ea4dd.png)

### How to iterate over all items?
```lua
local otb = OTB()
otb:load("items_out.otb")

local items = {}
for itemType in python.iter(otb.itemTypes) do
	if itemType.GROUP == 1 then
		items[#items + 1] = itemType
	end
end

print(string.format("Found %d items", #items))
```
![image](https://user-images.githubusercontent.com/28090948/216743957-88fc4e6c-6edd-43a3-afa6-35074bf376e2.png)

</details>

<details>

<summary> ItemType - Variables </summary>

### These are all the internal variables of ItemType
*It is worth mentioning that you cannot add new attributes, only modify existing ones!*

```lua
GROUP - number
FLAGS - number
SERVER_ID - number
CLIENT_ID - number
NAME - string
DESCRIPTION - string
SPEED - number
SLOT - number
CONTAINER_SIZE - number
WEIGHT - number
WEAPON - number
AMMUNITION - number
ARMOR - number
MAGIC_LEVEL - number
MAGIC_FIELD_TYPE - number
WRITABLE - number
ROTATE_TO - number
DECAY - number
SPRITE_HASH - table
MINIMAP_COLOR - number
MAX_TEXT_LENGTH - number
MAX_TEXT_LENGTH_ONCE - number
LIGHT - number
DECAY2 - number
WEAPON2 - number
AMMUNITION2 - number
ARMOR2 - number
WRITABLE2 - number
LIGHT2 - table
TOP_ORDER - number
WRITABLE3 - number
WARE_ID - number
CLASSIFICATION - number
ARTICLE - string
CATEGORY - number
```

</details>

## Notes
If you are interested in a more complete program you can choose to use [LapisItemEditor](https://github.com/giuinktse7/LapisItemEditor)
