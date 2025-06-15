local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
	vim.notify("Could not load lazy")
	return
end

-- Setup lazy.nvim
lazy.setup({
	spec = {
		require("plugins.guess-indent"),
		require("plugins.gitsigns"),
		require("plugins.which-key"),
		require("plugins.treesitter"),
		require("plugins.telescope"),
		require("plugins.lazydev"),
		require("plugins.lspconfig"),
		require("plugins.conform"),
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	install = { colorscheme = { "habamax" } },
	-- automatically check for plugin updates
	checker = { enabled = true },
})
