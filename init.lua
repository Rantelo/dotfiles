-- 0. Global Variables
vim.g.mapleader = " "
vim.g.jsx_ext_required = 0
vim.g.ctrlp_max_files = 0
vim.g.strip_whitespace_on_save = 1

-- 1. Bootstrap 'lazy.nvim' (Plugin Manager)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- 2. Setup Plugins
require("lazy").setup({
  -- UI / Theme
  -- { "joshdick/onedark.vim" },
  { "lunacookies/vim-colors-xcode" },
  { "scrooloose/nerdtree",
    config = function()
      vim.g.NERDTreeShowHidden = 1
    end
  },
  { "Xuyuanp/nerdtree-git-plugin" },

  -- Features
  { "ctrlpvim/ctrlp.vim" }, -- Faster version
  { "Townk/vim-autoclose" },
  { "mattn/emmet-vim" },
  { "ntpeters/vim-better-whitespace" },
  { "jeffkreeftmeijer/vim-numbertoggle" },
  { "gavinbeatty/dragvisuals.vim" },

  -- Language Support
  { "pangloss/vim-javascript" },
  { "mxw/vim-jsx" },
  { "heavenshell/vim-jsdoc" },
})

-- 3. General Settings (The 'set' commands)
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.colorcolumn = "80"

-- 3. General Settings
-- vim.opt.fillchars = "horiz:-,vert:|,stl:-,stlnc:-
-- 3. General Settings
vim.opt.fillchars = "horiz:━,vert:┃,stl:-,stlnc:-"

vim.cmd("syntax on")
-- vim.cmd("colorscheme onedark")
vim.cmd("colorscheme xcodedark")

-- Override the background to match xcodehc (Pure Black)
-- local hc_bg = "#262627"
local hc_bg = "#101010"

local highlights = {
  Normal = { bg = hc_bg },
  NonText = { bg = hc_bg },
  LineNr = { bg = hc_bg },
  Folded = { bg = hc_bg },
  EndOfBuffer = { bg = hc_bg },
  SignColumn = { bg = hc_bg },
  SideBar = { bg = hc_bg }, -- Specific to some xcode variants
  LineNr = { bg = hc_bg, fg = "#934d5a" }
}

for group, settings in pairs(highlights) do
  vim.api.nvim_set_hl(0, group, settings)
end

vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#5c6370", bg = "NONE" })
vim.api.nvim_set_hl(0, "VertSplit", { fg = "#5c6370", bg = "NONE" })

-- 4. Keymaps (The 'map' commands)
local map = vim.keymap.set

-- Normal/Visual maps
map('n', '<C-g>', ':NERDTreeToggle<CR>')
map('n', '<F3>', ':set hlsearch! hlsearch?<CR>')
map('n', '<F2>', ':ToggleWhitespace<CR>')
map('n', '<leader>r', 'gt')
map('n', '<leader>e', 'gT')
map('n', '<leader>v', ':vnew<CR>')
map('n', '<leader>h', ':new<CR>')
map('n', '<leader>t', ':tabnew<CR>')

-- Insert mode snippets
map('i', 'cll', 'console.log();<Esc>==f(a')
map('i', '<C-b>', '<Space><BS>') -- Your faster <C-y> hack

-- Visual mode wraps
map('v', '""', 'c""<Esc>P')
map('v', '((', 'c()<Esc>P')

