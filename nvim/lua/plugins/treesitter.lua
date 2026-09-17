return {
  {
    'nvim-treesitter/nvim-treesitter',
    event = "VeryLazy",
    build = ':TSUpdate',
    opts = {
      ensure_installed = {
        "lua",
        "luadoc",
        "python",
        "go",
        "c",
        "cpp",
        "cmake"
      },
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      }
    }
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    event = "VeryLazy",
    config = function()
      require("nvim-treesitter-textobjects").setup({
        select = {
          lookahead = true,
        },
      })

      local select = require("nvim-treesitter-textobjects.select")
      local keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@conditional.outer",
        ["ic"] = "@conditional.inner",
        ["al"] = "@loop.outer",
        ["il"] = "@loop.inner",
      }
      for lhs, query in pairs(keymaps) do
        vim.keymap.set({ "x", "o" }, lhs, function()
          select.select_textobject(query, "textobjects")
        end)
      end
    end,
  }
}
