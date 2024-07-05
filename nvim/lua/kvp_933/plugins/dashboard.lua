local setup, dashboard = pcall(require, "dashboard")
if not setup then
	return
end

local datetime = os.date(" %d-%m-%Y   %H:%M:%S")
local version = vim.version()
local nvim_version_info = "   v" .. version.major .. "." .. version.minor .. "." .. version.patch

dashboard.setup({
	theme = "hyper",
	shortcut_type = "number",
	config = {
		header = {
			"",
			"",
			"",
			" ███▄    █ ▓█████  ▒█████   ██▒   █▓ ██▓ ███▄ ▄███▓",
			" ██ ▀█   █ ▓█   ▀ ▒██▒  ██▒▓██░   █▒▓██▒▓██▒▀█▀ ██▒",
			"▓██  ▀█ ██▒▒███   ▒██░  ██▒ ▓██  █▒░▒██▒▓██    ▓██░",
			"▓██▒  ▐▌██▒▒▓█  ▄ ▒██   ██░  ▒██ █░░░██░▒██    ▒██ ",
			"▒██░   ▓██░░▒████▒░ ████▓▒░   ▒▀█░  ░██░▒██▒   ░██▒",
			"░ ▒░   ▒ ▒ ░░ ▒░ ░░ ▒░▒░▒░    ░ ▐░  ░▓  ░ ▒░   ░  ░",
			"░ ░░   ░ ▒░ ░ ░  ░  ░ ▒ ▒░    ░ ░░   ▒ ░░  ░      ░",
			"   ░   ░ ░    ░   ░ ░ ░ ▒       ░░   ▒ ░░      ░   ",
			"         ░    ░  ░    ░ ░        ░   ░         ░   ",
			"                                ░                  ",
			"",
			"",
			"",
		},
		shortcut = {
			{
				desc = "󰊳 update",
				group = "@property",
				action = "PackerSync",
				key = "u",
			},
			{
				icon = " ",
				icon_hl = "@variable",
				desc = "files",
				group = "Label",
				action = "Telescope find_files",
				key = "f",
			},
			{
				icon = "󰮗 ",
				icon_hl = "@variable",
				desc = "live_grep",
				group = "Label",
				action = "Telescope live_grep",
				key = "g",
			},
			{
				icon = " ",
				icon_hl = "@variable",
				desc = "quit",
				group = "Label",
				action = "qa",
				key = "q",
			},
		},
		project = { enable = false },
		mru = {
			enable = true,
			cwd_only = true,
		},
		footer = {
			"",
			"",
			"",
			"",
			datetime,
			nvim_version_info,
		},
	},
})

vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		vim.cmd("Dashboard")
	end,
})
