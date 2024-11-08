
greenscreen = {}

-- Different colours (itemstring,description)
greenscreen.colours = {
	white	= "#FFF",
	grey	= "#888",
	black	= "#000",
	red		= "#F00",
	orange	= "#F80",
	yellow	= "#FF0",
	green	= "#0F0",
	cyan	= "#0FF",
	blue	= "#00F",
	purple 	= "#F0F",
}

-- If i3 is installed, compress all the greenscreen nodes into one cell.
if core.global_exists("i3") then
	greenscreen.compress_colours = {}
	for colour in pairs(greenscreen.colours) do
		if colour ~= "green" then
			table.insert(greenscreen.compress_colours, "greenscreen:"..colour.."screen")
		end
	end

	i3.compress("greenscreen:greenscreen", {
		replace = "greenscreen:greenscreen",
		by = greenscreen.compress_colours
	})
end

-- Get node sounds, either from MTG default or from AntumDeluge's sounds mod.
if core.global_exists("default") then
	greenscreen.sound = default.node_sound_defaults()
elseif core.global_exists("sounds") then
	greenscreen.sound = sounds.node()
else
	core.log("warning", "[greenscreen] No sound mod found (default or sounds), falling back to silent.")
	greenscreen.sound = nil
end

for name, colour in pairs(greenscreen.colours) do
	core.register_node("greenscreen:"..name.."screen", {
		description = name:sub(1,1):upper()..name:sub(2).." screen ("..colour..")",
		tiles = { "[combine:4x4^[noalpha^[colorize:"..colour..":255" },
		light_source = core.LIGHT_MAX,
		groups = { snappy=3, dig_immediate=3, oddly_breakable_by_hand=3 },
		sounds = greenscreen.sound,
	})
end
