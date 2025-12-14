return {
  dir = vim.fn.stdpath("config") .. "/lua/plugins/local/mini-toggleterm",
  name = "mini-toggleterm",
  config = function()
    require("mini-toggleterm").setup()
  end,
}

