return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = {
        "c", "lua", "vim", "vimdoc", "query",
        "elixir", "heex", "javascript", "rust",
        "python", "cpp"
      },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<Enter>",       -- Comienza selección
          node_incremental = "<Enter>",     -- Expande selección
          scope_incremental = false,    -- Sin mapeo para scope
          node_decremental = "<BS>",    -- Reduce selección
        },
      },
    })
  end
}

