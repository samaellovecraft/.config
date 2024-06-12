return {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
        -- add any options here
    },
    dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify"
    },
    config = function ()
        require("notify").setup({
            -- transparency
            background_colour = "#000000"
        })
        require("noice").setup({
            lsp = {
                -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
                },
            },
            presets = {
                --bottom_search = true, -- use a classic bottom cmdline for search
                --command_palette = true, -- position the cmdline and popupmenu together
                long_message_to_split = true, -- long messages will be sent to a split
                --inc_rename = false, -- enables an input dialog for inc-rename.nvim
                --lsp_doc_border = true, -- add a border to hover docs and signature help
            },
        })
    end,
    keys = {
        { "<leader>nl", function() require("noice").cmd("last") end },
        { "<leader>nh", function() require("noice").cmd("history") end },
    }
}
