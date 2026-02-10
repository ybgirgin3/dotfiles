--------------------------------------------------
-- Leader
--------------------------------------------------
vim.g.mapleader = " "

--------------------------------------------------
-- HARD INDENT RULE: 2 SPACES EVERYWHERE
--------------------------------------------------
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2

vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.cindent = false
vim.opt.mouse = ''

--------------------------------------------------
-- Kill ALL indent overrides
--------------------------------------------------
vim.g.editorconfig = false

vim.cmd([[
  filetype off
  filetype plugin on
]])

vim.api.nvim_create_autocmd({ "BufEnter", "FileType" }, {
  callback = function()
    vim.bo.tabstop = 2
    vim.bo.shiftwidth = 2
    vim.bo.softtabstop = 2
    vim.bo.expandtab = true
  end,
})

--------------------------------------------------
-- Basic settings
--------------------------------------------------
vim.opt.number = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.hidden = true
vim.opt.updatetime = 300
vim.opt.signcolumn = "yes"
vim.opt.termguicolors = true
vim.opt.guicursor = "n-v-c-i:block"

--------------------------------------------------
-- Keymaps
--------------------------------------------------
vim.keymap.set("n", "<D-s>", ":w<CR>")
vim.keymap.set("i", "<D-s>", "<Esc>:w<CR>a")
vim.keymap.set("v", "<D-s>", "<Esc>:w<CR>")

vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>q", ":q<CR>")
vim.keymap.set("n", "<leader>x", ":wq<CR>")
vim.keymap.set("n", "<leader><space>", ":nohlsearch<CR>")


--------------------------------------------------
-- Prevent accidental :w1 etc
--------------------------------------------------
vim.cmd([[
  cnoreabbrev w1 w
  cnoreabbrev wq1 wq
  cnoreabbrev qw1 wq
]])


--------------------------------------------------
-- Plugin manager (MINIMAL) : vim-plug
--------------------------------------------------
local plug_path = vim.fn.stdpath("data") .. "/site/autoload/plug.vim"

if vim.fn.empty(vim.fn.glob(plug_path)) > 0 then
  vim.fn.system({
    "curl", "-fLo", plug_path,
    "--create-dirs",
    "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  })
end

vim.cmd([[
  call plug#begin('~/.local/share/nvim/plugged')

  Plug 'junegunn/fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'nvim-tree/nvim-tree.lua'
  Plug 'nvim-tree/nvim-web-devicons'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'jremmen/vim-ripgrep'

  call plug#end()
]])

--------------------------------------------------
-- nvim-tree (NERDTree replacement)
--------------------------------------------------
require("nvim-tree").setup({
  view = {
    side = "right",
    width = 30,
  },
  renderer = {
    icons = {
      show = {
        git = true,
        folder = true,
        file = true,
      }
    }
  },
  update_focused_file = {
    enable = true,
  },
})

-- mappings
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
vim.keymap.set("n", "<leader>n", ":NvimTreeFocus<CR>")
vim.keymap.set("n", "<leader>a", ":NvimTreeFindFile<CR>")

--------------------------------------------------
-- FZF
--------------------------------------------------
vim.keymap.set("n", "<leader>f", ":Files<CR>")
vim.keymap.set("n", "<leader>p", ":Rg<CR>")

vim.g.fzf_layout = {
  window = { width = 0.9, height = 0.6 }
}

vim.env.FZF_DEFAULT_COMMAND =
  'rg --files --hidden --glob "!.git/*" --glob "!node_modules/*"'

--------------------------------------------------
-- Airline
--------------------------------------------------
vim.g.airline_powerline_fonts = 1
vim.g.airline_theme = "dark"

--------------------------------------------------
-- Tabs
--------------------------------------------------
vim.keymap.set("n", "<leader>h", ":tabprevious<CR>")
vim.keymap.set("n", "<leader>l", ":tabnext<CR>")


--------------------------------------------------
-- Gelişmiş Word Search (Live Grep)
--------------------------------------------------
vim.cmd([[
  function! RipgrepFuzzy(query, fullscreen)
    let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
    let initial_command = printf(command_fmt, shellescape(a:query))
    let reload_command = printf(command_fmt, '{q}')
    let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
    call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
  endfunction

  command! -nargs=* -bang RG call RipgrepFuzzy(<q-args>, <bang>0)
]])

-- Yeni tuş ataması (Dinamik arama için)
vim.keymap.set("n", "<leader>g", ":RG<CR>")
