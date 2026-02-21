require("config.lazy")

vim.opt.relativenumber = true

vim.keymap.set({'n','v','o'}, 'h', '<Nop>')
vim.keymap.set({'n','v','o'}, 'j', 'h')
vim.keymap.set({'n','v','o'}, 'k', 'j')
vim.keymap.set({'n','v','o'}, 'l', 'k')
vim.keymap.set({'n','v','o'}, 'æ', 'l')

vim.keymap.set('n', '<leader>w', function ()
 if vim.bo.modified then
  vim.cmd("write")
  print("File Saved")
else
  print("No changes")
 end 
end)

-- Brug spaces i stedet for rigtige tabs
vim.o.expandtab = true       -- gør at <Tab> indsætter spaces
vim.o.tabstop = 2            -- en tab er 2 spaces bred
vim.o.shiftwidth = 2         -- auto-indentering bruger 2 spaces
vim.o.softtabstop = 2        -- hvor mange spaces <Tab> indsætter i insert mode

-- Valgfrit: smart auto-indentering
vim.o.smartindent = true

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
})

vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)



vim.keymap.set("n", "<leader>h", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
  print("Inlay hint: " .. (vim.lsp.inlay_hint.is_enabled() and "ON" or "OFF"))
end)

local virtual_text_enabled = true

vim.keymap.set("n", "<leader>dt", function()
  virtual_text_enabled = not virtual_text_enabled

  vim.diagnostic.config({
    virtual_text = virtual_text_enabled,
  })

  print("Virtual text: " .. (virtual_text_enabled and "ON" or "OFF"))
end)

vim.cmd.colorscheme "catppuccin-mocha"
