local cmp = require('cmp')

-- Compe configuration used for autocompletion
cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      --vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),

  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' }, -- For vsnip users.
    -- { name = 'luasnip' }, -- For luasnip users.
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
  }, {
    { name = 'buffer' },
  })
})

local function config(_config)
  return vim.tbl_deep_extend("force", {
    capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
    on_attach = function(client)
      Nnoremap("gd", ":lua vim.lsp.buf.definition()<CR>")
      Nnoremap("K", ":lua vim.lsp.buf.hover()<CR>")
      Nnoremap("<leader>vws", ":lua vim.lsp.buf.workspace_symbol()<CR>")
      Nnoremap("<leader>vd", ":lua vim.diagnostic.open_float()<CR>")
      Nnoremap("[d", ":lua vim.lsp.diagnostic.goto_next()<CR>")
      Nnoremap("]d", ":lua vim.lsp.diagnostic.goto_prev()<CR>")
      Nnoremap("<leader>vca", ":lua vim.lsp.buf.code_action()<CR>")
      Nnoremap("<leader>vrr", ":lua vim.lsp.buf.references()<CR>")
      Nnoremap("<leader>vrn", ":lua vim.lsp.buf.rename()<CR>")
      Inoremap("<C-h>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")

      require("lsp-format").on_attach(client)
    end,
  }, _config or {})
end

-- Golang
vim.fn.setenv("GOFLAGS", "-tags=unix")
require("lspconfig").gopls.setup(config({
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  },
}))

-- go install github.com/nametake/golangci-lint-langserver@latest
-- go install github.com/golangci/golangci-lint/cmd/golangci-lint@v1.42.1
require("lspconfig").golangci_lint_ls.setup(config())

-- Rust
require("lspconfig").rust_analyzer.setup(config())

-- LUA
require("lspconfig").sumneko_lua.setup(config())

-- YAML
require("lspconfig").yamlls.setup(config())


-- Jsonnet
require("lspconfig").jsonnet_ls.setup(config())
require("lspconfig").jsonls.setup(config())

-- Bash
require("lspconfig").bashls.setup(config())

-- Zig
require("lspconfig").zls.setup(config())

-- Terraform
require("lspconfig").terraformls.setup(config())
require("lspconfig").tflint.setup(config())

-- Tilt
require("lspconfig").tilt_ls.setup(config())
