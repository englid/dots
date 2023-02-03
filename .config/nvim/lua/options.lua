vim.opt.so = 2 -- always keep at least 2 lines of context when scrolling
vim.opt.wildmenu = true -- turn on Wild menu
vim.opt.ruler = true -- always show current position
vim.opt.cmdheight = 1 -- the commandbar height
vim.opt.hid = true -- hide abandon buffers in order to not lose undo history.
vim.opt.backspace = 'eol,start,indent' -- set backspace config
vim.opt.ignorecase = true -- ignore case when searching
vim.opt.smartcase = true -- unless my search term has caps, then turn on case sensitivity
vim.opt.hlsearch = true -- highlight search term
vim.opt.incsearch = true -- start searching while typing
vim.opt.lazyredraw = false -- don't redraw while executing macros
vim.opt.magic = true -- set magic on, for regular expressions
vim.opt.showmatch = true -- show matching brackets when cursor is over them
vim.opt.mat = 2 -- How many tenths of a second to blink
vim.opt.number = true -- show line numbers

-- flash on error
vim.opt.visualbell = true

-- how long to wait between keystrokes before trying to map it to a command
-- if i have ,d and ,dv then after i type ,d vim will wait timeoutlen before executing ,d
-- I type shortcuC
vim.opt.timeoutlen = 200

-- Sets how many lines of history VIM has to remember
vim.opt.history = 700

-- Text, tab, indent
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.smarttab = true
vim.opt.smartindent = true
vim.opt.splitright = true -- vsplit to the right by default

vim.opt.lbr = true
vim.opt.tw = 500 -- text width

vim.opt.cindent = true -- c indent
vim.opt.si = true --Smart indet
vim.opt.wrap = true --Wrap lines

-- Files backup and undo
-- Set to auto read when a file is changed from the outside
vim.opt.autoread = true
--
-- Turn backup off, since most stuff is in SVN, git anyway...
vim.opt.backup = false
vim.opt.wb = false
vim.opt.swapfile = false

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

