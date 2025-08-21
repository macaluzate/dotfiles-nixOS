return {
  "rebelot/kanagawa.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    -- Estado inicial: transparencia
    local se_transparent = false

    -- Función que aplica el tema con los overrides
    local apply_theme = function()
      require("kanagawa").setup({
        compile = false,
        transparent = se_transparent,
        theme = "dragon",
        background = {
          dark = "dragon",
          light = "wave",
        },
        overrides = function(colors)
          return {
            ["@markup.link.url.markdown_inline"]   = { link = "Special" },    -- (url)
            ["@markup.link.label.markdown_inline"] = { link = "WarningMsg" }, -- [label]
            ["@markup.italic.markdown_inline"]     = { link = "Exception" },  -- *italic*
            ["@markup.raw.markdown_inline"]        = { link = "String" },     -- `code`
            ["@markup.list.markdown"]              = { link = "Function" },   -- + list
            ["@markup.quote.markdown"]             = { link = "Error" },      -- > blockcode
          }
        end,
      })
      vim.cmd("colorscheme kanagawa")
    end

    -- Función para alternar transparencia
    local toggle_transparency = function()
      se_transparent = not se_transparent
      apply_theme()
    end

    -- Aplicar tema al inicio
    apply_theme()

    -- Mapeo para alternar transparencia
    vim.keymap.set("n", "<leader>se", toggle_transparency, { noremap = true, silent = true , desc='Toogle Transparency' })
  end,
}

