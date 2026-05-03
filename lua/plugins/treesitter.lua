return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  config = function()

    require("nvim-treesitter").setup {
      install_dir = vim.fn.stdpath('data') .. '/site',
    }

    require("nvim-treesitter").install {
      "lua",
      "rust",
      "php",
      "blade",
      "html",
      "javascript",
      "css",
      "json",
      "typescript",
      "tsx",
    }

    vim.api.nvim_create_autocmd("FileType", {
      callback = function()
        pcall(vim.treesitter.start)
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
