local status, _ = pcall(vim.cmd, "colorscheme tokyonight-night") -- whichever colorscheme is required.
if not status then
	print("Colorscheme not found!")
	return
end

local status_scheme, tokyonight = pcall(require, "tokyonight")
if not status_scheme then
	print("Tokyonight not found!")
	return
end
