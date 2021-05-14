require("which-key").setup {
    plugins = {marks = flase},
    presets = {
        operators = false,
        motions = false,
        text_objects = false,
        windows = false
    },
    window = {
        border = "single" -- none, single, double, shadow
    }
}
