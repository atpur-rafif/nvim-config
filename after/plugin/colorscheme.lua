local ok, vscode = pcall(require, 'vscode')
if not ok then
	return 
end

local c = require('vscode.colors')
vscode.setup({
    transparent = true,
    italic_comments = true,
    disable_nvimtree_bg = true,
    color_overrides = {
        vscLineNumber = '#FFFFFF',
    },
    group_overrides = {
        Cursor = { fg=c.vscDarkBlue, bg=c.vscLightGreen, bold=true },
    }
})

vim.o.background = 'dark'
vim.cmd([[

colorscheme vscode
hi BufferLineFill guibg=#101010
hi BufferLineBackground guifg=#5a5a5a

]])
