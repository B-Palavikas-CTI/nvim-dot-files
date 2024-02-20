-- set the lazypath 
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- if lazypath issue then pull from github 
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git";
	"clone",
	"--filter=blob:none",
	"https://github.com/folke/lazy.nvim.git",
	"--branch=stable",
	lazypath,
    })
end
-- insatll
vim.opt.rtp:prepend(lazypath)

-- include global
require('config.globals')
require('config.options')
require('config.keymaps')

local opts = {
    defaults = {
        lazy = true,
    },
    install = {
	    colorscheme = {'gruvbox'}
    },
    rtp = {
        disabled_plugins = {
    "gzip",
    "matchit",
    "matchparen",
    "netrwPlugin",
    "netrw",
    "tarPlugin",
    "tohtml",
    "tutor",
    "zipPlugin",
    	}
    },
    change_direction = {
	    notify = false,
    },
}

-- 
require("lazy").setup('plugins', opts)

