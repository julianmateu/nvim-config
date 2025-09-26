return {
  {
    "nvim-lualine/lualine.nvim",
    cond = (function() return not vim.g.vscode end),
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      lualine_style = "auto",
    },
  },
}
