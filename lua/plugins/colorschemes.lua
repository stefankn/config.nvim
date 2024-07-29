--return {
--    {
--        "rebelot/kanagawa.nvim",
--        config = function()
--            vim.cmd.colorscheme("kanagawa-dragon")
--        end,
--    },
--}
--return {
--    {
--        "folke/tokyonight.nvim",
--        lazy = false,
--        priority = 0,
--        opts = {},
--        config = function()
--            vim.cmd("colorscheme tokyonight-night")
--        end,
--    },
--}
return {
    {
        "cocopon/iceberg.vim",
        lazy = false,
        priority = 0,
        config = function ()
            vim.cmd("colorscheme iceberg")
        end
    }
}
