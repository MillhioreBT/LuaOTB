local otb = OTB()

otb:load("items.otb")

for item_type in python.iter(otb) do
	print(item_type)
	break
end

local spr = SPR()

spr:load("Tibia.spr", false, true)

for sprite in python.iter(spr) do
	sprite:save(string.format("%d.png", sprite.id))

	if sprite.id > 20 then
		break
	end
end

local dat = DAT()
dat:connect_spr(spr)
dat:load("Tibia.dat", ClientVersion.Format_860)
