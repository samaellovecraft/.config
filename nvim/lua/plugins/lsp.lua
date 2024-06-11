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
                                        globals = { "vim" }
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
    }
}
