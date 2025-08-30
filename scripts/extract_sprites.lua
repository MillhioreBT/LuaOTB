local spr = SPR()
spr:load("Tibia1098.spr", true, true)

for sprite in python.iter(spr) do
	sprite:save(string.format("%d.png", sprite.id))

	if sprite.id > 10 then
		-- Only extract the first 10 sprites for testing
		break
	end
end