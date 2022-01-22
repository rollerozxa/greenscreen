
local colours = {
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

for name, description in pairs(colours) do
	minetest.register_node("greenscreen:"..name.."screen", {
		description = description,
		tiles = { "greenscreen_"..name..".png" },
		light_source = minetest.LIGHT_MAX,
		groups = { snappy=2, dig_immediate=3, oddly_breakable_by_hand=2 },
		sounds = default.node_sound_glass_defaults(),
	})
end
