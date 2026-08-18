vim.pack.add {
	{ src = "https://github.com/catppuccin/nvim", name = "catppuccin", },
	{ src = "https://github.com/romus204/tree-sitter-manager.nvim", },
	{ src = "https://github.com/neovim/nvim-lspconfig", },
}

require("tree-sitter-manager").setup()
vim.lsp.enable('clangd')

vim.cmd.colorscheme "catppuccin"

vim.wo.number = true
vim.wo.relativenumber = true
