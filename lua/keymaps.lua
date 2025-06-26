-- [[ Basic Keymaps ]]
-- : help vim.keymap.set()
-- Clear highlights on search when pressing <Esc> in normal mode

local opts = { noremap = true, silent = true } -- options to pass to the remap commmands

local function add_to_opts(new_opts)
	local result = {}

	for k, v in pairs(opts) do
		result[k] = v
	end

	for k, v in pairs(new_opts) do
		result[k] = v
	end

	return result
end

--[[
Modes:
  normal_node = "n"
  insert_mode = "i"
  visual_mode = "v"
  visual_block_mode = "x"
  term_mode = "t"
  command_mode = "c"
]]

-- [[ Normal Mode ]]
--  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", opts)

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, add_to_opts({ desc = "Open diagnostic [Q]uickfix list" }))

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
-- vim.keymap.set("n", "<C-h>", "<C-w>h", add_to_opts({ desc = "Move focus to the left window" }))
-- vim.keymap.set("n", "<C-l>", "<C-w>l", add_to_opts({ desc = "Move focus to the right window" }))
-- vim.keymap.set("n", "<C-j>", "<C-w>j", add_to_opts({ desc = "Move focus to the lower window" }))
-- vim.keymap.set("n", "<C-k>", "<C-w>k", add_to_opts({ desc = "Move focus to the upper window" }))

-- Quickfix list
vim.keymap.set("n", "<C-j>", ":cnext<CR>", add_to_opts({ desc = "Move to the next item in the quickfix list" }))
vim.keymap.set("n", "<C-k>", ":cprevious<CR>", add_to_opts({ desc = "Move to the previous item in the quickfix list" }))

-- Explorer
-- vim.keymap.set("n", "<leader>e", ":Lexplore 20<CR>", add_to_opts({ desc = "Open explorer window to the left" }))

-- Resize with arrows
vim.keymap.set("n", "<A-Up>", ":resize -2<CR>", add_to_opts({ desc = "Decrease vertical size" }))
vim.keymap.set("n", "<A-Down>", ":resize +2<CR>", add_to_opts({ desc = "Increase vertical size" }))
vim.keymap.set("n", "<A-Left>", ":vertical resize +2<CR>", add_to_opts({ desc = "Increase horizontal size" }))
vim.keymap.set("n", "<A-Right>", ":vertical resize -2<CR>", add_to_opts({ desc = "Decrease horizontal size" }))

-- Navigate buffers
vim.keymap.set("n", "<S-l>", ":bnext<CR>", add_to_opts({ desc = "Move to next buffer" }))
vim.keymap.set("n", "<S-h>", ":bprevious<CR>", add_to_opts({ desc = "Move to previous buffer" }))

-- Move text up and down
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", add_to_opts({ desc = "Move current line up a line" }))
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", add_to_opts({ desc = "Move current line down a line" }))
-- In MacOS the alt key is used to inpuut special symbols
vim.keymap.set("n", "˚", ":m .-2<CR>==", add_to_opts({ desc = "Move current line up a line" }))
vim.keymap.set("n", "∆", ":m .+1<CR>==", add_to_opts({ desc = "Move current line down a line" }))

-- [[ Insert Mode ]]

-- Move text up and down
vim.keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==gi", add_to_opts({ desc = "Move current line up a line" }))
vim.keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi", add_to_opts({ desc = "Move current line down a line" }))
-- In MacOS the alt key is used to inpuut special symbols
vim.keymap.set("i", "˚", "<Esc>:m .-2<CR>==gi", add_to_opts({ desc = "Move current line up a line" }))
vim.keymap.set("i", "∆", "<Esc>:m .+1<CR>==gi", add_to_opts({ desc = "Move current line down a line" }))

-- [[ Visual Mode ]]
-- Stay in indent mode
vim.keymap.set("v", ">", ">gv", add_to_opts({ desc = "Indent selection" }))
vim.keymap.set("v", "<", "<gv", add_to_opts({ desc = "Unindent selection" }))

-- Move text up and down
vim.keymap.set("v", "<A-k>", ":m '>-2<CR>gv=gv", add_to_opts({ desc = "Move selection up a line" }))
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", add_to_opts({ desc = "Move selection up a line" }))
-- In MacOS the alt key is used to inpuut special symbols
vim.keymap.set("v", "˚", ":m '>-2<CR>gv=gv", add_to_opts({ desc = "Move selection up a line" }))
vim.keymap.set("v", "∆", ":m '>+1<CR>gv=gv", add_to_opts({ desc = "Move selection up a line" }))

-- Do not yank the text that was pasted over
vim.keymap.set("v", "p", "_dP", add_to_opts({ desc = "Do not yank the text that was pasted over" }))

-- [[ Visual Block Mode ]]
-- Move text up and down
vim.keymap.set("x", "<A-k>", ":m '>-2<CR>gv=gv", add_to_opts({ desc = "Move selection up a line" }))
vim.keymap.set("x", "<A-j>", ":m '>+1<CR>gv=gv", add_to_opts({ desc = "Move selection up a line" }))
-- In MacOS the alt key is used to inpuut special symbols
vim.keymap.set("x", "˚", ":m '>-2<CR>gv=gv", add_to_opts({ desc = "Move selection up a line" }))
vim.keymap.set("x", "∆", ":m '>+1<CR>gv=gv", add_to_opts({ desc = "Move selection up a line" }))

-- [[ Terminal Mode ]]
-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", add_to_opts({ desc = "Exit terminal mode" }))

-- Better terminal navigation
-- vim.keymap.set("t", "<C-h>", "<C-\\><C-n><C-w><C-h>", { desc = "Move focus to the left window" })
-- vim.keymap.set("t", "<C-l>", "<C-\\><C-n><C-w><C-l>", { desc = "Move focus to the right window" })
-- vim.keymap.set("t", "<C-j>", "<C-\\><C-n><C-w><C-j>", { desc = "Move focus to the lower window" })
-- vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-w><C-k>", { desc = "Move focus to the upper window" })

vim.keymap.set("t", "<C-w>", "<C-\\><C-n><C-w>", { desc = "Exit terminal before running <C-w>" })
