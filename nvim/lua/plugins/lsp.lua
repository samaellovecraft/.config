return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim"
        },
        init = function()
            require("mason").setup()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            local lspconfig = require("lspconfig")

            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "clangd", "asm_lsp", "gopls" },
                handlers = {
                    -- default handler
                    function (server_name)
                        lspconfig[server_name].setup { capabilities = capabilities }
                    end,
                    -- targeted overrides
                    ["lua_ls"] = function ()
                        lspconfig.lua_ls.setup({
                            capabilities = capabilities,
                            settings = {
                                Lua = {
                                    diagnostics = {
                                        globals = { "vim", "jit" }
                                    }
                                }
                            }
                        })
                    end,
                    ["asm_lsp"] = function ()
                        lspconfig.asm_lsp.setup({
                            capabilities = capabilities,
                            root_dir = require('lspconfig.util').root_pattern('.asm-lsp.toml', '.git', '*.asm', '*.s', '*.S')
                        })
                    end,
                }
            })
        end,
        keys = {
            { 'K', vim.lsp.buf.hover, {} },
            { 'gd', vim.lsp.buf.definition, {} },
            { '<leader>ca', vim.lsp.buf.code_action, {} },
            { '<leader>rn', vim.lsp.buf.rename, {} },
            { '<leader>ws', vim.lsp.buf.workspace_symbol, {} },
            { '<leader>ref', vim.lsp.buf.references, {} },
            { mode = {'i'}, '<C-h>', vim.lsp.buf.signature_help, {} },
            { '<leader>d', vim.diagnostic.open_float, {} },
            { '<leader>[d', vim.diagnostic.goto_next, {} },
            { '<leader>]d', vim.diagnostic.goto_prev, {} },
        }
    },
    {
        "j-hui/fidget.nvim",
        opts = {
            notification = {
                window = {
                    -- winblend = 0 -- Background color opacity in the notification window
                }
            },
            integration = {
                ["nvim-tree"] = {
                    enable = true,
                },
            },
        },
        config = true
    }
}
