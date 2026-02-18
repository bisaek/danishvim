return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  config = function()

    --vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    --vim.wo[0][0].foldmethod = 'expr'

    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*.rs, *.lua",
      callback = function()
        vim.lsp.buf.format({ async = false })
      end
    })
  end
}
