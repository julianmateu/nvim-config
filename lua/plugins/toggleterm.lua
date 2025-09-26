return {
  {
    "akinsho/toggleterm.nvim",
    cond = (function() return not vim.g.vscode end),
    version = "*",
    opts = {
      open_mapping = [[<c-\>]],
    },
  },
}
