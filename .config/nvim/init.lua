-- Plugins
vim.pack.add {
	{ src = "https://github.com/catppuccin/nvim", name = "catppuccin", },
	{ src = "https://github.com/romus204/tree-sitter-manager.nvim", },
	{ src = "https://github.com/neovim/nvim-lspconfig", },
}

-- Colours
require("tree-sitter-manager").setup()
vim.cmd.colorscheme "catppuccin"

-- Set hybrid line numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- Set tab as two spaces
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2

-- Language servers
vim.lsp.enable('clangd')

vim.lsp.config('texlab', {
  settings = {
    texlab = {
      build = {
        onSave = true,
      },
      chktex = {
        onOpenAndSave = true,
        onEdit = true,
      },
    },
  },
})
vim.lsp.enable('texlab')
