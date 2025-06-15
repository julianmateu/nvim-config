-- [[ Setting options ]]
-- See `:help vim.o` and `:help options`
--  For more options, you can see `:help option-list`

-- Editor UI
vim.o.number = true -- Show line numbers
vim.o.relativenumber = true -- Show relative numbners to the current line
vim.o.cursorline = true -- Show which line your cursor is on
vim.o.smartindent = true -- Autoindent new lines
vim.o.showmode = false -- Show the current mode

-- Indentation and tabs
-- See `:help tabstop`
vim.o.tabstop = 2 -- Insert 2 spaces for a tab
vim.o.softtabstop = 2 -- Insert 2 spaces for a tab when editing
vim.o.shiftwidth = 2 -- The number of spaces inserted for each indentation
vim.o.expandtab = true -- Convert tabs to spaces

-- Splits
vim.o.splitbelow = true -- Force all horizontal splits to go below current window
vim.o.splitright = true -- Force all vertical splits to go to the right of current window

-- Search and substitutions
vim.o.ignorecase = true -- Ignore case in search patterns unless \C is used
vim.o.smartcase = true -- Override ignore case if the search pattern contains uppercase
vim.o.inccommand = "split" -- Preview substitutions live, as you type!
vim.o.hlsearch = true -- Highlight all matches on previous search pattern

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
--
--  Notice listchars is set using `vim.opt` instead of `vim.o`.
--  It is very similar to `vim.o` but offers an interface for conveniently interacting with tables.
--   See `:help lua-options`
--   and `:help lua-options-guide`
vim.o.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- if performing an operation that would fail due to unsaved changes in the  uffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.o.confirm = true
