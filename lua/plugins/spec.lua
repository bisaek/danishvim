return {
  -- add your plugins here
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate'
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    lazy = false, -- neo-tree will lazily load itself
    config = function()
      require("neo-tree").setup({
        window = {
          mappings = {
            -- fjern default
            ["h"] = "none",
            ["l"] = "none",

            -- din nye navigation
            ["j"] = "close_node",     -- svarer til h (venstre)
            ["k"] = "down",  -- svarer til j (ned)
            ["l"] = "up",    -- svarer til k (op)
            ["æ"] = "open",           -- svarer til l (højre / åbn)
          }
        }
      })
    end    
  }

} 
