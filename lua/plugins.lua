local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter").setup()
		end,
	},

	-- LSP
	{
		"neovim/nvim-lspconfig",
		config = function()
			vim.lsp.config("clangd", {
				cmd = {
					"clangd",
					"--background-index",
					"--clang-tidy",
					"--completion-style=detailed",
					"--header-insertion=iwyu",
				},
			})

			vim.lsp.config("basedpyright", {})

			vim.lsp.enable("clangd")
			vim.lsp.enable("basedpyright")
		end,
	},

	-- Completion
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
		},
		config = function()
			local cmp = require("cmp")

			cmp.setup({
				mapping = cmp.mapping.preset.insert({
					["<C-n>"] = cmp.mapping.select_next_item(),
					["<C-p>"] = cmp.mapping.select_prev_item(),
					["<C-Space>"] = cmp.mapping.complete(),
					["<CR>"] = cmp.mapping.confirm({
						select = false,
					}),
					["<Esc>"] = cmp.mapping.abort(),
				}),

				sources = {
					{ name = "nvim_lsp" },
					{ name = "buffer" },
					{ name = "path" },
				},
			})
		end,
	},

	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},

	-- Git
	{
		"lewis6991/gitsigns.nvim",
		config = true,
	},

	-- Statusline
	{
		"nvim-lualine/lualine.nvim",
		config = true,
	},

	-- Which-key

	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {},
	},

	-- Neo-Tree

	{
		"MunifTanjim/nui.nvim",
	},

	{
		"nvim-neo-tree/neo-tree.nvim",
		opts = {
			filesystem = {
				follow_current_file = {
					enabled = true,
					leave_dirs_open = true,
				},
			},
		},
	},

	-- Format
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
			},
		},
	},
})
