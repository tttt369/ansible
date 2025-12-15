return {
    dir = vim.fn.stdpath("config"),
    config = function()
	require("toggle_terminal").setup()
    end,
}

