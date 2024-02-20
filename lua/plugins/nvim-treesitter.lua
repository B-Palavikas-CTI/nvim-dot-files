
local config = function()
require("nvim-treesitter.configs").setup({

    indent = {
        enable = true,
    },
    autotag = {
        enable = true,
    },
    ensure_installed = {
        "markdown",
        "json",
        "yaml",
        "bash",
        "lua",
        "gitignore",
        "dockerfile",
        "python",
        "go",
        "c",
        "cpp",
        "vim",
        "verilog",
        "bitbake",
        "cmake",
        "make",
        "latex",
        "doxygen",
        "ninja",
        "rust",
        "sql",
        "zig",
    },
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = true,
    },
})
end

return{
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    config = config
}
