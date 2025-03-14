return {
  "stevearc/conform.nvim",
  config = function()
    ---@param bufnr integer
    ---@param ... string
    ---@return string
    local function first(bufnr, ...)
      local conform = require("conform")
      for i = 1, select("#", ...) do
        local formatter = select(i, ...)
        if conform.get_formatter_info(formatter, bufnr).available then
          return formatter
        end
      end
      return select(1, ...)
    end

    require("conform").setup({
      keys = {
        {
          -- Customize or remove this keymap to your liking
          "<leader>fo",
          function()
            require("conform").format({ async = true })
          end,
          mode = "n",
          desc = "Format buffer",
        },
      },
      notify_no_formatters = true,
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black" },
        ruby = { "rubocop" },
        -- Conform will run multiple formatters sequentially
        go = { "goimports", "gofmt" },
        javascript = function(bufnr)
          return { first(bufnr, "prettierd", "prettier"), stop_after_first = true }
        end,
        javascriptreact = function(bufnr)
          return { first(bufnr, "prettierd", "prettier"), stop_after_first = true }
        end,
        typescript = function(bufnr)
          return { first(bufnr, "prettierd", "prettier"), stop_after_first = true }
        end,
        typescriptreact = function(bufnr)
          return { first(bufnr, "prettierd", "prettier"), stop_after_first = true }
        end,
        markdown = function(bufnr)
          return { first(bufnr, "prettierd", "prettier"), "injected" }
        end,
        html = function(bufnr)
          return { first(bufnr, "prettierd", "prettier"), stop_after_first = true }
        end,
        css = function(bufnr)
          return { first(bufnr, "prettierd", "prettier"), stop_after_first = true }
        end,
        scss = function(bufnr)
          return { first(bufnr, "prettierd", "prettier"), stop_after_first = true }
        end,
        -- Use the "*" filetype to run formatters on all filetypes.
        ["*"] = { "codespell" },
        -- Use the "_" filetype to run formatters on filetypes that don't
        -- have other formatters configured.
        ["_"] = { "trim_whitespace" },
      },
      default_format_opts = {
        lsp_format = "disable",
      },
      format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 5000,
        lsp_fallback = false,
      },
      init = function()
        -- If you want the formatexpr, here is the place to set it
        vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
      end,
    })
  end,
}
