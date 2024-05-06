return{
    "nvim-telescope/telescope.nvim", 
    branch = "0.1.x",
    lazy = false,
    dependencies = {
        "nvim-lua/plenary.nvim",
        {"nvim-telescope/telescope-fzf-native.nvim", build = "make"},
        "nvim-tree/nvim-web-devicons",
    },
    config = function ()
        local telescope = require("telescope")
        local actions = require("telescope.actions")

        telescope.setup({
            defaults = {
                path_display = {"truncate"},
                mappings = {
                    i = {
                        ["<C-K>"] = actions.move_selection_previous,
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                    },
                },
            },
        })
    end,
}
