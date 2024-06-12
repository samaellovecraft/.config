return {
    "nvimtools/none-ls.nvim",
    enabled = false,
    dependencies = {
        "nvimtools/none-ls-extras.nvim"
    },
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {

            }
        })
    end,
    keys = {
        { '<leader>gf', vim.lsp.buf.format, {} }
    }
}
