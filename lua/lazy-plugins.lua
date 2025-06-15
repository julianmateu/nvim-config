local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
	vim.notify("Could not load lazy")
	return
end

-- Setup lazy.nvim
-- see `:help lazy.nvim.txt`
lazy.setup({
	-- import plugins from the plugins directory.
	spec = {
		{ import = "plugins" },
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	install = { colorscheme = { "habamax" } },
	-- automatically check for plugin updates
	checker = { enabled = true },
})
