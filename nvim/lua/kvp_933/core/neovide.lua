if vim.g.neovide then
	vim.o.guifont = "JetBrainsMono Nerd Font Regular:h15"

	vim.g.neovide_cursor_vfx_enable = true
	vim.g.neovide_cursor_vfx_inertia = 0.1
	vim.g.neovide_cursor_vfx_smoothing = 0.1
	vim.g.neovide_cursor_vfx_frame_duration = 16

	vim.opt.linespace = 1.0

	-- Helper function for transparency formatting
	local alpha = function()
		return string.format("%x", math.floor(255 * (vim.g.transparency or 0.8)))
	end
	vim.g.neovide_transparency = 0.5
	vim.g.transparency = 0.5
	vim.g.neovide_background_color = "#2e214f" .. alpha()
	vim.g.neovide_window_blurred = true

	vim.g.neovide_floating_blur_amount_x = 0.5
	vim.g.neovide_floating_blur_amount_y = 0.5

	vim.g.neovide_hide_mouse_when_typing = true
	vim.g.neovide_refresh_rate_idle = 60

	vim.keymap.set("n", "<D-s>", ":w<CR>") -- Save
	vim.keymap.set("v", "<D-c>", '"+y') -- Copy
	vim.keymap.set("n", "<D-v>", '"+P') -- Paste normal mode
	vim.keymap.set("v", "<D-v>", '"+P') -- Paste visual mode
	vim.keymap.set("c", "<D-v>", "<C-R>+") -- Paste command mode
	vim.keymap.set("i", "<D-v>", '<ESC>l"+Pli') -- Paste insert mode
end
