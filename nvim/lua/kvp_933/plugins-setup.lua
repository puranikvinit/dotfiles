-- auto install packer if not installed
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
	return
end

packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ relative = "editor", height = 10, row = vim.o.lines - 15 })
		end,
	},
})

return packer.startup(function(use)
	-- packer
	use("wbthomason/packer.nvim")

	-- colorchemes
	use("bluz71/vim-nightfly-guicolors")
	use("xiyaowong/transparent.nvim")
	use("puranikvinit/tokyonight.nvim")

	-- used by telescope and tree plugins
	use("nvim-lua/plenary.nvim")

	-- maximizes and restores current window
	use("szw/vim-maximizer")

	-- essential plugins
	use("tpope/vim-surround")

	-- for easier commenting of code
	use("numToStr/Comment.nvim")

	-- file explorer
	use({ "nvim-tree/nvim-tree.lua", lazy = false })

	-- icons for nvim-tree
	use("nvim-tree/nvim-web-devicons")

	-- customizing the status line of nvim
	use("nvim-lualine/lualine.nvim")

	-- fuzzy finding with telescope
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) -- fuzzy finder

	-- autocompletion
	use("hrsh7th/nvim-cmp")
	-- autocompletion from buffer
	use("hrsh7th/cmp-buffer")
	--autocompletion from file paths
	use("hrsh7th/cmp-path")

	-- snippets
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")

	-- managing and installing LSP servers
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("neovim/nvim-lspconfig")
	-- autocompletion from LSP servers
	use("hrsh7th/cmp-nvim-lsp")
	use({ "glepnir/lspsaga.nvim", branch = "main" })
	-- add vs-code like pictograms for autocompletion floating panel
	use("onsails/lspkind.nvim")

	-- formatting and linting
	use("jose-elias-alvarez/null-ls.nvim")
	use("jayp0521/mason-null-ls.nvim")

	-- syntax highlighting, indentation and auto-tagging
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	})

	-- auto pairing
	use("windwp/nvim-autopairs")
	use("windwp/nvim-ts-autotag")

	-- git plugin
	use("tpope/vim-fugitive")

	-- for showing git diff signs
	use("lewis6991/gitsigns.nvim")

	-- github copilot for nvim
	use("github/copilot.vim")

	-- github copilot chat for nvim
	use({
		"CopilotC-Nvim/CopilotChat.nvim",
		branch = "canary",
		dependencies = {
			{ "github/copilot.vim" },
			{ "nvim-lua/plenary.nvim" },
		},
		opts = {
			debug = true,
		},
	})

	-- floating command line
	use({
		"folke/noice.nvim",
		requires = {
			{ "MunifTanjim/nui.nvim" },
			{ "rcarriga/nvim-notify" },
		},
	})

	-- for quick file switching
	use({
		"ThePrimeagen/harpoon",
		requires = {
			{ "nvim-lua/plenary.nvim" },
		},
	})

	-- for markdown preview
	use({
		"MeanderingProgrammer/markdown.nvim",
		as = "render-markdown",
		requires = {
			{ "nvim-treesitter" },
			{ "nvim-tree/nvim-web-devicons", opt = true },
		},
	})

	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		setup = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	})

	use("norcalli/nvim-colorizer.lua")

	use("nvimdev/dashboard-nvim")

	if packer_bootstrap then
		require("packer").sync()
	end
end)
