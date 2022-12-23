local ok, bufferline = pcall(require, "bufferline")
if not ok then
	return
end

vim.keymap.set("n", "<M-H>", ":BufferLineCyclePrev<CR>", {})
vim.keymap.set("n", "<M-L>", ":BufferLineCycleNext<CR>", {})

function dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end

bufferline.setup{
	options = {
		show_buffer_close_icons = false,
		separator_style = "slant",
		offsets = {
			{ filetype = "neo-tree", text = "Explorer", padding = 1 }
		},
		custom_filter = function(buf_number, _)
			if vim.bo[buf_number].buftype == 'terminal' then
				return false
			end

			return true
		end
	}
}
