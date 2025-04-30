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
          ["<Leader>bb"] = { "<cmd>bprev<cr>", desc = "Previous buffer" },
          ["<Leader>bn"] = { "<cmd>bnext<cr>", desc = "Next buffer" },
          ["<Leader>ng"] = { "<cmd>Neogit<cr>", desc = "Open Neogit" },
          ["<leader>U"] = { "<cmd>UndotreeToggle<cr>", desc = "Undotree toggle" },
          ["<leader>T"] = { "<cmd>Twilight<cr>", desc = "Toggle twilight" },
          ["<leader>lv"] = { "<cmd>lua require('functions').log()<cr>", desc = "Log variable" },
          ["<leader>s"] = { "<Plug>(easymotion-overwin-f2)", desc = "Easymotion" },
          -- ["<leader>ln"] = { "<cmd>lua require('functions').note()<cr>", desc = "Create note" },
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
