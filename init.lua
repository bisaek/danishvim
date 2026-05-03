require("config.lazy")

vim.opt.relativenumber = true
vim.opt.number = true

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

local last_buffer = nil
local terminal_buffers = {}

function open_terminal(terminal)
  if terminal_buffers[terminal] then
    vim.api.nvim_set_current_buf(terminal_buffers[terminal])
  else
    last_buffer = vim.api.nvim_get_current_buf()
    vim.cmd("terminal")
    terminal_buffers[terminal] = vim.api.nvim_get_current_buf()
  end
end
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])

vim.keymap.set("n", "<leader>t", function()
  if vim.bo.buftype == "terminal" then
    vim.api.nvim_set_current_buf(last_buffer)
  else 
    vim.keymap.set("n", "t", function() 
      open_terminal("t")
    end)
    vim.keymap.set("n", "r", function()
      open_terminal("r")
    end)
  end
end)

vim.cmd.colorscheme "catppuccin-mocha"
