local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then
	return
end

local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then
	return
end

local themes_setup, themes = pcall(require, "telescope.themes")
if not themes_setup then
	return
end

telescope.setup({
	defaults = themes.get_dropdown({
		selection_caret = " ❯ ",
		prompt_prefix = " ❯ ",
		winblend = 20,
		mappings = {
			i = {
				["<C-k>"] = actions.move_selection_previous, -- move to prev result
				["<C-j>"] = actions.move_selection_next, -- move to next result
				["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
			},
		},
	}),
})

-- also install 'rg' and 'fzf' packages to get the Live Grep working!

telescope.load_extension("fzf")
-- telescope.load_extension("harpoon")
