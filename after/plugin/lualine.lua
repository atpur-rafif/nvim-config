local ok1, lualine = pcall(require, "lualine")
local ok2, navic = pcall(require, "nvim-navic")
if not (ok1 and ok2) then
	return
end

lualine.setup({
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  winbar = {
	  lualine_a = {{
		  function()
			  local loc = navic.get_location()
			  if (loc ~= "")
			  then
				return loc
			  else
				return " "
			  end
		  end,
		  cond = navic.is_available,
		  color = { bg='#262626' }
	  }}
  }
})
