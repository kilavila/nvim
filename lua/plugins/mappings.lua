return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        i = {
          ["jk"] = { "<esc>" },
        },
        n = {
          ["<Leader>h"] = { "<cmd>noh<cr>", desc = "Clear highlight" },
          ["<Leader>b"] = { desc = "Buffers" },
        },
        t = {
          -- setting a mapping to false will disable it
          -- ["<esc>"] = false,
        },
      },
    },
  },
  {
    "AstroNvim/astrolsp",
    ---@type AstroLSPOpts
    opts = {
      mappings = {
        n = {
          K = {
            function() vim.lsp.buf.hover() end,
            desc = "Hover symbol details",
          },
          gD = {
            function() vim.lsp.buf.declaration() end,
            desc = "Declaration of current symbol",
            cond = "textDocument/declaration",
          },
        },
      },
    },
  },
}
