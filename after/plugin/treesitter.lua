local ok1, treesitter = pcall(require, "nvim-treesitter.configs")
local ok2, autopair = pcall(require, "nvim-autopairs")
local ok3, autotag = pcall(require, "nvim-ts-autotag")
if not (ok1 and ok2 and ok3) then
	return
end

autotag.setup({})
autopair.setup({})

treesitter.setup {
  ensure_installed = { "c", "lua", "rust", "cpp", "javascript", "typescript", "vim" },
  sync_install = false,
  --auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
	  enable = true
  }
}
