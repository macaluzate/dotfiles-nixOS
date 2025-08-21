return{
  "ibhagwan/fzf-lua",
  -- optional for icon support
  --dependencies = { "nvim-tree/nvim-web-devicons" },
  -- or if using mini.icons/mini.nvim
  dependencies = { "echasnovski/mini.icons" },
  opts = {},
  keys = {
    { 
      "<leader>ff",
      function() require('fzf-lua').files() end,
      desc="Find Files in Project Directory"

    },

    { 
      "<leader>fg",
      function() require('fzf-lua').live_grep() end,
      desc="Find by grepping Current Working Directory"

    },


    { 
      "<leader>fc",
      function() require('fzf-lua').files({cwd=vim.fn.expand("~/nix-config/config")}) end,
      desc="Find in neovim Configuration"

    }






  }
}
