local opt = vim.opt
local g = vim.g

-- Global
opt.mouse = 'a'
opt.encoding = 'utf-8'
opt.backup = false
opt.writebackup = false
opt.swapfile = false
opt.undofile = true
opt.undodir= '~/.vim/undo'
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
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd[[:silent! colorscheme tokyonight]]
vim.cmd[[hi link TroubleSignError DiagnosticSignError]]
vim.cmd[[hi link TroubleSignWarning DiagnosticSignWarn]]
vim.cmd[[hi link TroubleSignHint DiagnosticSignHint]]
vim.cmd[[hi link TroubleSignInformation DiagnosticSignInfo]]

-- gray
vim.cmd[[highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080]]
-- " blue
vim.cmd[[highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6]]
vim.cmd[[highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6]]
-- " light blue
vim.cmd[[highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE]]
vim.cmd[[highlight! CmpItemKindInterface guibg=NONE guifg=#9CDCFE]]
vim.cmd[[highlight! CmpItemKindText guibg=NONE guifg=#9CDCFE]]
-- " pink
vim.cmd[[highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0]]
vim.cmd[[highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0]]
-- " front
vim.cmd[[highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4]]
vim.cmd[[highlight! CmpItemKindProperty guibg=NONE guifg=#D4D4D4]]
vim.cmd[[highlight! CmpItemKindUnit guibg=NONE guifg=#D4D4D4]]

vim.cmd([[
  autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js EslintFixAll
]])
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
