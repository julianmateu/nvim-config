local colorscheme = "material"
local style = "deep ocean"

vim.g.material_style = style
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end
