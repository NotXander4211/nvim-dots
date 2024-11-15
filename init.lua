vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

require("luasnip.loaders.from_vscode").load_standalone({path = "a.code-snippets"})
require("luasnip.loaders.from_vscode").load({paths = "c:/Users/Helio/AppData/Local/nvim/lua/configs"})
local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local extras = require("luasnip.extras")
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet
local ms = ls.multi_snippet
local k = require("luasnip.nodes.key_indexer").new_key
ls.add_snippets("html", {s("<!str>", { t({"<!DOCTYPE html>","<head>","<link rel='stylesheet' href='style.css'>","</head>","<body>", ""}), i(0), t({"","</body>"}) })})
ls.add_snippets("css", {s("!mar", { t("margin-top: "), i(1), t(";"), t({"","margin-bottom: "}), i(2), t(";"), t({"","margin-left: "}), i(3), t(";"), t({"","margin-right: "}), i(4), t(";"), t({"", ""}), i(0) })})
ls.add_snippets("css", {s("!pad", { t("padding-top: "), i(1), t(";"), t({"","padding-bottom: "}), i(2), t(";"), t({"","padding-left: "}), i(3), t(";"), t({"","padding-right: "}), i(4), t(";"), t({"", ""}), i(0) })})
ls.add_snippets("css", {s("!font", { t("font-family: "), i(1), t(";"), t({"","font-size: "}), i(2), t(";"), t({"","font-weight: "}), i(3), t(";"), t({"", ""}), i(0) })})
-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)
