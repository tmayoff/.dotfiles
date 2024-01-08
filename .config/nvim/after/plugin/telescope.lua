local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, ***REMOVED******REMOVED***)
vim.keymap.set('n', '<C-p>', builtin.git_files, ***REMOVED******REMOVED***)
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string(***REMOVED***search  = vim.fn.input("Grep > ")***REMOVED***);
end)
