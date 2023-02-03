local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.config/nvim/plugged')

Plug('folke/tokyonight.nvim') -- Theme
Plug('glepnir/dashboard-nvim') -- Dashboard

Plug('nvim-tree/nvim-web-devicons')
Plug('romgrk/barbar.nvim')
Plug('nvim-tree/nvim-tree.lua')
Plug('nvim-treesitter/nvim-treesitter', {['do'] = vim.fn[':TSUpdate']})
Plug('folke/which-key.nvim') -- leader key hints
Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim', {tag = '0.1.1'})
Plug('nvim-lualine/lualine.nvim') -- statusline
Plug('lewis6991/gitsigns.nvim') -- gitblame
Plug('chentoast/marks.nvim') -- better marks
Plug('lukas-reineke/indent-blankline.nvim') -- indent lines
Plug('gorbit99/codewindow.nvim') -- minimap

Plug('williamboman/mason.nvim') -- lsp plugin manager
Plug('neovim/nvim-lspconfig')
Plug('mfussenegger/nvim-dap')
Plug('jose-elias-alvarez/null-ls.nvim')
Plug('hrsh7th/nvim-cmp') -- TODO: setup

Plug('klen/nvim-test') -- test runner

Plug('github/copilot.vim')

vim.call('plug#end')


-- WATCH LIST: distant - remote file manager
