--code forked from dye
greenscreen = {}
--COLOUR DEFINITION MATRIX
local gslocal = {}
gslocal.colours = {
	{"white",      "White screen (#FFF)"},
	{"grey",       "Grey screen (#888)"},
	{"black",      "Black screen (#000)"},
	{"red",        "Red screen (#F00)"},
	{"orange",     "Orange screen (#F80)"},
	{"yellow",     "Yellow screen (#FF0)"},
	{"green",      "Green screen (#0F0)"},
	{"cyan",       "Cyan screen (#0FF)"},
	{"blue",       "Blue screen (#00F)"},
	{"purple",     "Purple screen (#F0F)"},
}
--Get ready to register nodes
for _, row in ipairs(gslocal.colours) do
	local name = row[1]
	local description = row[2]
	local item_name = "greenscreen:"..name.."screen"
	local item_texture = "greenscreen_"..name..".png"
	--BEGIN NODE REGISTRERING!
	minetest.register_node(item_name, {
		description = description,
		tiles = {item_texture},
		light_source = default.LIGHT_MAX,
		groups = {snappy=2,dig_immediate=3,oddly_breakable_by_hand=2},
		sounds = default.node_sound_glass_defaults(),
	})
end
