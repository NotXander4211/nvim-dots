-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls", "clangd"}
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

lspconfig.emmet_ls.setup{
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  flags = nvlsp.flags,
}

lspconfig.pyright.setup {
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  filetypes = {"python"},
  settings = {
    pyright = {
      -- Using Ruff's import organizer
      disableOrganizeImports = true,
    },
    python = {
      analysis = {
        -- Ignore all files for analysis to exclusively use Ruff for linting
        ignore = { '*' },
      },
    },
  },
}
lspconfig.ruff_lsp.setup {
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  init_options = {
    settings = {
      -- Any extra CLI arguments for `ruff` go here.
      args = {},
    }
  }
}
lspconfig.rust_analyzer.setup {
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  settings = {
      ['rust-analyzer'] = {
          check = {
              command = "clippy";
          },
          diagnostics = {
              enable = true;
          }
      }
  }
}
lspconfig.clangd.setup {
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  filetypes = {"c"},
}
-- lspconfig.pylsp.setup {
--   on_attach = nvlsp.on_attach,
--   capabilities = nvlsp.capabilities,
--   filetypes = {"python"},
-- }

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
