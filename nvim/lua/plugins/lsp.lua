return {
    {
        "williamboman/mason.nvim",
        priority = 1003,
        config = true
    },
    {
        "williamboman/mason-lspconfig.nvim",
        priority = 1002,
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "clangd", "asm_lsp", "gopls" }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        priority = 1001,
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            -- setup here
            lspconfig.lua_ls.setup({ capabilities = capabilities })
            lspconfig.clangd.setup({ capabilities = capabilities })
            lspconfig.gopls.setup({ capabilities = capabilities })
            lspconfig.asm_lsp.setup({ capabilities = capabilities, root_dir = require('lspconfig.util').root_pattern('.asm-lsp.toml', '.git', '*.asm', '*.s', '*.S') })
        end,
        keys = {
            { 'K', vim.lsp.buf.hover, {} },
            { 'gd', vim.lsp.buf.definition, {} },
            { mode = { 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {} }
        }
    },
    {
        "j-hui/fidget.nvim",
        opts = {
            integration = {
                ["nvim-tree"] = {
                    enable = true,
                },
            },
        },
        config = true
    },
    -- {
    --     "mrded/nvim-lsp-notify",
    --     depencencies = { "rcarriga/nvim-notify" },
    --     config = function()
    --         require('lsp-notify').setup({
    --             notify = require('notify')
    --         })
    --     end
    -- }
}
