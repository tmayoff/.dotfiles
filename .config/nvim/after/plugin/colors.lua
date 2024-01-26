function ColorMyPencils(color)
	color = color or 'gruvbox'
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", ***REMOVED*** bg = "none" ***REMOVED***)
	vim.api.nvim_set_hl(0, "NormalFloat", ***REMOVED*** bg = "none" ***REMOVED***)
end

ColorMyPencils()
