local opt = vim.opt
local g = vim.g

-- Global
opt.mouse = 'a'
opt.encoding = 'utf-8'
opt.backup = false
opt.writebackup = false
opt.swapfile = false
opt.undofile = false
opt.spell = false
opt.hidden = true
opt.clipboard = 'unnamedplus'
opt.ignorecase = true
opt.smartcase = true
opt.lazyredraw = true
opt.splitright = true
opt.splitbelow = true
opt.errorbells = false
opt.wrap = false
opt.showmode = false
opt.showcmd = true
opt.scrolloff = 5
opt.scrolljump = 3
opt.joinspaces = false
opt.ttimeout = true
opt.ttimeoutlen = 0
opt.linespace = 0
opt.showmatch = true
opt.history = 1000
opt.undolevels = 1000
opt.gdefault = true
opt.list = false
opt.foldenable = false
opt.foldmethod = 'expr'
opt.foldlevel = 99
opt.foldnestmax = 10
opt.foldexpr = 'nvim_treesitter#foldexpr()'
opt.shortmess:append { c = true, S = true }
opt.listchars = { tab = "›  ", trail = "·", precedes = "←", extends = "→",eol = "↲", nbsp = "␣" }
opt.completeopt='menu,menuone,noselect'
opt.incsearch = true
opt.autoindent = true

opt.background = 'dark'
opt.termguicolors = true
vim.g.tokyonight_sidebars = { "NvimTree" }

vim.cmd[[:silent! colorscheme tokyonight]]
vim.cmd[[hi link TroubleSignError DiagnosticSignError]]
vim.cmd[[hi link TroubleSignWarning DiagnosticSignWarn]]
vim.cmd[[hi link TroubleSignHint DiagnosticSignHint]]
vim.cmd[[hi link TroubleSignInformation DiagnosticSignInfo]]

-- Window
opt.number = true
opt.cursorline = true

-- Buffer
opt.fileformat = 'unix'
opt.tabstop = 2
opt.expandtab = true
opt.softtabstop = 2
opt.shiftwidth = 2


-- opt.colorcolumn = "+1"
-- opt.signcolumn = 'yes'

-- opt.fillchars = { vert = ' ' }

-- opt.showtabline = 2
-- opt.backupcopy = 'yes'
-- opt.wrapscan = true
-- opt.hlsearch = true
-- opt.completeopt = { 'menu', 'menuone', 'noselect' }
--
-- vim.cmd[[autocmd BufReadPost * lua goto_last_pos()]]

-- function goto_last_pos()
--   local last_pos = vim.fn.line("'\"")
--   if last_pos > 0 and last_pos <= vim.fn.line("$") then
--     vim.api.nvim_win_set_cursor(0, {last_pos, 0})
--   end
-- end
