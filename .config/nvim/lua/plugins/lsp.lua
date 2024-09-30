return {
  -- tools
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "stylua",
        "selene",
        "luacheck",
        "lua-language-server",
        "rust-analyzer",
      })
    end,
  },
  -- configure LSP server
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        lua_ls = {
          Lua = {
            diagnostics = {
              globals = { "vim" }, -- Allow 'vim' as a global variable for Neovim plugin development
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true), -- Include Neovim runtime files for completions
              checkThirdParty = false, -- Skip third-party libraries check
            },
          },
        },
        rust_analyzer = {
          settings = {
            ["rust-analyzer"] = {
              cargo = {
                allFeatures = true, -- Enable all features in Cargo.toml
              },
              procMacro = {
                enable = true, -- Enable procedural macros
              },
            },
          },
        },
      },
    },
  },
}
