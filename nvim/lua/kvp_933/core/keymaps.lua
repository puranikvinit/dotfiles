vim.g.mapleader = " "

local keymap = vim.keymap

-- Unbind arrow keys
keymap.set({ "n", "v", "x", "s", "i" }, "<Up>", "<Nop>")
keymap.set({ "n", "v", "x", "s", "i" }, "<Down>", "<Nop>")
keymap.set({ "n", "v", "x", "s", "i" }, "<Left>", "<Nop>")
keymap.set({ "n", "v", "x", "s", "i" }, "<Right>", "<Nop>")

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- move lines up and down
keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- move selection up
keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- move selection down

-- window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window
keymap.set("n", "<leader>so", "<C-w>o") -- close all split windows except current one
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization

keymap.set("n", "<C-h>", "<C-w>h") -- move to window on the left
keymap.set("n", "<C-l>", "<C-w>l") -- move to window on the right
keymap.set("n", "<C-j>", "<C-w>j") -- move to window on the bottom
keymap.set("n", "<C-k>", "<C-w>k") -- move to window on the top

-- tab management
keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab

-- Nvim-Tree
keymap.set("n", "<leader>fe", ":NvimTreeToggle<CR>")

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags

-- Fugitive
keymap.set("n", "<leader>gs", ":Git<CR>")
keymap.set("n", "<leader>gP", ":Git push<CR>")

keymap.set("n", "<leader>gh", "<cmd>diffget //2<CR>")
keymap.set("n", "<leader>gl", "<cmd>diffget //3<CR>")

-- Copilot Chat
keymap.set("n", "<leader>cco", ":CopilotChatOpen<CR>")
keymap.set("n", "<leader>ccc", ":CopilotChatClose<CR>")
keymap.set("n", "<leader>ccr", ":CopilotChatReset<CR>")

keymap.set("v", "<leader>cx", ":CopilotChatExplain<CR>")
keymap.set("v", "<leader>cr", ":CopilotChatReview<CR>")

-- Harpoon
keymap.set("n", "<leader>hx", require("harpoon.mark").add_file)
keymap.set("n", "<leader>hh", require("harpoon.ui").toggle_quick_menu)
keymap.set("n", "<leader>hn", require("harpoon.ui").nav_next)
keymap.set("n", "<leader>hp", require("harpoon.ui").nav_prev)

-- Markdown
keymap.set("n", "<leader>rm", ":RenderMarkdownToggle<CR>")
keymap.set("n", "<leader>mp", ":MarkdownPreview<CR>")
keymap.set("n", "<leader>ms", ":MarkdownPreviewStop<CR>")
