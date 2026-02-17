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






vim.cmd.colorscheme "catppuccin-mocha"
