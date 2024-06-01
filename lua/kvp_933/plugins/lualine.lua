local status, lualine = pcall(require, "lualine")
if not status then
	return
end

local lualine_nightfly = require("lualine.themes.nightfly")

local new_colors = {
	blue = "#65D1FF",
	green = "#3EFFDC",
	violet = "#FF61EF",
	yellow = "#FFDA7B",
	black = "#000000",
}

-- colors for the status bar in each mode
lualine_nightfly.normal.a.fg = new_colors.green

lualine_nightfly.insert.a.fg = new_colors.green

lualine_nightfly.visual.a.fg = new_colors.green

lualine_nightfly.command = {
	a = {
		gui = "bold",
		bg = new_colors.transparent,
		fg = new_colors.green,
	},
}

lualine.setup({
	options = {
		theme = lualine_nightfly,
	},
})
