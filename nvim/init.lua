require("base")

if jit.os == "Linux" then
    vim.g.python3_host_prog = vim.fn.expand("~/.pyenv/versions/py3nvim/bin/python")
else
    vim.g.python3_host_prog = vim.fn.expand("~/.pyenv/pyenv-win/versions/py3nvim/Scripts/python")
end

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = "plugins",
    change_detection = { notify = false },
    install = {
        missing = true,
        colorscheme = { "oxocarbon" },
    }
})
