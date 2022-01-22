
greenscreen = {}

-- Different colours (itemstring,description)
greenscreen.colours = {
	white	= "White screen (#FFF)",
	grey	= "Grey screen (#888)",
	black	= "Black screen (#000)",
	red		= "Red screen (#F00)",
	orange	= "Orange screen (#F80)",
	yellow	= "Yellow screen (#FF0)",
	green	= "Green screen (#0F0)",
	cyan	= "Cyan screen (#0FF)",
	blue	= "Blue screen (#00F)",
	purple 	= "Purple screen (#F0F)",
}

-- If i3 is installed, compress all the greenscreen nodes into one cell.
if minetest.global_exists("i3") then
	greenscreen.compress_colours = {}
	for colour in pairs(greenscreen.colours) do
		if colour ~= "green" then
			table.insert(greenscreen.compress_colours, "greenscreen:"..colour.."screen")
		end
	end

	minetest.log(dump(greenscreen.compress_colours))

	i3.compress("greenscreen:greenscreen", {
		replace = "greenscreen:greenscreen",
		by = greenscreen.compress_colours
	})
end

-- Get node sounds, either from MTG default or from AntumDeluge's sounds mod.
if minetest.global_exists("default") then
	greenscreen.sound = default.node_sound_defaults()
elseif minetest.global_exists("sounds") then
	greenscreen.sound = sounds.node()
else
	minetest.log("warning", "[greenscreen] No sound mod found (default or sounds), falling back to silent.")
	greenscreen.sound = nil
end

for name, description in pairs(greenscreen.colours) do
	minetest.register_node("greenscreen:"..name.."screen", {
		description = description,
		tiles = { "greenscreen_"..name..".png" },
		light_source = minetest.LIGHT_MAX,
		groups = { snappy=2, dig_immediate=3, oddly_breakable_by_hand=2 },
		sounds = greenscreen.sound,
	})
end
