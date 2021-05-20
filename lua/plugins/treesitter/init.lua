require'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "typescript", "tsx", "javascript", "lua", "css", "html", "go", "graphql"
    },

    indent = {enable = true},

    highlight = {enable = true},

    refactor = {highlight_definitions = {enable = true}},

    playground = {enable = true},

    autotag = {enable = true},

    rainbow = {enable = false, extended_mode = false, max_file_lines = 500},

    context_commentstring = {enable = true}
}

