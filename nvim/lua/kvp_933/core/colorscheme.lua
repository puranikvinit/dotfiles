local status, _ = pcall(vim.cmd, "colorscheme nightfly") -- whichever colorscheme is required.
if not status then
	print("Colorscheme not found!")
	return
end
