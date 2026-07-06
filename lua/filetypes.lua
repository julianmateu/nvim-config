-- Extra filetype detection for extensions Neovim doesn't recognise.
-- ASP.NET Web Forms markup has no dedicated parser/syntax; html is the
-- standard mapping (inline <% %> server blocks render unhighlighted).
vim.filetype.add({
  extension = {
    aspx = "html",
    ascx = "html",
    ashx = "html",
    asax = "html",
    -- Neovim otherwise detects .master as "Focus master files", an
    -- unrelated legacy format.
    master = "html",
  },
})
