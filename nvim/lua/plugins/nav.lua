return {
	{
		-- File nav
		"stevearc/oil.nvim",
		dependencies = { "echasnovski/mini.icons" },
		config = function()
			require("oil").setup({
				columns = { "icon", "size" },
				keymaps = {
					["<C-h>"] = false,
					["<C-l>"] = false,
				},
				view_options = {
					show_hidden = true,
				},
			})

			vim.keymap.set("n", "<space>-", require("oil").toggle_float, { desc = "Open parent dir in float window" })
		end,
	},

	{
		-- fuzzy find everything
		"ibhagwan/fzf-lua",
		dependencies = { "echasnovski/mini.icons" },
		opts = {},
		config = function()
			local fzf = require("fzf-lua")
			vim.keymap.set("n", "<leader>sh", fzf.help_tags, { desc = "[S]earch [H]elp" })
			vim.keymap.set("n", "<leader>sk", fzf.keymaps, { desc = "[S]earch [K]eymaps" })
			vim.keymap.set("n", "<leader>sf", fzf.files, { desc = "[S]earch [F]iles" })

			vim.keymap.set("n", "<leader>ss", fzf.builtin, { desc = "[S]earch [S]elect" })
			vim.keymap.set("n", "<leader>sw", fzf.grep_cword, { desc = "[S]earch current [W]ord" })
			vim.keymap.set("n", "<leader>sg", fzf.live_grep_native, { desc = "[S]earch by [G]rep" })
			vim.keymap.set("n", "<leader>sd", fzf.diagnostics_workspace, { desc = "[S]earch [D]iagnostics" })
			vim.keymap.set("n", "<leader>sr", fzf.resume, { desc = "[S]earch [R]esume" })
			vim.keymap.set("n", "<leader>s.", fzf.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
			vim.keymap.set("n", "<leader><leader>", fzf.buffers, { desc = "[ ] Find existing buffers" })

			-- Shortcut for searching your Neovim configuration files
			vim.keymap.set("n", "<leader>sn", function()
				fzf.files({ cwd = vim.fn.stdpath("config") })
			end, { desc = "[S]earch [N]eovim files" })
		end,
	},

	{ -- switching between buffers
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			local harpoon = require("harpoon")

			vim.keymap.set("n", "<leader>a", function()
				harpoon:list():add()
			end, { desc = "Harpoon [A]dd" })

			vim.keymap.set("n", "<leader>m", function()
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end, { desc = "Harpoon [M]enu" })

			vim.keymap.set("n", "<leader>p", function()
				harpoon:list():prev()
			end, { desc = "Harpoon [P]revious buffer" })
			vim.keymap.set("n", "<leader>n", function()
				harpoon:list():next()
			end, { desc = "Harpoon [N]ext buffer" })
		end,
	},
}
