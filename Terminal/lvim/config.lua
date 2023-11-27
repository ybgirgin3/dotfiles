--[[
 THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
 `lvim` is the global options object
]]
-- vim options
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.relativenumber = true
-- vim.opt.cursorline = false


-- general
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false
lvim.transparent_window = false

-- keymappings <https://www.lunarvim.org/docs/configuration/keybindings>
lvim.leader = "space"

-- Disable Line Moving
lvim.keys.normal_mode["<A-j>"] = ""
lvim.keys.normal_mode["<A-k>"] = ""

lvim.keys.visual_block_mode["<A-j>"] = ""
lvim.keys.visual_block_mode["<A-k>"] = ""

lvim.keys.insert_mode["<A-j>"] = ""
lvim.keys.insert_mode["<A-k>"] = ""

-- -- Change theme settings
lvim.colorscheme = 'onedark'

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true

-- Automatically install missing parsers when entering buffer
lvim.builtin.treesitter.auto_install = true

-- --- disable automatic installation of servers
lvim.lsp.installer.setup.automatic_installation = false

-- -- linters, formatters and code actions <https://www.lunarvim.org/docs/languages#lintingformatting>
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	{ command = "stylua" },
	{
		command = "prettier",
		extra_args = { "--print-width", "100" },
		filetypes = { "typescript", "typescriptreact" },
	},
    { name = 'black' }
})
local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
	{ command = "eslint", filetypes = { "typescript", "typescriptreact" } },
	{ command = "flake8", filetypes = { "python" } },
	{
		command = "shellcheck",
		args = { "--severity", "warning" },
	},
})
local code_actions = require("lvim.lsp.null-ls.code_actions")
code_actions.setup({
	{
		exe = "eslint",
		filetypes = { "typescript", "typescriptreact" },
	},
})

-- Autocommands (`:help autocmd`) <https://neovim.io/doc/user/autocmd.html>
-- lvim.autocommands = {
--   {
--     { "ColorScheme" },
--     {
--       pattern = "*",
--       callback = function()
--         -- change `Normal` to the group you want to change
--         -- and `#ffffff` to the color you want
--         -- see `:h nvim_set_hl` for more options
--         vim.api.nvim_set_hl(0, "Normal", { bg = "#000000", fg = "#ff0000", underline = false })
--         vim.api.nvim_set_hl(0, "Comment", { fg = "#4caf50", underline = false, bold = true })
--       end,
--     },
--   },
-- }

-- DEBUGGING
-- install plugins
lvim.plugins = {
  -- for debug
    "ChristianChiarulli/swenv.nvim",
    "stevearc/dressing.nvim",
    "mfussenegger/nvim-dap-python",
    "nvim-neotest/neotest",
    "nvim-neotest/neotest-python",

   -- colorscheme
    "patstockwell/vim-monokai-tasty",
    {"navarasu/onedark.nvim",
      config = function ()
          require('onedark').setup({
              style = 'deep'
              -- style = 'warm'
              -- style = 'warmer'
              -- style = 'darker'
              -- style = 'dark'
          })
          require('onedark').load()
      end
    }
}

-- automatically install python syntax highlighting
lvim.builtin.treesitter.ensure_installed = {
  "python",
}

-- setup formatting
lvim.log.level = "info"
lvim.format_on_save = {
	enabled = true,
	pattern = "*.py",
	timeout = 1000,
}


-- setup debug adapter
lvim.builtin.dap.active = true
local mason_path = vim.fn.glob(vim.fn.stdpath "data" .. "/mason/")
pcall(function()
  require("dap-python").setup(mason_path .. "packages/debugpy/venv/bin/python")
end)

-- setup testing
require("neotest").setup({
  adapters = {
    require("neotest-python")({
      -- Extra arguments for nvim-dap configuration
      -- See https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for values
      dap = {
        justMyCode = false,
        console = "integratedTerminal",
      },
      args = { "--log-level", "DEBUG", "--quiet" },
      runner = "pytest",
    })
  }
})

lvim.builtin.which_key.mappings["dm"] = { "<cmd>lua require('neotest').run.run()<cr>",
  "Test Method" }
lvim.builtin.which_key.mappings["dM"] = { "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>",
  "Test Method DAP" }
lvim.builtin.which_key.mappings["df"] = {
  "<cmd>lua require('neotest').run.run({vim.fn.expand('%')})<cr>", "Test Class" }
lvim.builtin.which_key.mappings["dF"] = {
  "<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>", "Test Class DAP" }
lvim.builtin.which_key.mappings["dS"] = { "<cmd>lua require('neotest').summary.toggle()<cr>", "Test Summary" }


-- binding for switching
lvim.builtin.which_key.mappings["C"] = {
  name = "Python",
  c = { "<cmd>lua require('swenv.api').pick_venv()<cr>", "Choose Env" },
}

