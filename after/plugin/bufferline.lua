local ok, bufferline = pcall(require, "bufferline")
if not ok then
	return
end

vim.keymap.set("n", "<M-H>", ":BufferLineCyclePrev<CR>", {})
vim.keymap.set("n", "<M-L>", ":BufferLineCycleNext<CR>", {})

bufferline.setup{
	options = {
		show_buffer_close_icons = false,
		separator_style = "slant",
		offsets = {
			{ filetype = "neo-tree", text = "Explorer", padding = 1 }
		}
	}
}
