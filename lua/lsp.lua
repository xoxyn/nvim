-- ── LspAttach: buffer-local keymaps + semantic tokens ───────────────
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        local buf = args.buf
        local lsp = vim.lsp
        local k = function(mode, lhs, rhs) vim.keymap.set(mode, lhs, rhs, { buffer = buf }) end
        k('n', 'gd', lsp.buf.definition)
        k('n', 'gD', lsp.buf.declaration)
        k('n', 'gr', lsp.buf.references)
        k('n', 'gi', lsp.buf.implementation)
        k('n', 'K', lsp.buf.hover)
        k('n', '<leader>rn', lsp.buf.rename)
        k('n', '<leader>ca', lsp.buf.code_action)
        -- conform first, LSP as fallback
        k('n', '<leader>f', function()
            require('conform').format({ async = true, lsp_fallback = true })
        end)

        local client = lsp.get_client_by_id(args.data.client_id)
        if client and client:supports_method('textDocument/semanticTokens') then
            lsp.semantic_tokens.enable(true, { bufnr = buf })
        end
    end,
})

-- ── Defaults for every server ───────────────────────────────────────
vim.lsp.config('*', {
    capabilities = require('blink.cmp').get_lsp_capabilities(),
})

-- ── Overrides (only where you differ from nvim-lspconfig defaults) ──
vim.lsp.config('lua_ls', {
    settings = {
        Lua = {
            runtime = { version = 'LuaJIT' },
            workspace = {
                checkThirdParty = false,
                library = { vim.env.VIMRUNTIME },
            },
            diagnostics = { globals = { 'vim' } },
        },
    },
})

vim.lsp.config('emmet_language_server', {
    init_options = { showExpandedAbbreviation = 'always' },
})

-- standalone .html files outside a project still get a root
vim.lsp.config('html', {
    root_markers = { 'package.json', 'index.html', '.git' },
})

-- ── Enable ──────────────────────────────────────────────────────────
vim.lsp.enable({
    'rust_analyzer', 'lua_ls', 'gopls', 'zls', 'ts_ls', 'clangd',
    'pyright', 'cssls', 'html', 'svelte', 'jsonls', 'bashls',
    'dockerls', 'taplo', 'yamlls', 'tailwindcss',
    'r_language_server', 'jdtls', 'neocmake',
    'emmet_language_server', 'glsl_analyzer',
})
