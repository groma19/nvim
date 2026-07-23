return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "mistweaverco/kulala.nvim",
    ft = { "http", "rest" },
    keys = {
      {
        "<leader>kr",
        function()
          require("kulala").run()
        end,
        desc = "Kulala: Run request",
      },
      {
        "<leader>ka",
        function()
          require("kulala").run_all()
        end,
        desc = "Kulala: Run all requests",
      },
      {
        "<leader>kl",
        function()
          require("kulala").replay()
        end,
        desc = "Kulala: Replay last request",
      },
    },
    config = function()
      require("kulala").setup {
        -- optional config
      }
    end,
  },
  {
    "mfussenegger/nvim-dap",
    keys = {
      {
        "<leader>db",
        function()
          require("dap").toggle_breakpoint()
        end,
        desc = "DAP: Breakpoint",
      },
      {
        "<leader>dc",
        function()
          require("dap").continue()
        end,
        desc = "DAP: Continue",
      },
      {
        "<leader>do",
        function()
          require("dap").step_over()
        end,
        desc = "DAP: Step Over",
      },
      {
        "<leader>di",
        function()
          require("dap").step_into()
        end,
        desc = "DAP: Step Into",
      },
      {
        "<leader>du",
        function()
          require("dap").step_out()
        end,
        desc = "DAP: Step Out",
      },
      {
        "<leader>dt",
        function()
          require("dap").terminate()
        end,
        desc = "DAP: Terminate",
      },
    },
    config = function()
      local dap = require "dap"
      dap.adapters.codelldb = {
        type = "server",
        port = "${port}",
        executable = {
          command = vim.fn.stdpath "data" .. "/mason/bin/codelldb",
          args = { "--port", "${port}" },
        },
      }
      dap.configurations.cpp = {
        {
          name = "Launch",
          type = "codelldb",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/build/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
        },
      }
      dap.configurations.c = dap.configurations.cpp
    end,
  },
  {
    "Civitasv/cmake-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    ft = { "cpp", "c", "cmake" },
    opts = {
      cmake_build_directory = "build",
      cmake_generate_options = { "-DCMAKE_EXPORT_COMPILE_COMMANDS=1" },
    },
    keys = {
      { "<leader>cg", "<cmd>CMakeGenerate<cr>", desc = "CMake Generate" },
      { "<leader>cb", "<cmd>CMakeBuild<cr>", desc = "CMake Build" },
      { "<leader>cr", "<cmd>CMakeRun<cr>", desc = "CMake Run" },
      { "<leader>cd", "<cmd>CMakeDebug<cr>", desc = "CMake Debug" },
    },
  },
  {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    config = function()
      require("dap-go").setup()
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },
    event = "VeryLazy",
    keys = {
      {
        "<leader>dui",
        function()
          require("dapui").toggle()
        end,
        desc = "DAP UI Toggle",
      },
    },
    config = function()
      local dap = require "dap"
      local dapui = require "dapui"

      dapui.setup()

      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end

      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end

      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
  {
    "S1M0N38/love2d.nvim",
    version = "3.*",
    event = "VeryLazy",
    opts = { lsp = false }, -- we configure lua_ls ourselves
    keys = {
      { "<leader>lr", "<cmd>Love run<cr>", desc = "Run LÖVE" },
      { "<leader>lw", "<cmd>Love watch<cr>", desc = "Watch LÖVE" },
      { "<leader>ls", "<cmd>Love stop<cr>", desc = "Stop LÖVE" },
      { "<leader>li", "<cmd>Love info<cr>", desc = "Info LÖVE" },
      { "<leader>lo", "<cmd>Love output<cr>", desc = "Output panel" },
    },
  },
  {
    "windwp/nvim-ts-autotag",
    event = { "BufReadPre", "BufNewFile" },
    ft = {},
    opts = {},
  },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "c",
        "cpp",
        "cmake",
        "vim",
        "lua",
        "vimdoc",
        "go",
        "gomod",
        "gowork",
        "json",
        "sql",
        "bash",
        "markdown",
        "yaml",
        "toml",
        "dockerfile",
        "javascript",
        "typescript",
        "tsx",
        "html",
        "css",
      },
    },
  },
}
