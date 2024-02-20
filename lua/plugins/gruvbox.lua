return{ 
    -- "luisiacc/gruvbox-baby",
    "sainnhe/gruvbox-material",
    -- "ellisonleao/gruvbox.nvim", 
    -- "morhetz/gruvbox",
    lazy = false,
    priority = 1000, 
    config = function()
	    -- vim.cmd('colorscheme gruvbox-baby')
	    vim.cmd('colorscheme gruvbox-material')
	    -- vim.cmd('colorscheme gruvbox')
    end,
}
