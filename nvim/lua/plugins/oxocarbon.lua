return {
    "nyoom-engineering/oxocarbon.nvim",
    lazy = false, -- load this during startup
    priority = 6969, -- load this before all the other start plugins
    config = function()
        -- load the colorscheme here
        vim.opt.background = "dark" -- set this to dark or light
        vim.cmd.colorscheme "oxocarbon"
        -- transparency
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" }) -- non-active windows 
        --vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" }) -- floating windows
    end
}
