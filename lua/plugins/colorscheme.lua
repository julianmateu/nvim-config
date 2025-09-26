return {
  {
    "catppuccin/nvim",
    cond = (function() return not vim.g.vscode end),
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        background = {
          light = "latte",
          dark = "mocha",
        },
      })
      vim.cmd.colorscheme("catppuccin")
      vim.o.background = "light"
    end,
  },
}
