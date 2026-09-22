local map = vim.keymap.set

-- Better escape
map("i", "jk", "<Esc>", { desc = "Exit insert mode" })

-- Save / Quit
map("n", "<leader>w", "<cmd>write<CR>", { desc = "Save file" })
map("n", "<leader>q", "<cmd>quit<CR>", { desc = "Quit window" })
map("n", "<leader>Q", "<cmd>quitall<CR>", { desc = "Quit Neovim" })

-- Clear search highlight
map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })

-- Window navigation
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- Window resize
map("n", "<C-Up>", "<cmd>resize +2<CR>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -2<CR>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "Increase window width" })

-- Buffer navigation
map("n", "<leader>bn", "<cmd>bnext<CR>", { desc = "Next buffer" })
map("n", "<leader>bp", "<cmd>bprevious<CR>", { desc = "Previous buffer" })
map("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Delete buffer" })

-- Stay centered when scrolling
map("n", "<C-d>", "<C-d>zz", { desc = "Scroll down" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll up" })
map("n", "n", "nzzzv", { desc = "Next search result" })
map("n", "N", "Nzzzv", { desc = "Previous search result" })

-- Move selected lines
map("v", "<", "<gv", { desc = "Indent left" })
map("v", ">", ">gv", { desc = "Indent right" })

-- Keep visual selection after moving
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Terminal-friendly paste
map("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", {
	desc = "Find files",
})

map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", {
	desc = "Search text",
})

map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", {
	desc = "Find buffers",
})

map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", {
	desc = "Find help",
})

map("n", "<leader>fe", "<cmd>Neotree reveal<CR>", {
	desc = "Reveal current file",
})

-- LSP keymaps
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(event)
		local opts = { buffer = event.buf, silent = true }

		-- Navigation
		map("n", "gd", vim.lsp.buf.definition, {
			buffer = event.buf,
			desc = "Go to definition",
		})

		map("n", "gD", vim.lsp.buf.declaration, {
			buffer = event.buf,
			desc = "Go to declaration",
		})

		map("n", "gr", vim.lsp.buf.references, {
			buffer = event.buf,
			desc = "Find references",
		})

		map("n", "gi", vim.lsp.buf.implementation, {
			buffer = event.buf,
			desc = "Go to implementation",
		})

		-- Information
		map("n", "K", vim.lsp.buf.hover, {
			buffer = event.buf,
			desc = "Show hover information",
		})

		-- Code actions
		map("n", "<leader>ca", vim.lsp.buf.code_action, {
			buffer = event.buf,
			desc = "Code action",
		})

		map("n", "<leader>rn", vim.lsp.buf.rename, {
			buffer = event.buf,
			desc = "Rename symbol",
		})

		-- Diagnostics
		map("n", "<leader>xx", vim.diagnostic.open_float, {
			buffer = event.buf,
			desc = "Show diagnostic",
		})

		map("n", "[d", vim.diagnostic.goto_prev, {
			buffer = event.buf,
			desc = "Previous diagnostic",
		})

		map("n", "]d", vim.diagnostic.goto_next, {
			buffer = event.buf,
			desc = "Next diagnostic",
		})
	end,
})
