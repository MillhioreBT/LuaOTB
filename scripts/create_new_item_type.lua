local otb = OTB()
otb:load("items.otb")

-- I want to clone a gold coin but this one will be special since it doesn't serve as money, but is decorative.
local gold_coin = otb:get_item_type_by_server_id(2148)
if gold_coin then
	local decorative_gold_coin = gold_coin:clone()
	decorative_gold_coin.server_id = otb:get_last_server_id() + 1
	decorative_gold_coin.name = "Decorative Gold Coin"
	decorative_gold_coin.description = "A shiny decorative gold coin. It has no monetary value."
	otb:add_item_type(decorative_gold_coin)
end

-- You can also create a completely new item.
local new_item_type = ItemType()
new_item_type.server_id = otb:get_last_server_id() + 1
new_item_type.name = "Mystic Amulet"
new_item_type.description = "An amulet imbued with mystical energies."
new_item_type.client_id = 3050  -- Assuming 3050 is an unused client ID
new_item_type.ware_id = new_item_type.client_id
new_item_type:add_flags(ItemFlags.MOVEABLE | ItemFlags.PICKUPABLE)
otb:add_item_type(new_item_type)

otb:save("items_with_decorative_gold_coin.otb")
