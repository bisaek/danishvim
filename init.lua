require("config.lazy")



vim.keymap.set({'n','v','o'}, 'h', '<Nop>')
vim.keymap.set({'n','v','o'}, 'j', 'h')
vim.keymap.set({'n','v','o'}, 'k', 'j')
vim.keymap.set({'n','v','o'}, 'l', 'k')
vim.keymap.set({'n','v','o'}, 'æ', 'l')

-- Brug spaces i stedet for rigtige tabs
vim.o.expandtab = true       -- gør at <Tab> indsætter spaces
vim.o.tabstop = 2            -- en tab er 2 spaces bred
vim.o.shiftwidth = 2         -- auto-indentering bruger 2 spaces
vim.o.softtabstop = 2        -- hvor mange spaces <Tab> indsætter i insert mode

-- Valgfrit: smart auto-indentering
vim.o.smartindent = true



local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

vim.keymap.set('n', '<leader>n', ':Neotree filesystem reveal right<cr>')
--vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
--vim.wo[0][0].foldmethod = 'expr'



vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"


vim.cmd.colorscheme "catppuccin-mocha"
