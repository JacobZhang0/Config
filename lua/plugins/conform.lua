return {
    "stevearc/conform.nvim",
    opts = {
        format_on_save = {
            timeout_ms = 1000,
            lsp_fallback = true,
        },
        formatters_by_ft = {
            lua = { "stylua" },
            cpp = { "clang_format" },
            c = { "clang_format" },
        },
        formatters = {
            clang_format = {
                command = "clang-format",
                args = {
                    "--assume-filename", "$FILENAME", -- makes it use correct language mode
                    "--style", "{BasedOnStyle: Google, IndentWidth: 4, ColumnLimit: 100}"
                },
                stdin = true,
            },
        },
    },
    keys = {
        { "<leader>gf", function() require("conform").format({ async = true }) end, desc = "Format file" },
    },
}
