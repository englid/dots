-- helper functions
function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function nmap(shortcut, command)
  map('n', shortcut, command)
end

function imap(shortcut, command)
  map('i', shortcut, command)
end



-- comma map
vim.g.mapleader = ','
 

-- Fast saving
nmap('<leader>w', ':w!<cr>')


-- => Moving around, tabs and buffers

nmap('<Leader>v', ':vsp<CR>')

nmap('<C-h>', '<C-W>h') -- Smart way to move btw. windows
nmap('<C-l>', '<C-W>l')

nmap('<leader>bd', ':Bclose<cr>') -- Close the current buffer

nmap('<leader>ba', ':1,300 bd!<cr>') -- Close all the buffers

nmap('<C-j>', ':bp<cr>') -- Moving through buffers
nmap('<C-k>', ':bn<cr>')

nmap('<leader>cd', ':cd %:p:h<cr>') -- switch to the directory of the open buffer


-- for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
nmap('<leader>n', ':NvimTreeToggle<cr>')
