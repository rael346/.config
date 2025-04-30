return {
	{ -- Collection of various small independent plugins/modules
		"echasnovski/mini.nvim",
		config = function()
			-- Better Around/Inside textobjects
			--
			-- Examples:
			--  - va)  - [V]isually select [A]round [)]paren
			--  - yinq - [Y]ank [I]nside [N]ext [']quote
			--  - ci'  - [C]hange [I]nside [']quote
			require("mini.ai").setup({ n_lines = 500 })

			-- Add/delete/replace surroundings (brackets, quotes, etc.)
			--
			-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
			-- - sd'   - [S]urround [D]elete [']quotes
			-- - sr)'  - [S]urround [R]eplace [)] [']
			require("mini.surround").setup()

			require("mini.pairs").setup()

			require("mini.comment").setup()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "typst",
				callback = function()
					vim.bo.commentstring = "// %s"
				end,
			})

			require("mini.icons").setup()

			require("mini.visits").setup()
			local visits = require("mini.visits")
			vim.keymap.set("n", "<leader>va", function()
				visits.add_label("main")
			end, { desc = "[A]dd label to main" })

			vim.keymap.set("n", "<leader>vr", function()
				visits.remove_label("main")
			end, { desc = "[R]emove label from main" })

			vim.keymap.set("n", "<leader>vp", function()
				visits.select_path("", { filter = "main" })
			end, { desc = "[V]isits [P]aths in main" })

			-- Simple and easy statusline.
			--  You could remove this setup call if you don't like it,
			--  and try some other statusline plugin
			local statusline = require("mini.statusline")
			-- set use_icons to true if you have a Nerd Font
			statusline.setup({ use_icons = vim.g.have_nerd_font })

			-- You can configure sections in the statusline by overriding their
			-- default behavior. For example, here we set the section for
			-- cursor location to LINE:COLUMN
			---@diagnostic disable-next-line: duplicate-set-field
			statusline.section_location = function()
				return "%2l:%-2v"
			end

			-- ... and there is more!
			--  Check out: https://github.com/echasnovski/mini.nvim
		end,
	},
}
