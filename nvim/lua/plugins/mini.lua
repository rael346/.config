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

			-- require("mini.visits").setup()
			-- local visits = require("mini.visits")
			-- vim.keymap.set("n", "<leader>va", function()
			-- 	visits.add_label("main")
			-- end, { desc = "[A]dd label to main" })
			--
			-- vim.keymap.set("n", "<leader>vr", function()
			-- 	visits.remove_label("main")
			-- end, { desc = "[R]emove label from main" })
			--
			-- vim.keymap.set("n", "<leader>vp", function()
			-- 	visits.select_path("", { filter = "main" })
			-- end, { desc = "[V]isits [P]aths in main" })
			--
			-- vim.keymap.set("n", "<leader>vP", function()
			-- 	visits.select_path(nil, { filter = "main" })
			-- end, { desc = "[V]isits [P]aths in main (cwd)" })
			--
			-- -- Iterate based on recency
			-- local sort_latest = visits.gen_sort.default({ recency_weight = 1 })
			-- local map_iterate_core = function(lhs, direction, desc)
			-- 	local opts = { filter = "main", sort = sort_latest, wrap = true }
			-- 	local rhs = function()
			-- 		visits.iterate_paths(direction, vim.fn.getcwd(), opts)
			-- 	end
			-- 	vim.keymap.set("n", lhs, rhs, { desc = desc })
			-- end
			--
			-- map_iterate_core("[{", "last", "Core label (earliest)")
			-- map_iterate_core("[[", "forward", "Core label (earlier)")
			-- map_iterate_core("]]", "backward", "Core label (later)")
			-- map_iterate_core("]}", "first", "Core label (latest)")

			-- Simple and easy statusline.
			local statusline = require("mini.statusline")
			statusline.setup({ use_icons = vim.g.have_nerd_font })

			---@diagnostic disable-next-line: duplicate-set-field
			statusline.section_location = function()
				return "%2l:%-2v"
			end
		end,
	},
}
