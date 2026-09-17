return {
	'joshdick/onedark.vim',
	lazy = false,
	priority = 1000,
	config = function()
    vim.g.onedark_italics = 1
		vim.cmd("colorscheme onedark")
	end,
}
