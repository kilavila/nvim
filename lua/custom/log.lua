local util = require("custom.util")

M = {}

M.cword = function()
	local current = util.get_current()
	local print_string

	if current.file_type == "lua" then
		print_string = "print('" .. current.cursor_word .. ": ', " .. current.cursor_word .. ")"
	elseif current.file_type == "js" or current.file_type == "ts" then
		print_string = "console.log('" .. current.cursor_word .. ": ', " .. current.cursor_word .. ")"
	elseif current.file_type == "sh" then
		print_string = "printf('" .. current.cursor_word .. ": ', " .. current.cursor_word .. ")"
	end

	vim.api.nvim_buf_set_lines(current.buffer, current.line, current.line, false, { print_string })
end

return M
