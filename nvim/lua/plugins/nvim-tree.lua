return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    keys = {
        {"<leader>t", ":NvimTreeToggle<cr>"}
    },
    config = function()
        require("nvim-tree").setup({
            view = {
                side = "right"
            }
        })
        -- transparency
        vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "none" })
    end,
}
