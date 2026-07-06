return {
  { -- Highlight, edit, and navigate code
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    cond = (function() return not vim.g.vscode end),
    lazy = false,
    build = ":TSUpdate",
    config = function()
      -- One-time migration: the old master branch compiled parsers into the
      -- plugin directory itself. They shadow the ones main installs to
      -- stdpath('data')/site and break highlighting (parser found but no
      -- highlights query -> regex syntax disabled, nothing painted).
      -- No-op once removed.
      -- TODO: delete this migration snippet once all machines have run it.
      local stale_parsers = vim.fn.stdpath("data") .. "/lazy/nvim-treesitter/parser"
      if vim.uv.fs_stat(stale_parsers) then
        vim.notify("nvim-treesitter: removing stale master-branch parsers", vim.log.levels.INFO)
        vim.fn.delete(stale_parsers, "rf")
      end

      require("nvim-treesitter").install({
        "bash",
        "c",
        "c_sharp",
        "cpp",
        "diff",
        "go",
        "html",
        "java",
        "javascript",
        "json",
        "lua",
        "luadoc",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "rust",
        "vim",
        "vimdoc",
      })

      -- The main branch of nvim-treesitter only installs parsers; unlike the
      -- old master branch it has no highlight module, so highlighting must be
      -- started per buffer. Only start when a highlights query exists:
      -- starting with a parser but no query (e.g. a stale parser from the
      -- master branch) disables regex syntax and paints nothing. Filetypes
      -- that fail the check keep regex syntax.
      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("treesitter-start", { clear = true }),
        callback = function(args)
          local lang = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)
          if lang and vim.treesitter.query.get(lang, "highlights") then
            pcall(vim.treesitter.start, args.buf, lang)
          end
        end,
      })
    end,
    -- There are additional nvim-treesitter modules that you can use to interact
    -- with nvim-treesitter. You should go explore a few and see what interests you:
    --
    --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
    --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
    --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  },
}
