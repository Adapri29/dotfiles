return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim"
  },
  config = function()
    -- Diágnostico
    vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
    vim.keymap.set('n', '[d', function() vim.diagnostic.jump({ count = -1, float = true }) end)
    vim.keymap.set('n', ']d', function() vim.diagnostic.jump({ count = 1, float = true }) end)
    vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)


    local on_attach = function(_, bufnr)
      vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'

      local opts = { buffer = bufnr }
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
      vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
      vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
      vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
      vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
      vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, opts)
    end

    vim.lsp.config("lua_ls", {
      on_attach = on_attach,
      settings = {
        Lua = {
          telemetry = { enable = false },
          workspace = { checkThirdParty = false },
        }
      }
    })

    vim.lsp.config("clangd", {
      on_attach = on_attach,
      cmd = {
        "clangd",
        "--background-index",
        "--clang-tidy",
        "--header-insertion=never"
      }
    })

    vim.lsp.config("basedpyright", {
      on_attach = on_attach,
      cmd = {
        "basedpyright-langserver",
        "--stdio"
      },
      settings = {
        basedpyright = {
          analysis = {
            autoSearchPaths = true,
            diagnosticMode = "openFilesOnly"
          },
        disableTaggedHints = false
        },
      }
    })

    vim.lsp.config("qmlls", {
      on_attach = on_attach,
      cmd = {
        "qmlls6",
        "-E",
        "--no-cmake-calls"
      },

      root_markers = {".qmlls.ini", "shell.qml", ".git"},
    })

    vim.lsp.enable({ "lua_ls", "clangd", "basedpyright", "qmlls"})
  end,
}
