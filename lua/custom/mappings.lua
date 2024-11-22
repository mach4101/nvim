local M = {}


M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line"
    },
    ["<leader>dc"] = {
      "<cmd> DapContinue <CR>",
      "start debug"
    },
    ["<leader>dn"] = {
      "<cmd> DapStepOver <CR>",
      "step over"
    },
    ["<leader>di"] = {
      "<cmd> DapStepInto <CR>",
      "step into"
    },["<leader>do"] = {
      "<cmd> DapStepOut <CR>",
      "step out"
    },["<leader>dt"] = {
      "<cmd> DapTerminate <CR>",
      "terminate debug"
    },
    ["<leader>dus"] = {
      function ()
        local widgets = require('dap.ui.widgets');
        local sidebar = widgets.sidebar(widgets.scopes);
        sidebar.open();
      end,
      "Open debugging sidder"
    },
    ["<leader>dr"] = {
      "<cmd> DapContinue <CR>",
      "Start or continue the debugger",
    },
    ["gD"] = {
      function()
        vim.lsp.buf.declaration()
      end,
      "LSP declaration",
    },

    ["gd"] = {
      function()
        vim.lsp.buf.definition()
      end,
      "LSP definition",
    },

    ["K"] = {
      function()
        vim.lsp.buf.hover()
      end,
      "LSP hover",
    },

    ["gi"] = {
      function()
        vim.lsp.buf.implementation()
      end,
      "LSP implementation",
    },

    ["<leader>ls"] = {
      function()
        vim.lsp.buf.signature_help()
      end,
      "LSP signature help",
    },

    ["<leader>D"] = {
      function()
        vim.lsp.buf.type_definition()
      end,
      "LSP definition type",
    },
    ["<leader>ch"] = {
      "<cmd> ChatGPT <CR>",
      "open chatgpt session",
    },
    -- ["<leader>chi"] = {
    --   "<cmd> ChatGPTEditWithInstructions <CR>",
    --   "open chatgpt edit with instructions",
    -- },
    ["<leader>cc"] = {
      "<cmd> ChatGPTCompleteCode <CR>",
      "open chatgpt code completion",
    },
  }
}

M.dap_go = {
  plugin = true,
  n = {
    ["<leader>dgt"] = {
      function()
        require('dap-go').debug_test()
      end,
      "Debug go test"
    },
    ["<leader>dgl"] = {
      function ()
        require('dap-go').dubug_last()
      end,
      "Debug last go test"
    },
  }
}

M.dap_python = {
  plugin = true,
  n = {
    ["<leader>dpr"] = {
      function()
        require('dap-python').test_method()
      end
    }
  }
}

M.gopher = {
  plugin = true,
  n = {
    ["<leader>gsj"] = {
      "<cmd> GoTagAdd json <CR>",
      "Add json struct tags"
    },
    ["<leader>gsy"] = {
      "<cmd> GoTagAdd yaml <CR>",
      "Add yaml struct tags"
    },
    ["<leader>gerr"] = {
      "<cmd> GoIfErr <CR>",
      "generate if err statement"
    },
  }
}

return M
