return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "folke/lazydev.nvim",
      ft = "lua",
      opts = {
	library = {
	  -- see the configuration section for more details
	  -- Load luvit types when the vim.uv word is found
	  { path = "${3rd}/luv/library", words = { "vim%.uv" } },
	},
      },
    },
    config = function()
      require("lspconfig").lua_ls.setup {}
    end
  }
}
