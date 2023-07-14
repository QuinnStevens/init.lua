local telescope = require('telescope')
local builtin = require('telescope.builtin')
telescope.setup({
	pickers = {
		buffers = {
			show_all_buffers = true,
			sort_lastused = true,
			previewer = true,
			mappings = {
				i = {
					["<C-d>"] = "delete_buffer",
				},
				n = {
					["d"] = "delete_buffer",
				},
			},
		},
	},
})
vim.keymap.set('n', '<leader>ff', builtin.find_files, {desc='Telescope find files'})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {desc='Telescope live grep'})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {desc='Telescope find buffer'})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {desc='Telescope find help'})
vim.keymap.set('n', '<leader>fm', builtin.keymaps, {desc='Telescope find keymap'})

-- Git stuff
vim.keymap.set('n', '<leader>fs', builtin.git_files, {desc='Telescope git files'})
vim.keymap.set('n', '<leader>fcc', builtin.git_commits, {desc='Telescope git commits'})
vim.keymap.set('n', '<leader>fcb', builtin.git_bcommits, {desc='Telescope buffer commits'})
