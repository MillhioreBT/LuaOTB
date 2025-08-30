local spr = SPR()
spr:load("Tibia1098.spr", true, true)


local dat = DAT()
dat.enhanced_animations = true
dat.idle_animations = true

dat:connect_spr(spr)

dat:load("Tibia1098.dat", ClientVersion.Format_1093)

---@type table<number, MarketData?>
local market_items = {}
local found_market_items = 0

for client_item in python.iter(dat:get_client_items()) do
	if client_item:is_marketable() then
		market_items[client_item.id] = client_item:get_market_data()
		found_market_items = found_market_items + 1
	end
end

print(string.format("Total market items: %d", found_market_items))

local otherSpr = SPR()
otherSpr:load("Tibia860.spr", false, true)

local otherDat = DAT()
otherDat.enhanced_animations = false
otherDat.idle_animations = false
otherDat:connect_spr(otherSpr)

otherDat:load("Tibia860.dat", ClientVersion.Format_860)

-- Update the market_data of all 860 items using 1098 items as reference
for client_item in python.iter(otherDat:get_client_items()) do
	local market_data = market_items[client_item.id]
	if market_data then
		client_item:set_attr(ClientThingAttr.market, market_data)
	end
end

otherDat:save("Tibia860_with_market.dat")
