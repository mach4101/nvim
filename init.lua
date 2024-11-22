require "core"

local custom_init_path = vim.api.nvim_get_runtime_file("lua/custom/init.lua", false)[1]

if custom_init_path then
  dofile(custom_init_path)
end

require("core.utils").load_mappings()

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

-- bootstrap lazy.nvim!
if not vim.loop.fs_stat(lazypath) then
  require("core.bootstrap").gen_chadrc_template()
  require("core.bootstrap").lazy(lazypath)
end

dofile(vim.g.base46_cache .. "defaults")
vim.opt.rtp:prepend(lazypath)
require "plugins"


-- 保存原始的 vim.notify 函数
local original_notify = vim.notify

-- 创建自定义的 vim.notify 函数
vim.notify = function(msg, level, opts)
  -- 定义要过滤的插件关键字
  local ignore_plugins = {
    "which-key",
    -- "null-ls"
  }

  -- 检查消息是否包含要忽略的插件名称
  for _, plugin in ipairs(ignore_plugins) do
    if msg:find(plugin, 1, true) then
      return  -- 忽略此消息
    end
  end

  -- 调用原始的 vim.notify 函数显示其他消息
  original_notify(msg, level, opts)
end


local wk = require("which-key")

wk.register({
  c = {
    name = "ChatGPT",
    a = { "<cmd>ChatGPTRun add_tests<CR>", "Add Tests" },
    d = { "<cmd>ChatGPTRun docstring<CR>", "Docstring" },
    e = { "<cmd>ChatGPTEditWithInstruction<CR>", "Edit with instruction" },
    -- c = { "<cmd>ChatGPTCompleteCode<CR>", "complete code"},
    f = { "<cmd>ChatGPTRun fix_bugs<CR>", "Fix Bugs" },
    g = { "<cmd>ChatGPTRun grammar_correction<CR>", "Grammar Correction" },
    k = { "<cmd>ChatGPTRun keywords<CR>", "Keywords" },
    l = { "<cmd>ChatGPTRun code_readability_analysis<CR>", "Code Readability Analysis" },
    o = { "<cmd>ChatGPTRun optimize_code<CR>", "Optimize Code" },
    r = { "<cmd>ChatGPTRun roxygen_edit<CR>", "Roxygen Edit" },
    s = { "<cmd>ChatGPTRun summarize<CR>", "Summarize" },
    t = { "<cmd>ChatGPTRun translate<CR>", "Translate" },
    x = { "<cmd>ChatGPTRun explain_code<CR>", "Explain Code" },
  },
}, { prefix = "<leader>" })

