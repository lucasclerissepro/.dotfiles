-- Refactoring is an awesome plugin make by ThePrimeagen that implements
-- IDE refactoring features directly within VIM trough treesitter.

require('refactoring').setup({
    prompt_func_return_type = {
        go = true,
        java = true,
        cpp = true,
        c = true,
        h = true,
        hpp = true,
        cxx = true,
    },
    prompt_func_param_type = {
        go = true,
        java = true,
        cpp = true,
        c = true,
        h = true,
        hpp = true,
        cxx = true,
    },

    printf_statements = {},
    print_var_statements = {},
})


-- load refactoring Telescope extension
require("telescope").load_extension("refactoring")

-- remap to open the Telescope refactoring menu in visual mode
vim.api.nvim_set_keymap(
    "v",
    "<leader>rr",
    "<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>",
    { noremap = true }
)
