local status, _ = pcall(vim.cmd, "colorscheme tokyonight-night") -- whichever colorscheme is required.
if not status then
	print("Colorscheme not found!")
	return
end
